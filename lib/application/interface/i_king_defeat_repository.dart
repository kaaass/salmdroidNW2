import '../../domain/king_defeat/king_defeat.dart';

abstract class IKingDefeatRepository {
  Future<void> insert(KingDefeat data);
  Future<void> insertAll(List<KingDefeat> datas);
  Future<KingDefeat?> getKingDefeat();
}
