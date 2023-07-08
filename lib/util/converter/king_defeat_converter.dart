import 'package:salmdroidnw2/domain/king_defeat/king_defeat.dart';

class KingDefeatConverter {
  static KingDefeat createEmptyKingDefeat() {
    return KingDefeat()
      ..num = 0
      ..latestId = ''
      ..coopEnemy23 = 0
      ..coopEnemy24 = 0;
  }

  static KingDefeat createKingDefeatFromMap(Map<String, dynamic> org) {
    return KingDefeat()
      ..num = org['num']
      ..latestId = org['latestId']
      ..coopEnemy23 = org['coopEnemy23']
      ..coopEnemy24 = org['coopEnemy24'];
  }
}
