import 'package:salmdroidnw2/domain/defeat/defeat.dart';

class DefeatConverter {
  static Defeat createEmptyDefeat() {
    return Defeat()
      ..num = 0
      ..latestId = ''
      ..coopEnemy4 = 0
      ..coopEnemy5 = 0
      ..coopEnemy6 = 0
      ..coopEnemy7 = 0
      ..coopEnemy8 = 0
      ..coopEnemy9 = 0
      ..coopEnemy10 = 0
      ..coopEnemy11 = 0
      ..coopEnemy12 = 0
      ..coopEnemy13 = 0
      ..coopEnemy14 = 0;
  }

  static Defeat createDefeatFromMap(Map<String, dynamic> org) {
    return Defeat()
      ..num = org['num']
      ..latestId = org['latedId']
      ..coopEnemy4 = org['coopEnemy4']
      ..coopEnemy5 = org['coopEnemy5']
      ..coopEnemy6 = org['coopEnemy6']
      ..coopEnemy7 = org['coopEnemy7']
      ..coopEnemy8 = org['coopEnemy8']
      ..coopEnemy9 = org['coopEnemy9']
      ..coopEnemy10 = org['coopEnemy10']
      ..coopEnemy11 = org['coopEnemy11']
      ..coopEnemy12 = org['coopEnemy12']
      ..coopEnemy13 = org['coopEnemy13']
      ..coopEnemy14 = org['coopEnemy14'];
  }
}
