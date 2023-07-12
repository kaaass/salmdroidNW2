import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salmdroidnw2/util/converter/defeat_converter.dart';
import 'package:salmdroidnw2/util/converter/king_defeat_converter.dart';

import '../application/app_data_instractor.dart';
import '../application/common_utility.dart';
import '../application/interface/i_coopdetail_repository.dart';
import '../application/interface/i_defeat_repository.dart';
import '../application/interface/i_king_defeat_repository.dart';
import '../application/interface/i_shift_repository.dart';
import '../domain/coop_history_detail/coop_history_detail.dart';
import '../domain/defeat/defeat.dart';
import '../domain/king_defeat/king_defeat.dart';
import '../domain/salmonrun_data/common.dart';
import '../domain/shift/shift.dart';
import '../domain/state/data_state.dart';
import '../util/log.dart';

class DataInteractor extends ChangeNotifier {
  ICoopDetailRepository coopDetailRepository;
  IShiftRepository shiftRepository;
  IDefeatRepository defeatRepository;
  IKingDefeatRepository kingDefeatRepository;
  AppDataInteractor appDataInteractor;

  Defeat? _defeatInfo;
  KingDefeat? _kingDefeatInfo;
  bool isUpdating = false;
  bool _isFinishTableInit = false;
  final DataState _state = DataState();
  final List<Shift> _futureSchedule = [];
  bool _isFutureScheduleLoading = false;
  final bool _isNeedShiftUpdate = true;

  DataInteractor({
    required this.shiftRepository,
    required this.coopDetailRepository,
    required this.defeatRepository,
    required this.kingDefeatRepository,
    required this.appDataInteractor,
  });

  void requestUpdate() {
    notifyListeners();
  }

  void _setDataState(Type t, int n, int m) {
    _state.type = t;
    _state.now = n;
    _state.max = m;
  }

  DataState getDataState() {
    return _state;
  }

  Future<void> deleteAll() async {
    coopDetailRepository.drop();
    shiftRepository.drop();
  }

  Future<void> waitTableCreated() async {
    _isFinishTableInit = true;
  }

  Future<List<Shift>> loadAllShifts() async {
    var shifts = await shiftRepository.getShifts();
    Log.i('shifts.length: ${shifts.length}');

    shifts.sort((a, b) => a.start.compareTo(b.start));
    return shifts.reversed.toList();
  }

  Future<int> loadJobNum() async {
    List<String> ids = await coopDetailRepository.getAllJobId();
    return ids.length;
  }

  Future<List<CoopHistoryDetail>> loadResultsByShift(String start, String? end,
      [String rule = 'REGULAR']) async {
    var results =
        await coopDetailRepository.getJobResults(start: start, end: end);
    Log.i('results.length: ${results.length}');

    return results;
  }

  Future<List<CoopHistoryDetail>> loadPrivateJobs() async {
    List<CoopHistoryDetail> histroies = [];

    // var stream = getStreamOfResults();
    // await for (CoopHistoryDetail history in stream) {
    //   if (history.CoopHistoryDetailDetail.afterGrade == null &&
    //       !CommonUtil.isRuleTeamContest(history.CoopHistoryDetailDetail.rule)) {
    //     histroies.add(history);
    //   }
    // }

    histroies.sort(
      (a, b) {
        return a.playedTime.compareTo(b.playedTime) * -1;
      },
    );

    return histroies;
  }

  Future<String> getLatestJob() async {
    // if (user != null) {
    //   Defeat d = await loadDefeat(user);
    //   var data = await coopDetailRepository.getJobResultById(d.latestId);
    //   if (data != null) {
    //     CoopHistoryDetail history = CoopHistoryDetail.local(data);
    //     return history.playedTime;
    //   }
    // }
    return '';
  }

  Future<int> getCount() async {
    return coopDetailRepository.getCount();
  }

  Future<List<CoopHistoryDetail>> getJobResultsLimit(
      {required int limit, int? offset}) {
    return coopDetailRepository.getJobResultsLimit(
        limit: limit, offset: offset);
  }

