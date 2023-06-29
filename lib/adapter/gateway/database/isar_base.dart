import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/coop_history_detail/coop_history_detail.dart';

class IsarBase {
  static final IsarBase _instance = IsarBase._();

  late final Isar? isar;

  IsarBase._() {
    getApplicationSupportDirectory().then((dir) {
      debugPrint(dir.path);
      return Isar.open([CoopHistoryDetailSchema], directory: dir.path);
    }).then((value) {
      isar = value;
    });
  }

  factory IsarBase() {
    return _instance;
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 10));

    //await Isar.initializeIsarCore(download: true);
    // 初期データを書き込む
    await isar!.writeTxn(() async {
      final categories = await isar!.coopHistoryDetails.where().findAll();

      final memos = <CoopHistoryDetail>[];
      final now = DateTime.now();
      Nameplate n = Nameplate()..badges = [];

      memos.add(CoopHistoryDetail()
        ..historyId = '2'
        ..rule = 'rule');

      await isar!.coopHistoryDetails.putAll(memos);
    });
  }
}
