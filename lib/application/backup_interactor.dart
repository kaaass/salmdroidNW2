import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../application/app_data_instractor.dart';
import '../application/data_interactor.dart';
import '../domain/app_data/backup.dart';
import '../domain/coop_history_detail/coop_history_detail.dart';
import '../domain/salmonrun_data/fix_schedule.dart';
import '../domain/salmonrun_data/rule.dart';
import '../domain/shift/shift.dart';
import '../util/converter.dart';
import '../util/log.dart';
import 'interface/i_coopdetail_repository.dart';
import 'interface/i_shift_repository.dart';

class BackupInteractor with ChangeNotifier {
  static const String _keyword = "S4LMDR01D&R3\$ULTS";

  BackupInteractor({
    required this.appDataInteractor,
    required this.dataInteractor,
    required this.shiftRepository,
    required this.coopDetailRepository,
  });

  final BackupStatus _backupStatus = BackupStatus();

  AppDataInteractor appDataInteractor;
  DataInteractor dataInteractor;
  IShiftRepository shiftRepository;
  ICoopDetailRepository coopDetailRepository;

  Digest _calcDigest(String data) {
    List<int> databody = utf8.encode(data.toString());
    var hmacSha256 = Hmac(sha256, utf8.encode(_keyword));
    var digest = hmacSha256.convert(databody);
    return digest;
  }

  Future<Uint8List> _decompress(Uint8List data) async {
    GZipDecoder gzip = GZipDecoder();
    List<int> compressed = gzip.decodeBytes(data);
    return Uint8List.fromList(compressed);
  }

  Future<bool> _checkSign(String sign, String body) async {
    return (_calcDigest(body).toString() == sign);
  }

  Future<String> unzip(Uint8List data) async {
    final archive = ZipDecoder().decodeBytes(data);
    Directory tmpDir =
        Directory('${(await getTemporaryDirectory()).path}/restore');
    if (tmpDir.existsSync()) {
      tmpDir.deleteSync(recursive: true);
    }

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('${tmpDir.path}/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('${tmpDir.path}/$filename').create(recursive: true);
      }
    }
    return tmpDir.path;
  }

  BackupStatus getBackupStatus() {
    return _backupStatus;
  }

  void resetState() {
    _backupStatus.now = 0;
    _backupStatus.shiftsNum = 0;
    _backupStatus.resultsNum = 0;
  }

  void _notify(BackupType type, int now, int shifts, int results) {
    _backupStatus.type = type;
    _backupStatus.now = now;
    _backupStatus.shiftsNum = shifts;
    _backupStatus.resultsNum = results;
    notifyListeners();
  }

  Future<bool> restoreV2(Uint8List orgData) async {
    Log.i('restoreV2');
    String dirPath = await unzip(orgData);

    Directory dir = Directory(dirPath);
    File summaryFile = File('${dir.path}/summary');
    var read = summaryFile.readAsStringSync();
    var summary = json.decode(read);
    int now = 0;

    for (var file in dir.listSync()) {
      if (file.path.indexOf('summary') > 0) {
        continue;
      }
      Log.i(file.path);
      File f = File(file.path);
      Map<String, dynamic>? decoded;
      String content = f.readAsStringSync();
      decoded = json.decode(content);
      if (decoded == null) {
        continue;
      }

      List<dynamic> shiftsTemp = [];
      List<dynamic> resultsTemp = [];
      bool checked = false;

      if (decoded['shifts'] != null) {
        checked = await _checkSign(decoded['sign'], decoded['shifts']);
      } else {
        checked = await _checkSign(decoded['sign'], decoded['results']);
      }

      Log.i('signed check: $checked');
      if (!checked) {
        dir.delete(recursive: true);
        return false;
      }

      int addNum = 0;
      if (decoded['shifts'] != null) {
        shiftsTemp = json.decode(decoded['shifts']);
        addNum = shiftsTemp.length;
      }
      if (decoded['results'] != null) {
        resultsTemp = json.decode(decoded['results']);
        addNum = resultsTemp.length;
      }
      await _innerRestore(
          shiftsTemp, resultsTemp, now, summary['shifts'], summary['results']);
      now += addNum;
    }

    dataInteractor.calcForAllData();
    dir.delete(recursive: true);
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  Future<bool> restore(Uint8List readData) async {
    Log.i('restore');

    _notify(BackupType.check, 0, 0, 0);

    final decompData = await _decompress(readData);
    Map<String, dynamic>? decoded = json.decode(utf8.decode(decompData));
    final checked = await _checkSign(decoded!['sign'], decoded['data']);
    if (checked) {
      Log.i('restore success');
      Map<String, dynamic> data = json.decode(decoded['data']);
      List<dynamic> shifts = data['shifts'];
      List<dynamic> results = data['results'];
      await _innerRestore(shifts, results, 0, shifts.length, results.length);
      dataInteractor.calcForAllData();
    } else {
      return false;
    }

    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  Future<void> _innerRestore(List<dynamic> shifts, List<dynamic> results, now,
      numShifts, numResults) async {
    Log.i('innerRestore');

    // shift
    List<Shift> shiftList = [];
    for (var shift in shifts) {
      Shift newShift = DataConverter.toShift(shift);

      if (newShift.rule == '') {
        bool isAdd = false;
        for (Map<String, dynamic> fix in FixSchedule.fixSchedule) {
          if (newShift.start == fix['start'] && newShift.end == fix['end']) {
            newShift.rule = fix['rule'];
            isAdd = true;
            break;
          }
        }

        if (!isAdd) {
          newShift.rule = Rule.regular.rawString;
        }
      }

      shiftList.add(newShift);
      now++;
      _notify(BackupType.restore, now, numShifts, numResults);
      await Future.delayed(const Duration(microseconds: 100));
    }
    if (shiftList.isNotEmpty) {
      await shiftRepository.insertAll(shiftList);
    }

    // results
    List<CoopHistoryDetail> histories = [];
    for (var d in results) {
      if (now % 1000 == 0) {
        Log.i('now: $now');
      }
      histories.add(DataConverter.toCoopHistoryDetail(d));

      now++;
      _notify(BackupType.restore, now, numShifts, numResults);
      await Future.delayed(const Duration(microseconds: 100));
    }
    if (histories.isNotEmpty) {
      await coopDetailRepository.insertAll(histories);
    }
  }
}