  Future<int> getNumOfJobs() async {
    Log.i('getNumOfRegularJobs()');
    await waitTableCreated();
    int ret = await coopDetailRepository.getCount();
    Log.i('getNumOfRegularJobs: $ret');
    return ret;
  }

  Stream<CoopHistoryDetail> getStreamOfResults() async* {
    const int limit = 500;
    int offset = 0;

    int datanum = await coopDetailRepository.getCount();

    while (offset < datanum) {
      var details = await coopDetailRepository.getJobResultsLimit(
          limit: limit, offset: offset);
      for (var detail in details) {
        yield detail;
      }
      offset += details.length;
    }
  }

  Future<void> calcAllData() async {
    await calcForShiftData();
  }

  Future<void> calcForShiftData() async {
    Log.i('calcForShiftData');
    await waitTableCreated();
    var shifts = await loadAllShifts();

    List<Shift> newBatches = [];
    for (var shift in shifts) {
      List<CoopHistoryDetail> details =
          await loadResultsByShift(shift.start, shift.end, shift.rule);
      String maxGradeId = '';
      int maxGrade = 0;
      int played = 0;
      int maxEggs = 0;
      String king = '';
      // for (CoopHistoryDetail detail in details) {
      //   if (detail.CoopHistoryDetailDetail.myResult.weapons.isEmpty) {
      //     continue;
      //   }
      //   played++;

      //   if (detail.CoopHistoryDetailDetail.afterGrade != null) {
      //     if (CommonUtil.isUpdateGrade(
      //       maxGradeId,
      //       maxGrade,
      //       detail.CoopHistoryDetailDetail.afterGrade!.id,
      //       detail.CoopHistoryDetailDetail.afterGradePoint!,
      //     )) {
      //       maxGradeId = detail.CoopHistoryDetailDetail.afterGrade!.id;
      //       maxGrade = detail.CoopHistoryDetailDetail.afterGradePoint!;
      //     }
      //   }

      //   int eggs = 0;
      //   for (var wave in detail.CoopHistoryDetailDetail.waveResults) {
      //     eggs += wave.teamDeliverCount ?? 0;
      //   }
      //   if (maxEggs < eggs) {
      //     maxEggs = eggs;
      //   }

      //   if (detail.CoopHistoryDetailDetail.bossResult != null) {
      //     king = detail.CoopHistoryDetailDetail.bossResult!.boss.id;
      //   }
      // }
      if (shift.maxGradeId != maxGradeId ||
          shift.maxGradePoint != maxGrade ||
          shift.played != played ||
          shift.maxEggs != maxEggs ||
          shift.kingSalmonids != king) {
        Shift newShift = shift;
        newShift.maxGradeId = maxGradeId;
        newShift.maxGradePoint = maxGrade;
        newShift.played = played;
        newShift.maxEggs = maxEggs;
        newShift.kingSalmonids = king;

//        newBatches.add(newShift.toMap());
      }
    }
    await shiftRepository.insertAll(newBatches);
    Log.i('calcForShiftData end');
  }

  Future<void> saveShiftData(Shift shift) async {
    shiftRepository.insert(shift);
  }

  Future<List<Shift>> getFutureSchedule() async {
    while (_isFutureScheduleLoading) {
      await Future.delayed(const Duration(seconds: 1));
    }
    return [..._futureSchedule];
  }

  Future<List<Shift>> loadFutureSchedule(
      String appName, String appVersion) async {
    Log.i('getFutureSchedule');
    _isFutureScheduleLoading = true;
    // List<Shift> allShifts = await ShiftSchedule.getSchedule(appName, appVersion);
    List<Shift> allShifts = [];
    DateTime now = DateTime.now().toUtc();

    List<Shift> futures = [];
    for (var shift in allShifts) {
      DateTime shiftEnd = DateTime.parse(shift.end).toUtc();
      if (shiftEnd.isAfter(now)) {
        futures.add(shift);
      }
    }

    futures.sort(
      (a, b) {
        return a.start.compareTo(b.start) * -1;
      },
    );

    _futureSchedule.clear();
    _futureSchedule.addAll(futures);
    _isFutureScheduleLoading = false;
    Log.i('getFutureSchedule end: ${_futureSchedule.length}');
    return _futureSchedule;
  }

