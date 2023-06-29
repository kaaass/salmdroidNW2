import '../../domain/defeat/defeat.dart';

abstract class IDefeatRepository {
  Future<void> insert(Defeat data);
  Future<void> insertAll(List<Defeat> datas);
  Future<Defeat?> getDefeat();
}
