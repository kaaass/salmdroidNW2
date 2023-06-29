import 'package:isar/isar.dart';

import '../../../application/interface/i_king_defeat_repository.dart';
import '../../../domain/king_defeat/king_defeat.dart';
import 'repository_base.dart';

class KingDefeatRepository extends IKingDefeatRepository {
  late final RepositoryBase _base;

  KingDefeatRepository() {
    _base = RepositoryBase();
  }

  Future<IsarCollection<KingDefeat>> getCategory() async {
    Isar isar = await _base.getIsar();
    return isar.kingDefeats;
  }

  @override
  Future<void> insert(KingDefeat data) async {
    await insertAll([data]);
  }

  @override
  Future<void> insertAll(List<KingDefeat> datas) async {
    await _base.put(await getCategory(), datas);
  }

  @override
  Future<KingDefeat?> getKingDefeat() async {
    final IsarCollection<KingDefeat> collection = await getCategory();
    return await collection.where().findFirst();
  }
}
