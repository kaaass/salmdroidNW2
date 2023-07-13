import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/weapon.dart';

class WeaponData {
  static String getWeaponName(BuildContext? c, String path) {
    int id = Weapon.weaponMap[path] ?? -1;

    if (c == null) {
      return '';
    }

    switch (id) {
      case 0:
        return L10n.of(c)!.shooterShortCoop;
      default:
        return '';
    }
  }
}
