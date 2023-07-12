import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../../application/interface/i_defeat_repository.dart';
import '../../../domain/defeat/defeat.dart';
import 'repository_base.dart';

class DefeatRepository extends IDefeatRepository {
  late final RepositoryBase _base;

  DefeatRepository() {
    debugPrint('RepositoryBase');
    _base = RepositoryBase();
  }

  Future<IsarCollection<Defeat>> getCategory() async {
    Isar isar = await _base.getIsar();
    return isar.defeats;
  }

  @override
  Future<void> insert(Defeat data) async {
    insertAll([data]);
  }

  @override
  Future<void> insertAll(List<Defeat> datas) async {
    await _base.put(await getCategory(), datas);
  }

  @override
  Future<Defeat?> getDefeat() async {
    final IsarCollection<Defeat> collection = await getCategory();
    debugPrint('collection: ${await collection.count()}');
    debugPrint('collection: ${await collection.where().count()}');
    return await collection.where().findFirst();
  }
}
