import 'package:salmdroidnw2/domain/salmonrun_data/weapon_data.dart';
import 'package:salmdroidnw2/util/string/special_weapon_util.dart';

import '../application/common_utility.dart';
import '../domain/coop_history_detail/coop_history_detail.dart';
import '../domain/salmonrun_data/common.dart';
import '../domain/salmonrun_data/rule.dart';
import '../domain/stat/rate.dart';
import '../domain/stat/stat.dart';
import '../domain/stat/tide.dart';
import '../domain/stat/wave_info.dart';

class StatInteractor {
  Stat _stat = Stat();

  StatInteractor() {
    reset();
  }

  void reset() {
    _stat = Stat();
    Common.eventMap.forEach((key, value) {
      _stat.eventRate[key] = Tide();
    });
  }

  Stat getStat() {
    return _stat;
  }

  Future<void> calcStat(List<CoopHistoryDetail> details, Rule rule) async {
    _stat.rule = rule;
    for (var detail in details) {
      if (CommonUtil.isRuleRegular(detail.rule) ||
          CommonUtil.isRuleBigRun(detail.rule)) {
        _update(detail);
      } else if (CommonUtil.isRuleTeamContest(detail.rule)) {
        _updateForEggstraWork(detail);
      }
    }
  }

  // Future<void> calcStatFromStream(Stream<CoopHistoryDetail> stream,
  //     [bool forceAllWeapon = false]) async {
  //   stream.listen((event) {
  //     _update(event.CoopHistoryDetail, forceAllWeapon);
  //   });
  // }

  Future<void> calcStatEach(CoopHistoryDetail history) async {
    Rule r = CommonUtil.convertRuleByDefault(history.rule, Rule.regular);
    if ((r == Rule.regular || r == Rule.bigRun) && history.afterGrade != null) {
      _update(history);
    }
  }

  Stat fix([bool forceAllWeapon = false]) {
    int weaponTotal = 0;
    _stat.weapons.forEach((key, value) {
      weaponTotal += value;
    });
    _stat.weapons.forEach((key, value) {
      _stat.weaponRate[key] =
          Rate(name: key, rate: value / weaponTotal, num: value);
    });
    if (forceAllWeapon) {
      WeaponData.grizzcoIdMap.forEach((key, value) {
        if (!_stat.weapons.containsKey(key)) {
          _stat.weaponRate[key] = Rate(name: key, rate: 0, num: 0);
        }
      });
    }

    _stat.specials.forEach((key, value) {
      _stat.specialRate[key] =
          Rate(name: key, rate: value / _stat.jobNum, num: value);
    });

    _stat.avgIkuras.goldenikura.v =
        _stat.totalIkuras.goldenikura.v / _stat.jobNum;
    _stat.avgIkuras.ikura.v = _stat.totalIkuras.ikura.v / _stat.jobNum;
    _stat.avgIkuras.rescued.v = _stat.totalIkuras.rescued.v / _stat.jobNum;
    _stat.avgIkuras.rescue.v = _stat.totalIkuras.rescue.v / _stat.jobNum;
    _stat.avgIkuras.defeat.v = _stat.totalIkuras.defeat.v / _stat.jobNum;

    _stat.teamAvgIkuras.goldenikura.v =
        _stat.teamTotalIkuras.goldenikura.v / _stat.jobNum;
    _stat.teamAvgIkuras.ikura.v = _stat.teamTotalIkuras.ikura.v / _stat.jobNum;
    _stat.teamAvgIkuras.rescued.v =
        _stat.teamTotalIkuras.rescued.v / _stat.jobNum;
    _stat.teamAvgIkuras.rescue.v =
        _stat.teamTotalIkuras.rescue.v / _stat.jobNum;
    _stat.teamAvgIkuras.defeat.v =
        _stat.teamTotalIkuras.defeat.v / _stat.jobNum;

    return _stat;
  }

