import 'dart:math';

import '../domain/salmonrun_data/rule.dart';

class CommonUtil {
  static Rule convertRule(String org) {
    if (org == Rule.regular.rawString) {
      return Rule.regular;
    }
    if (org == Rule.bigRun.rawString) {
      return Rule.bigRun;
    }
    if (org == Rule.teamContest.rawString) {
      return Rule.teamContest;
    }
    return Rule.none;
  }

  static Rule convertRuleByDefault(String org, Rule def) {
    if (org == Rule.regular.rawString) {
      return Rule.regular;
    }
    if (org == Rule.bigRun.rawString) {
      return Rule.bigRun;
    }
    if (org == Rule.teamContest.rawString) {
      return Rule.teamContest;
    }
    return def;
  }

  static bool isRuleRegular(String rule) {
    return _isCheckRule(rule, Rule.regular.rawString);
  }

  static bool isRuleBigRun(String rule) {
    return _isCheckRule(rule, Rule.bigRun.rawString);
  }

  static bool isRuleTeamContest(String rule) {
    return _isCheckRule(rule, Rule.teamContest.rawString);
  }

  static bool _isCheckRule(String target, String rule) {
    return target == rule;
  }

  static bool isUpdateGrade(
      String oldId, int oldPoint, String newId, int newPoint) {
    if (oldId.isEmpty) {
      return true;
    } else if (oldId == newId && oldPoint < newPoint) {
      return true;
    } else if (oldId.compareTo(newId) < 0) {
      return true;
    }
    return false;
  }

  static int compareSemanticVersion(String a, String b) {
    if (a.isEmpty) {
      return 1;
    }
    if (b.isEmpty) {
      return -1;
    }
    List<String> asp = a.split('.');
    List<String> bsp = b.split('.');
    int num = min(asp.length, bsp.length);

    for (int i = 0; i < num; i++) {
      if (int.parse(asp[i]) < int.parse(bsp[i])) {
        return 1;
      }
      if (int.parse(asp[i]) > int.parse(bsp[i])) {
        return -1;
      }
    }
    return 0;
  }
}