  Future<Defeat> loadDefeat() async {
    Log.i('loadDefeat()');
    var rawdata = await defeatRepository.getDefeat() ??
        DefeatConverter.createEmptyDefeat();
    Log.i('loadDefeat() rawdata: ${rawdata.id}');
    return rawdata;
  }

  Future<KingDefeat> loadKingDefeat() async {
    Log.i('loadKingDefeat()');
    var rawdata = await kingDefeatRepository.getKingDefeat() ??
        KingDefeatConverter.createEmptyKingDefeat();
    Log.i('loadKingDefeat() rawdata: ${rawdata.id}');
    return rawdata;
  }

  Future<void> calcForAllData() async {
    Log.i('calcForAllData()');
    var stream = getStreamOfResults();
    await calc(stream);
  }

  Future<void> update(
      Defeat old, KingDefeat oldKing, List<CoopHistoryDetail> histories) async {
    isUpdating = true;
    _defeatInfo = old;
    _kingDefeatInfo = oldKing;
    for (var history in histories) {
      _calc(history);
    }
    fix();
  }

  Future<void> calc(Stream stream) async {
    _defeatInfo = DefeatConverter.createEmptyDefeat();
    _kingDefeatInfo = KingDefeatConverter.createEmptyKingDefeat();
    isUpdating = true;

    await for (CoopHistoryDetail history in stream) {
      _calc(history);
    }

    fix();
  }

  void fix() {
    if (_defeatInfo != null) {
      Log.i('fix: ${_defeatInfo!.id}');
      defeatRepository.insert(_defeatInfo!);
    }
    if (_kingDefeatInfo != null) {
      Log.i('fix: ${_kingDefeatInfo!.id}');
      kingDefeatRepository.insert(_kingDefeatInfo!);
    }
    isUpdating = false;
  }

  void _calc(CoopHistoryDetail history) {
    bool isTarget = false;
    if (history.afterGrade == null) {
      if (CommonUtil.isRuleTeamContest(history.rule)) {
        isTarget = true;
      }
    } else {
      if (CommonUtil.isRuleRegular(history.rule) ||
          CommonUtil.isRuleBigRun(history.rule)) {
        isTarget = true;
      }
    }
    if (isTarget) {
      // for salmonids
      Map<String, int> defeatMap =
          DefeatConverter.createMapFromData(_defeatInfo!);
      _getDefeatalmonids(history).forEach((key, value) {
        defeatMap[key] = (defeatMap[key] ?? 0) + value;
      });

      // for king salmonids
      Map<String, int> kingDefeatMap =
          KingDefeatConverter.createMapFromData(_kingDefeatInfo!);
      if (history.bossResult != null) {
        if (history.bossResult!.hasDefeatBoss) {
          String key = Common.getBossIdToIdxName(history.bossResult!.boss.id);
          kingDefeatMap[key] = (kingDefeatMap[key] ?? 0) + 1;
        }
      }

      _defeatInfo = DefeatConverter.createDefeatFromMap(defeatMap);
      _kingDefeatInfo =
          KingDefeatConverter.createKingDefeatFromMap(kingDefeatMap);

      _defeatInfo!.latestId = history.historyId;
      _defeatInfo!.num++;
      _kingDefeatInfo!.latestId = history.historyId;
      _kingDefeatInfo!.num++;
    }
  }

  Map<String, int> _getDefeatalmonids(CoopHistoryDetail detail) {
    Map<String, int> map = Defeat.createInitMap();
    for (var enemy in detail.enemyResults) {
      String key = Common.getBossIdToIdxName(enemy.enemy.id);
      map[key] = enemy.defeatCount;
    }
    return map;
  }
}