  void _update(CoopHistoryDetail j) {
    if (j.myResult.weapons.isEmpty) {
      return;
    }

    _stat.jobNum++;
    if (j.afterGrade != null && j.afterGradePoint != null) {
      if (CommonUtil.isUpdateGrade(_stat.maxGradeId, _stat.maxGrade,
          j.afterGrade!.id, j.afterGradePoint!)) {
        _stat.maxGradeId = j.afterGrade!.id;
        _stat.maxGrade = j.afterGradePoint!;
      }
    }
    if (j.resultWave == 0) {
      _stat.clearNum++;
    }
    _stat.clearRate = _stat.clearNum / _stat.jobNum;

    double cWave = _stat.clearWave * (_stat.jobNum - 1);
    if (j.resultWave == 0) {
      cWave += 3;
    } else {
      cWave += j.resultWave - 1;
    }
    _stat.clearWave = cWave / _stat.jobNum;

    if (j.waveResults.length == 4) {
      String s = j.waveResults[3].waterLevel.toString();
      if (j.bossResult != null && j.bossResult!.hasDefeatBoss) {
        _stat.okashira.t[s]!.win++;
      } else {
        _stat.okashira.t[s]!.lose++;
      }
      _stat.okashiraId = j.bossResult!.boss.id;
    }

    _stat.maxIkuras.goldenikura
        .setIfOver(j.myResult.goldenDeliverCount.toDouble());
    _stat.maxIkuras.ikura.setIfOver(j.myResult.deliverCount.toDouble());
    _stat.maxIkuras.rescued.setIfOver(j.myResult.rescuedCount.toDouble());
    _stat.maxIkuras.rescue.setIfOver(j.myResult.rescueCount.toDouble());
    _stat.maxIkuras.defeat.setIfOver(j.myResult.defeatEnemyCount.toDouble());

    _stat.totalIkuras.goldenikura.v += j.myResult.goldenDeliverCount;
    _stat.totalIkuras.ikura.v += j.myResult.deliverCount;
    _stat.totalIkuras.rescued.v += j.myResult.rescuedCount;
    _stat.totalIkuras.rescue.v += j.myResult.rescueCount;
    _stat.totalIkuras.defeat.v += j.myResult.defeatEnemyCount;

    int ik = j.myResult.deliverCount;
    int killtmp = j.myResult.defeatEnemyCount;
    int deathtmp = j.myResult.rescuedCount;
    int rescuetmp = j.myResult.rescueCount;
    for (var member in j.memberResults) {
      ik += member.deliverCount;
      deathtmp += member.rescuedCount;
      rescuetmp += member.rescueCount;
      killtmp += member.defeatEnemyCount;
    }
    // 金イクラは各個人納品数の合計と全体の納品数は一致しない(ハコビヤ問題)
    // statの全体表記は全体の納品数の方が意味があると思うのでそちらを採用する。
    int teamgi = 0;
    for (var wave in j.waveResults) {
      teamgi += wave.teamDeliverCount ?? 0;
    }
    _stat.teamMaxIkuras.goldenikura.setIfOver(teamgi.toDouble());
    _stat.teamMaxIkuras.ikura.setIfOver(ik.toDouble());
    _stat.teamMaxIkuras.rescued.setIfOver(deathtmp.toDouble());
    _stat.teamMaxIkuras.rescue.setIfOver(rescuetmp.toDouble());
    _stat.teamMaxIkuras.defeat.setIfOver(killtmp.toDouble());

    _stat.teamTotalIkuras.goldenikura.v += teamgi;
    _stat.teamTotalIkuras.ikura.v += ik;
    _stat.teamTotalIkuras.rescued.v += deathtmp;
    _stat.teamTotalIkuras.rescue.v += rescuetmp;
    _stat.teamTotalIkuras.defeat.v += killtmp;
    _stat.teamMemberNum += j.memberResults.length;

    // for only day and include night
    bool isOnlyDay = true;
    for (int i = 0; i < j.waveResults.length; i++) {
      if (j.waveResults[i].eventWave != null) {
        isOnlyDay = false;
        break;
      }
    }
    if (j.resultWave == 0 ||
        CommonUtil.convertRule(j.rule).rawValue & Rule.teamContest.rawValue >
            0) {
      if (isOnlyDay) {
        _stat.maxIkuraOnlyDay.goldenikura
            .setIfOver(j.myResult.goldenDeliverCount.toDouble());
        _stat.maxIkuraOnlyDay.ikura
            .setIfOver(j.myResult.deliverCount.toDouble());
        _stat.teamMaxIkuraDay.goldenikura.setIfOver(teamgi.toDouble());
        _stat.teamMaxIkuraDay.ikura.setIfOver(ik.toDouble());
      } else {
        _stat.maxIkuraIncNight.goldenikura
            .setIfOver(j.myResult.goldenDeliverCount.toDouble());
        _stat.maxIkuraIncNight.ikura
            .setIfOver(j.myResult.deliverCount.toDouble());
        _stat.teamMaxIkuraNight.goldenikura.setIfOver(teamgi.toDouble());
        _stat.teamMaxIkuraNight.ikura.setIfOver(ik.toDouble());
      }
    }

    if (j.scale != null) {
      _stat.scale.gold += j.scale!.gold;
      _stat.scale.silver += j.scale!.silver;
      _stat.scale.bronze += j.scale!.bronze;
    }

    for (var w in j.myResult.weapons) {
      if (w.image.url != WeaponData.randomWeapon) {
        _stat.weapons[w.image.url] = _stat.weapons[w.image.url] != null
            ? _stat.weapons[w.image.url]! + 1
            : 1;
      }
    }
    String s = j.myResult.specialWeapon!.id;
    String baseId = s;
    _stat.specials[baseId] =
        _stat.specials[baseId] != null ? _stat.specials[baseId]! + 1 : 1;

    for (int i = 0; i < j.waveResults.length; i++) {
      if (i < 3) {
        bool isClear = (j.resultWave == 0 || (i + 1) < j.resultWave);
        String e = j.waveResults[i].eventWave == null
            ? 'NoEvent'
            : j.waveResults[i].eventWave!.id;
        String s = j.waveResults[i].waterLevel.toString();
        if (isClear) {
          _stat.eventRate[e]!.t[s]!.win += 1;
        } else {
          _stat.eventRate[e]!.t[s]!.lose += 1;
        }
      } else {
        // not count tide for king salmonids
      }
    }

    for (var boss in j.enemyResults) {
      if (_stat.salmonidsMyDef[boss.enemy.id] == null) {
        _stat.salmonidsMyDef[boss.enemy.id] = boss.defeatCount;
      } else {
        _stat.salmonidsMyDef[boss.enemy.id] =
            _stat.salmonidsMyDef[boss.enemy.id]! + boss.defeatCount;
      }

      if (_stat.salmonidsPop[boss.enemy.id] == null) {
        _stat.salmonidsPop[boss.enemy.id] = boss.popCount;
      } else {
        _stat.salmonidsPop[boss.enemy.id] =
            _stat.salmonidsPop[boss.enemy.id]! + boss.popCount;
      }
    }
  }

