import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/king_salmonid.dart';

class KingSalmonidName {
  static String getName(BuildContext? c, String idstr) {
    if (c == null) {
      return '';
    }
    int id = KingSalmonid.idMap[idstr] ?? -1;
    switch (id) {
      case 23:
        return L10n.of(c)!.cohozuna;
      case 24:
        return L10n.of(c)!.horroboros;
      default:
        return '';
    }
  }
}
