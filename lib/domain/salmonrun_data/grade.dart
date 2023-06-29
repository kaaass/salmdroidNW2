import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Grade {
  static String getGrade(BuildContext context, String id) {
    if (id.isNotEmpty) {
      switch (id) {
        case 'Q29vcEdyYWRlLTA=': // CoopGrade-0
          return L10n.of(context)!.apprentice;
        case 'Q29vcEdyYWRlLTE=': // CoopGrade-1
          return L10n.of(context)!.partTimer;
        case 'Q29vcEdyYWRlLTI=': // CoopGrade-2
          return L10n.of(context)!.goGetter;
        case 'Q29vcEdyYWRlLTM=': // CoopGrade-3
          return L10n.of(context)!.overachiever;
        case 'Q29vcEdyYWRlLTQ=': // CoopGrade-4
          return L10n.of(context)!.professionalPartTimer;
        case 'Q29vcEdyYWRlLTU=': // CoopGrade-5
          return L10n.of(context)!.professional1;
        case 'Q29vcEdyYWRlLTY=': // CoopGrade-6
          return L10n.of(context)!.professional2;
        case 'Q29vcEdyYWRlLTc=': // CoopGrade-7
          return L10n.of(context)!.professional3;
        case 'Q29vcEdyYWRlLTg=': // CoopGrade-8
          return L10n.of(context)!.eggsecutive;
        default:
          break;
      }
    }
    return '';
  }
}
