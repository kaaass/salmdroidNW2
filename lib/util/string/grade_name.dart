import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/grade.dart';

class GradeName {
  static String getName(BuildContext? c, String idstr) {
    if (c == null) {
      return '';
    }
    int id = Grade.idMap[idstr] ?? -1;
    switch (id) {
      case 0:
        return L10n.of(c)!.apprentice;
      case 1:
        return L10n.of(c)!.partTimer;
      case 2:
        return L10n.of(c)!.goGetter;
      case 3:
        return L10n.of(c)!.overachiever;
      case 4:
        return L10n.of(c)!.professionalPartTimer;
      case 5:
        return L10n.of(c)!.professional1;
      case 6:
        return L10n.of(c)!.professional2;
      case 7:
        return L10n.of(c)!.professional3;
      case 8:
        return L10n.of(c)!.eggsecutive;
      default:
        return '';
    }
  }
}
