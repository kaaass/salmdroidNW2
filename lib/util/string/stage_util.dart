import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/stage.dart';

class StageUtil {
  static String getNameByIdstr(BuildContext? c, String idstr) {
    int id = StageData.idMap[idstr] ?? -1;
    return getName(c, id);
  }

  static String getName(BuildContext? c, int id) {
    if (c == null) {
      return '';
    }
    switch (id) {
      case 1:
        return L10n.of(c)!.stageSpawning;
      case 2:
        return L10n.of(c)!.stageSockeye;
      case 7:
        return L10n.of(c)!.stageHydroplant;
      case 8:
        return L10n.of(c)!.stageMarooners;
      case 100:
        return L10n.of(c)!.stageWahoo;
      case 102:
        return L10n.of(c)!.stageAcademy;
      case 999:
        return L10n.of(c)!.stageUndertow;
      default:
        return '';
    }
  }

  static List<int> getAllIds() {
    return StageData.idMap.values.toList();
  }

  static List<String> getAllBaseIds() {
    return StageData.idMap.keys.toList();
  }
}
