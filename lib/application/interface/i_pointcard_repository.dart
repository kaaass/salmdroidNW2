abstract class IPointCardRepository {
  Future<void> createTableIfNeed();
  Future<void> drop();
  Future<bool> isTableExist();
  Future<void> write(Map<String, dynamic> data);
  Future<Map<String, dynamic>> getUser();
}
