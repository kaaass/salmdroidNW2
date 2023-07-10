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
      ..latestId = org['latedId'] ?? ''
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

  static Map<String, int> createMapFromData(Defeat data) {
    Map<String, int> ret = {};
    ret['num'] = data.num;
    ret['coopEnemy4'] = data.coopEnemy4;
    ret['coopEnemy5'] = data.coopEnemy5;
    ret['coopEnemy6'] = data.coopEnemy6;
    ret['coopEnemy7'] = data.coopEnemy7;
    ret['coopEnemy8'] = data.coopEnemy8;
    ret['coopEnemy9'] = data.coopEnemy9;
    ret['coopEnemy10'] = data.coopEnemy10;
    ret['coopEnemy11'] = data.coopEnemy11;
    ret['coopEnemy12'] = data.coopEnemy12;
    ret['coopEnemy13'] = data.coopEnemy13;
    ret['coopEnemy14'] = data.coopEnemy14;
    return ret;
  }
}
