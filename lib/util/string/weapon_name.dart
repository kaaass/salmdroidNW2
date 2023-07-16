import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/weapon_data.dart';

class WeaponName {
  static String getName(BuildContext? c, String path) {
    if (c == null) {
      return '';
    }

    int id = WeaponData.idMap[path] ?? (WeaponData.grizzcoIdMap[path] ?? -1);
    switch (id) {
      case 0:
        return L10n.of(c)!.shooterShortCoop;
      case 10:
        return L10n.of(c)!.shooterFirstCoop;
      case 20:
        return L10n.of(c)!.shooterPrecisionCoop;
      case 30:
        return L10n.of(c)!.shooterBlazeCoop;
      case 40:
        return L10n.of(c)!.shooterNormalCoop;
      case 50:
        return L10n.of(c)!.shooterGravityCoop;
      case 60:
        return L10n.of(c)!.shooterQuickMiddleCoop;
      case 70:
        return L10n.of(c)!.shooterExpertCoop;
      case 80:
        return L10n.of(c)!.shooterHeavyCoop;
      case 90:
        return L10n.of(c)!.shooterLongCoop;
      case 100:
        return L10n.of(c)!.shooterQuickLongCoop;
      case 200:
        return L10n.of(c)!.blasterShortCoop;
      case 210:
        return L10n.of(c)!.blasterMiddleCoop;
      case 220:
        return L10n.of(c)!.blasterLongCoop;
      case 230:
        return L10n.of(c)!.blasterLightShortCoop;
      case 240:
        return L10n.of(c)!.blasterLightCoop;
      case 250:
        return L10n.of(c)!.blasterLightLongCoop;
      case 260:
        return L10n.of(c)!.blasterPrecisionCoop;
      case 300:
        return L10n.of(c)!.shooterTripleMiddleCoop;
      case 310:
        return L10n.of(c)!.shooterTripleQuickCoop;
      case 400:
        return L10n.of(c)!.shooterFlashCoop;
      case 1000:
        return L10n.of(c)!.rollerCompactCoop;
      case 1010:
        return L10n.of(c)!.rollerNormalCoop;
      case 1020:
        return L10n.of(c)!.rollerHeavyCoop;
      case 1030:
        return L10n.of(c)!.rollerHunterCoop;
      case 1040:
        return L10n.of(c)!.rollerWideCoop;
      case 1100:
        return L10n.of(c)!.brushMiniCoop;
      case 1110:
        return L10n.of(c)!.brushNormalCoop;
      case 1120:
        return L10n.of(c)!.brushHeavyCoop;
      case 2000:
        return L10n.of(c)!.chargerQuickCoop;
      case 2010:
        return L10n.of(c)!.chargerNormalCoop;
      case 2030:
        return L10n.of(c)!.chargerLongCoop;
      case 2050:
        return L10n.of(c)!.chargerLightCoop;
      case 2060:
        return L10n.of(c)!.chargerKeeperCoop;
      case 2070:
        return L10n.of(c)!.chargerPencilCoop;
      case 3010:
        return L10n.of(c)!.slosherDiffusionCoop;
      case 3020:
        return L10n.of(c)!.slosherLauncherCoop;
      case 3030:
        return L10n.of(c)!.slosherBathtubCoop;
      case 3000:
        return L10n.of(c)!.slosherStrongCoop;
      case 3040:
        return L10n.of(c)!.slosherWashtubCoop;
      case 4000:
        return L10n.of(c)!.spinnerQuickCoop;
      case 4010:
        return L10n.of(c)!.spinnerStandardCoop;
      case 4020:
        return L10n.of(c)!.spinnerHyperCoop;
      case 4030:
        return L10n.of(c)!.spinnerDownpourCoop;
      case 4040:
        return L10n.of(c)!.spinnerSereinCoop;
      case 5000:
        return L10n.of(c)!.maneuverShortCoop;
      case 5010:
        return L10n.of(c)!.maneuverNormalCoop;
      case 5020:
        return L10n.of(c)!.maneuverGallonCoop;
      case 5030:
        return L10n.of(c)!.maneuverDualCoop;
      case 5040:
        return L10n.of(c)!.maneuverStepperCoop;
      case 6000:
        return L10n.of(c)!.shelterNormalCoop;
      case 6010:
        return L10n.of(c)!.shelterWideCoop;
      case 6020:
        return L10n.of(c)!.shelterCompactCoop;
      case 7010:
        return L10n.of(c)!.stringerNormalCoop;
      case 7020:
        return L10n.of(c)!.stringerShortCoop;
      case 8000:
        return L10n.of(c)!.saberNormalCoop;
      case 8010:
        return L10n.of(c)!.saberLiteCoop;
      case 20900:
        return L10n.of(c)!.blasterBearCoop;
      case 22900:
        return L10n.of(c)!.chargerBearCoop;
      case 23900:
        return L10n.of(c)!.slosherBearCoop;
      case 26900:
        return L10n.of(c)!.shelterBearCoop;
      case 27900:
        return L10n.of(c)!.stringerBearCoop;
      case 28900:
        return L10n.of(c)!.saberBearCoop;
      default:
        return '';
    }
  }
}
