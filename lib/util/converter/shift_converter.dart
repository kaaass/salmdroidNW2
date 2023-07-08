import 'package:salmdroidnw2/domain/shift/shift.dart';

class ShiftConverter {
  static Shift createEmptyShift() {
    return Shift()
      ..start = ''
      ..end = ''
      ..stageId = ''
      ..weapons = []
      ..maxGradeId = ''
      ..maxGradePoint = 0
      ..maxEggs = 0
      ..played = 0
      ..rule = ''
      ..kingSalmonids = '';
  }

  static Shift createShiftFromMap(Map<String, dynamic> org) {
    List<String> weapons = [];
    // for (var v in org['weapons']) {
    //   weapons.add(v);
    // }
    return Shift()
      ..start = org['start']
      ..end = org['end']
      ..stageId = org['stageId']
      ..weapons = [org['weapon1'], org['weapon2'], org['weapon3'], org['weapon4']]
      ..maxGradeId = org['maxGradeId'] ?? ''
      ..maxGradePoint = org['maxGradePoint'] ?? 0
      ..maxEggs = org['maxEggs'] ?? 0
      ..played = org['played'] ?? 0
      ..rule = org['rule'] ?? ''
      ..kingSalmonids = org['kingSalmonids'] ?? '';
  }
}