  void _updateForEggstraWork(CoopHistoryDetail j) {
    if (j.myResult.weapons.isEmpty) {
      return;
    }

    _stat.jobNum++;

    int teamEggs = 0;
    int teamPowerEggs = j.myResult.deliverCount;
    for (var member in j.memberResults) {
      teamPowerEggs += member.deliverCount;
    }
    for (int i = 0; i < j.waveResults.length; i++) {
      if (_stat.eggstraWaveInfo.length < (i + 1)) {
        // まだ無いので新規作成
        String eventId = j.waveResults[i].eventWave == null
            ? 'NoEvent'
            : j.waveResults[i].eventWave!.id;
        int tide = j.waveResults[i].waterLevel;
        _stat.eggstraWaveInfo
            .add(WaveInfo(waveNum: (i + 1), eventId: eventId, tide: tide));
      }

      _stat.eggstraWaveInfo[i].num++;
      _stat.eggstraWaveInfo[i].totalEggs +=
          j.waveResults[i].teamDeliverCount ?? 0;
      _stat.eggstraWaveInfo[i].totalAppearEggs +=
          j.waveResults[i].goldenPopCount;
      int teamCount = j.waveResults[i].teamDeliverCount ?? 0;
      if (_stat.eggstraWaveInfo[i].maxEggs < teamCount) {
        _stat.eggstraWaveInfo[i].maxEggs = teamCount;
      }
      if (_stat.eggstraWaveInfo[i].maxAppearEggs <
          j.waveResults[i].goldenPopCount) {
        _stat.eggstraWaveInfo[i].maxAppearEggs =
            j.waveResults[i].goldenPopCount;
      }

      teamEggs += j.waveResults[i].teamDeliverCount ?? 0;
    }

    if (_stat.eggstraMaxEggs < teamEggs ||
        (_stat.eggstraMaxEggs == teamEggs &&
            _stat.eggstraMaxPowerEggs < teamPowerEggs)) {
      _stat.eggstraMaxEggs = teamEggs;
      _stat.eggstraMaxPowerEggs = teamPowerEggs;
      _stat.eggstraMaxEggsWaveInfo.clear();

      for (int i = 0; i < j.waveResults.length; i++) {
        String eventId = j.waveResults[i].eventWave == null
            ? 'NoEvent'
            : j.waveResults[i].eventWave!.id;
        int tide = j.waveResults[i].waterLevel;
        WaveInfo info =
            WaveInfo(waveNum: (i + 1), eventId: eventId, tide: tide);
        info.maxEggs = j.waveResults[i].teamDeliverCount ?? 0;
        info.maxAppearEggs = j.waveResults[i].goldenPopCount;
        info.norm = j.waveResults[i].deliverNorm ?? 0;

        List<String> sp = [];
        List<String> spSortedByPlayer = [
          j.myResult.specialWeapon!.image.url,
        ];
        for (var v in j.memberResults) {
          spSortedByPlayer.add(v.specialWeapon!.image.url);
        }
        for (var s in spSortedByPlayer) {
          for (int n = 0; n < j.waveResults[i].specialWeapons.length; n++) {
            if (s == j.waveResults[i].specialWeapons[n].image.url) {
              sp.add(j.waveResults[i].specialWeapons[n].image.url);
            }
          }
        }
        info.sp = [...sp];
        _stat.eggstraMaxEggsWaveInfo.add(info);
      }
    }

    for (var boss in j.enemyResults) {
      if (_stat.salmonidsMyDef[boss.enemy.id] == null) {
        _stat.salmonidsMyDef[boss.enemy.id] = boss.defeatCount;
      } else {
        _stat.salmonidsMyDef[boss.enemy.id] =
            _stat.salmonidsMyDef[boss.enemy.id]! + boss.defeatCount;
      }

      if (_stat.salmonidsPop[boss.enemy.id] == null) {
        _stat.salmonidsPop[boss.enemy.id] = boss.popCount;
      } else {
        _stat.salmonidsPop[boss.enemy.id] =
            _stat.salmonidsPop[boss.enemy.id]! + boss.popCount;
      }
    }
  }
}
