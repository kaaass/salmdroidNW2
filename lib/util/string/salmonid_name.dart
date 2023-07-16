import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/salmonid.dart';

class SalmonidName {
  static String getName(BuildContext? c, String idstr) {
    if (c == null) {
      return '';
    }
    int id = Salmonid.idmap[idstr] ?? -1;
    switch (id) {
      case 4:
        return L10n.of(c)!.steelHead;
      case 5:
        return L10n.of(c)!.flyFish;
      case 6:
        return L10n.of(c)!.steelEel;
      case 7:
        return L10n.of(c)!.stinger;
      case 8:
        return L10n.of(c)!.maws;
      case 9:
        return L10n.of(c)!.drizzler;
      case 10:
        return L10n.of(c)!.scrapper;
      case 11:
        return L10n.of(c)!.fishStick;
      case 12:
        return L10n.of(c)!.flipperFlopper;
      case 13:
        return L10n.of(c)!.bigShot;
      case 14:
        return L10n.of(c)!.slamminLid;
      case 15:
        return L10n.of(c)!.griller;
      case 17:
        return L10n.of(c)!.goldie;
      case 20:
        return L10n.of(c)!.mudmouth;
      default:
        return '';
    }
  }
}
