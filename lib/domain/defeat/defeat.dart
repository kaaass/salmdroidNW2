import 'package:isar/isar.dart';

part 'defeat.g.dart';

@Collection()
class Defeat {
  Id id = Isar.autoIncrement;

  late int num;
  late String latestId;
  late int coopEnemy4;
  late int coopEnemy5;
  late int coopEnemy6;
  late int coopEnemy7;
  late int coopEnemy8;
  late int coopEnemy9;
  late int coopEnemy10;
  late int coopEnemy11;
  late int coopEnemy12;
  late int coopEnemy13;
  late int coopEnemy14;

  static Map<String, int> createInitMap() {
    Map<String, int> ret = {};
    ret['coopEnemy4'] = 0;
    ret['coopEnemy5'] = 0;
    ret['coopEnemy6'] = 0;
    ret['coopEnemy7'] = 0;
    ret['coopEnemy8'] = 0;
    ret['coopEnemy9'] = 0;
    ret['coopEnemy10'] = 0;
    ret['coopEnemy11'] = 0;
    ret['coopEnemy12'] = 0;
    ret['coopEnemy13'] = 0;
    ret['coopEnemy14'] = 0;
    return ret;
  }
}
