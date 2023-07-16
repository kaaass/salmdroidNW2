import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/salmonrun_data/king_salmonid.dart';

class KingSalmonidUtil {
  static String getNameByIdstr(BuildContext? c, String idstr) {
    int id = KingSalmonid.idMap[idstr] ?? -1;
    return getName(c, id);
  }

  static String getName(BuildContext? c, int id) {
    if (c == null) {
      return '';
    }
    switch (id) {
      case 23:
        return L10n.of(c)!.cohozuna;
      case 24:
        return L10n.of(c)!.horroboros;
      default:
        return '';
    }
  }

  static List<int> getAllIds() {
    return KingSalmonid.idMap.values.toList();
  }

  static List<String> getAllBaseIds() {
    return KingSalmonid.idMap.keys.toList();
  }
}
