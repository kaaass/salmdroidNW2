import 'package:salmdroidnw2/domain/king_defeat/king_defeat.dart';

class KingDefeatConverter {
  static KingDefeat createEmptyKingDefeat() {
    return KingDefeat()
      ..id = 1
      ..num = 0
      ..latestId = ''
      ..coopEnemy23 = 0
      ..coopEnemy24 = 0;
  }

  static KingDefeat createKingDefeatFromMap(Map<String, dynamic> org) {
    return KingDefeat()
      ..id = org['id']
      ..num = org['num']
      ..latestId = org['latestId'] ?? ''
      ..coopEnemy23 = org['coopEnemy23']
      ..coopEnemy24 = org['coopEnemy24'];
  }

  static Map<String, int> createMapFromData(KingDefeat data) {
    Map<String, int> ret = {};
    ret['id'] = data.id;
    ret['num'] = data.num;
    ret['coopEnemy23'] = data.coopEnemy23;
    ret['coopEnemy24'] = data.coopEnemy24;
    return ret;
  }

  static Map<String, int> getOnlySamonidsMap(KingDefeat data) {
    Map<String, int> ret = {};
    ret['coopEnemy23'] = data.coopEnemy23;
    ret['coopEnemy24'] = data.coopEnemy24;
    return ret;
  }
}
