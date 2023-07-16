import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/special_weapon.dart';

class SpecialWeaponName {
  static String getName(BuildContext? c, String idstr) {
    if (c == null) {
      return '';
    }
    int id = SpecialWeaponData.idMap[idstr] ?? -1;
    switch (id) {
      case 20006:
        return L10n.of(c)!.spNiceBallCoop;
      case 20007:
        return L10n.of(c)!.spShockSonarCoop;
      case 20009:
        return L10n.of(c)!.spMicroLaserCoop;
      case 20010:
        return L10n.of(c)!.spJetpackCoop;
      case 20012:
        return L10n.of(c)!.spChariotCoop;
      case 20013:
        return L10n.of(c)!.spSkewerCoop;
      case 20014:
        return L10n.of(c)!.spTripleTornadoCoop;
      default:
        return '';
    }
  }
}
