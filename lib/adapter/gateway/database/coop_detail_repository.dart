import 'package:isar/isar.dart';

import '../../../application/interface/i_coopdetail_repository.dart';
import '../../../domain/coop_history_detail/coop_history_detail.dart';
import 'repository_base.dart';

class CoopDetailRepository extends ICoopDetailRepository {
  late final RepositoryBase _base;

  CoopDetailRepository() {
    _base = RepositoryBase();
  }

  Future<IsarCollection<CoopHistoryDetail>> getCategory() async {
    Isar isar = await _base.getIsar();
    return isar.coopHistoryDetails;
  }

  @override
  Future<void> drop() async {
    await _base.clear(await getCategory());
  }

  @override
  Future<void> insert(CoopHistoryDetail data) async {
    await insertAll([data]);
  }

  @override
  Future<void> insertAll(List<CoopHistoryDetail> datas) async {
    await _base.put(await getCategory(), datas);
  }

  @override
  Future<List<CoopHistoryDetail>> getJobResult() async {
    final IsarCollection<CoopHistoryDetail> collection = await getCategory();
    return await collection.where().findAll();
  }

  @override
  Future<CoopHistoryDetail?> getJobResultById(String id) async {
    final IsarCollection<CoopHistoryDetail> collection = await getCategory();
    final List<CoopHistoryDetail> ret =
        await collection.filter().historyIdEqualTo(id).findAll();
    return ret.isNotEmpty ? ret.first : null;
  }

  @override
  Future<String?> getLatestJobId() async {
    final IsarCollection<CoopHistoryDetail> collection = await getCategory();
    final List<CoopHistoryDetail> ret =
        await collection.where().sortByPlayedTime().findAll();
    return ret.isNotEmpty ? ret.last.historyId : null;
  }

  @override
  Future<int> getCount() async {
    final IsarCollection<CoopHistoryDetail> collection = await getCategory();
    return await collection.count();
  }

  @override
  Future<List<CoopHistoryDetail>> getJobResults(
      {required String start, String? end}) async {
    final IsarCollection<CoopHistoryDetail> collection = await getCategory();
    final List<CoopHistoryDetail> ret;
    if (end != null) {
      ret = await collection.filter().playedTimeBetween(start, end).findAll();
    } else {
      ret = await collection.filter().playedTimeGreaterThan(start).findAll();
    }

    return ret;
  }

  @override
  Future<List<CoopHistoryDetail>> getJobResultsLimit(
      {required int limit, int? offset}) async {
    final IsarCollection<CoopHistoryDetail> collection = await getCategory();
    List<CoopHistoryDetail> ret;
    if (offset != null) {
      ret = await collection.where().offset(offset).limit(limit).findAll();
    } else {
      ret = await collection.where().limit(limit).findAll();
    }
    return ret;
  }

  @override
  Future<List<String>> getAllJobId() async {
    List<CoopHistoryDetail> all = await getJobResult();
    List<String> ret = [];
    for (int i = 0; i < all.length; i++) {
      ret.add(all[i].historyId);
    }
    return ret;
  }
}
