import '../../domain/coop_history_detail/coop_history_detail.dart';

abstract class ICoopDetailRepository {
  Future<void> drop();
  Future<void> insert(CoopHistoryDetail data);
  Future<void> insertAll(List<CoopHistoryDetail> datas);
  Future<List<CoopHistoryDetail>> getJobResult();
  Future<CoopHistoryDetail?> getJobResultById(String id);
  Future<String?> getLatestJobId();
  Future<int> getCount();
  Future<List<CoopHistoryDetail>> getJobResults(
      {required String start, String? end});
  Future<List<CoopHistoryDetail>> getJobResultsLimit(
      {required int limit, int? offset});
  Future<List<String>> getAllJobId();
}
