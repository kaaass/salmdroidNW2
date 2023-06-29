import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salmdroidnw2/domain/defeat/defeat.dart';
import 'package:salmdroidnw2/domain/king_defeat/king_defeat.dart';
import 'package:salmdroidnw2/domain/shift/shift.dart';

import '../../../domain/coop_history_detail/coop_history_detail.dart';

class RepositoryBase {
  static final RepositoryBase _instance = RepositoryBase._();
  static Isar? _isar;

  RepositoryBase._();

  factory RepositoryBase() {
    return _instance;
  }

  Future<Isar> getIsar() async {
    if (_isar == null) {
      await open();
    }
    return _isar!;
  }

  Future<void> open() async {
    if (_isar == null || !_isar!.isOpen) {
      var dir = await getApplicationSupportDirectory();
      _isar = await Isar.open([
        CoopHistoryDetailSchema,
        ShiftSchema,
        DefeatSchema,
        KingDefeatSchema,
      ], directory: dir.path);
    }
  }

  Future<void> clear(IsarCollection<dynamic> collection) async {
    await collection.clear();
  }

  Future<void> clearAll() async {
    if (_isar != null) {
      await _isar!.clear();
    }
  }

  Future<void> put(
      IsarCollection<dynamic> collection, List<dynamic> list) async {
    if (_isar == null) {
      throw Exception('Not open DB.');
    }

    await _isar!.writeTxn(() async {
      await collection.putAll(list);
    });
  }

  Future<void> init() async {
    // _isar.clear();
    // while (_isar == null) {
    //   await Future.delayed(const Duration(seconds: 1));
    // }

    // // データがあれば何もしない
    // if (await _isar.categorys.count() > 0) {
    //   return;
    // }
    // // 初期データを書き込む
    // await _isar.writeTxn(() async {
    //   // カテゴリの初期データ
    //   await _isar.categorys.putAll(
    //     ['仕事', 'プライベート', 'その他'].map((name) => Category()..name = name).toList(),
    //   );
    //   final categories = await _isar.categorys.where().findAll();

    //   final memos = <CoopHistoryDetail>[];
    //   final now = DateTime.now();
    //   memos.add(
    //     CoopHistoryDetail()
    //       ..category.value = categories.firstWhere(
    //         (category) => true,
    //       )
    //       ..content = 'test contents'
    //       ..createdAt = now
    //       ..updatedAt = now,
    //   );

    //   await _isar.CoopHistoryDetails.putAll(memos);
    //   final saveCategories = memos.map((memo) => memo.category).toList();
    //   for (final saveCategory in saveCategories) {
    //     await saveCategory.save();
    //   }
    // });
  }
}
