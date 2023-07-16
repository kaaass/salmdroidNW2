import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/stage.dart';

class StageName {
  static String getName(BuildContext? c, String idstr) {
    if (c == null) {
      return '';
    }
    int id = StageData.stageMap[idstr] ?? -1;
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
}
