import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../coop_history_detail/coop_history_detail.dart';
import '../salmonrun_data/rule.dart';

class Common {

  static final colorList = [
    Colors.blue.shade600,
    Colors.orange.shade900,
    Colors.green.shade700,
    Colors.purple.shade700,
    Colors.teal.shade900,
    Colors.indigo.shade500,
    Colors.pink.shade600,
    Colors.indigo.shade500,
    Colors.grey,
  ];

  static const Map<String, String> eventMap = {
    'NoEvent': '-',
    'Q29vcEV2ZW50V2F2ZS0x': 'ラッシュ', // CoopEventWave-1
    'Q29vcEV2ZW50V2F2ZS0y': 'キンシャケ探し', // CoopEventWave-2
    'Q29vcEV2ZW50V2F2ZS0z': 'グリル発進', // CoopEventWave-3
    'Q29vcEV2ZW50V2F2ZS00': 'ハコビヤ襲来', // CoopEventWave-4
    'Q29vcEV2ZW50V2F2ZS01': '霧', // CoopEventWave-5
    'Q29vcEV2ZW50V2F2ZS02': 'ドスコイ大量発生', // CoopEventWave-6
    'Q29vcEV2ZW50V2F2ZS03': '巨大タツマキ', // CoopEventWave-7
    'Q29vcEV2ZW50V2F2ZS04': 'ドロシャケ噴出', // CoopEventWave-8
  };

  static final allRule = (Rule.regular.rawValue | Rule.bigRun.rawValue);
  static final Map<String, List<int>> eventTideMap = {
    // high, normal, low
    'NoEvent': [allRule, allRule, allRule],
    'Q29vcEV2ZW50V2F2ZS0x': [
      allRule,
      allRule,
      Rule.bigRun.rawValue
    ], // CoopEventWave-1 ラッシュ
    'Q29vcEV2ZW50V2F2ZS0y': [
      Rule.regular.rawValue,
      Rule.regular.rawValue,
      Rule.none.rawValue
    ], // CoopEventWave-2 キンシャケ探し
    'Q29vcEV2ZW50V2F2ZS0z': [
      allRule,
      allRule,
      Rule.bigRun.rawValue
    ], // CoopEventWave-3 グリル発進
    'Q29vcEV2ZW50V2F2ZS00': [
      allRule,
      allRule,
      allRule
    ], // CoopEventWave-4 ハコビヤ襲来
    'Q29vcEV2ZW50V2F2ZS01': [allRule, allRule, allRule], // CoopEventWave-5 霧
    'Q29vcEV2ZW50V2F2ZS02': [
      Rule.none.rawValue,
      Rule.none.rawValue,
      Rule.regular.rawValue
    ], // CoopEventWave-6 ドスコイ大量発生
    'Q29vcEV2ZW50V2F2ZS03': [
      Rule.none.rawValue,
      Rule.none.rawValue,
      Rule.regular.rawValue
    ], // CoopEventWave-7 巨大タツマキ
    'Q29vcEV2ZW50V2F2ZS04': [
      Rule.regular.rawValue,
      Rule.regular.rawValue,
      Rule.none.rawValue
    ], // CoopEventWave-8 ドロシャケ噴出
  };

  static String getTideName(var context, int level) {
    switch (level) {
      case 0:
        return L10n.of(context)!.lowTide;
      case 1:
        return L10n.of(context)!.midTide;
      case 2:
        return L10n.of(context)!.highTide;
      default:
        throw Exception('Invalid tide id');
    }
  }

  static List<String> getEventIdList() {
    List<String> list = [];
    eventMap.forEach((key, value) {
      list.add(key);
    });
    return list;
  }

  static List<String> getEventNameList(var context) {
    List<String> list = [];
    eventMap.forEach((key, value) {
      list.add(getEventNameFromId(context, key));
    });
    return list;
  }

  static String getBossIdToIdxName(String base) {
    String decoded = _decodeBase64(base);
    return decoded.replaceAll(RegExp(r'CoopEnemy-'), 'coopEnemy');
  }

  static String getEventName(var context, EventWave? event) {
    if (event == null) {
      return '-';
    }
    return getEventNameFromId(context, event.id);
  }

  static getEventNameFromId(var context, String id) {
    switch (id) {
      case 'NoEvent':
        return L10n.of(context)!.waterLevels;
      case 'Q29vcEV2ZW50V2F2ZS0x': // CoopEventWave-1
        return L10n.of(context)!.rush;
      case 'Q29vcEV2ZW50V2F2ZS0y': // CoopEventWave-2
        return L10n.of(context)!.goldieSeeking;
      case 'Q29vcEV2ZW50V2F2ZS0z': // CoopEventWave-3
        return L10n.of(context)!.theGriller;
      case 'Q29vcEV2ZW50V2F2ZS00': // CoopEventWave-4
        return L10n.of(context)!.theMothership;
      case 'Q29vcEV2ZW50V2F2ZS01': // CoopEventWave-5
        return L10n.of(context)!.fog;
      case 'Q29vcEV2ZW50V2F2ZS02': // CoopEventWave-6
        return L10n.of(context)!.cohockCharge;
      case 'Q29vcEV2ZW50V2F2ZS03': // CoopEventWave-7
        return L10n.of(context)!.giantTornado;
      case 'Q29vcEV2ZW50V2F2ZS04': // CoopEventWave-8
        return L10n.of(context)!.mudmouthEruption;
      default:
        throw Exception('Invalid event key');
    }
  }

  // // for private job summary
  // static String getBaseStageId() {
  //   return 'Q29vcFN0YWdlLTE=';
  // }

  static String getEggVPGrade() {
    return 'Q29vcEdyYWRlLTg=';
  }

  // static String getImageGikura() {
  //   return _preBundle + bundles['gikura']!;
  // }

  // static String getImageIkura() {
  //   return _preBundle + bundles['ikura']!;
  // }

  // static String getImageDead() {
  //   return _preBundle + bundles['dead']!;
  // }

  // static String getImageRescue() {
  //   return _preBundle + bundles['rescue']!;
  // }

  // static String getImageGradeUp() {
  //   return _preBundle + bundles['gradeup']!;
  // }

  // static String getImageGradeEven() {
  //   return _preBundle + bundles['gradeeven']!;
  // }

  // static String getImageGradeDown() {
  //   return _preBundle + bundles['gradedown']!;
  // }

  // static String getImageWave() {
  //   return _preBundle + bundles['wave']!;
  // }

  // static String getImageScaleGold() {
  //   return _preScale + scale['gold']!;
  // }

  // static String getImageScaleSilver() {
  //   return _preScale + scale['silver']!;
  // }

  // static String getImageScaleBronze() {
  //   return _preScale + scale['bronze']!;
  // }

  // // static Future<String> getExternalStoragePath() async {
  // //   final path = await ExternalPath.getExternalStoragePublicDirectory(
  // //       ExternalPath.DIRECTORY_DOWNLOADS);
  // //   return path;
  // // }

  // static String getWave() {
  //   return _preBundle + bundles['wave']!;
  // }

  static bool isRegularStage(String id) {
    String decoded = _decodeBase64(id);
    if ((int.tryParse(decoded.split('-').last) ?? 0) < 100) {
      return true;
    }
    return false;
  }

  static String getMatchString(String target, var pattern) {
//    Log.i(target);
//    Log.i(pattern);
    RegExp exp = RegExp(pattern);
    var matches = exp.allMatches(target);
//    Log.i(matches.length);
    var m = matches.first;
//    Log.i(m.group(1).toString());
    return m.group(1).toString();
  }

  static String _decodeBase64(String code) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.decode(code);
  }
}
