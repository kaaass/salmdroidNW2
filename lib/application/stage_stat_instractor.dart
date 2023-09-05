import 'dart:math';

import '../domain/coop_history_detail/coop_history_detail.dart';
import '../domain/salmonrun_data/common.dart';
import '../domain/stat/appear_unit.dart';
import '../domain/stat/points.dart';
import '../domain/stat/stage.dart';
import '../domain/stat/stat_detail.dart';

class StatDetailInstractor {
  StatDetail _statDetail = StatDetail();
  Map<String, List<bool>> _clearRateBase = {};
  final Map<String, List<AppearUnit>> _deliverRateBase = {};
  final Map<String, List<AppearUnit>> _defeatRateBase = {};
  final Map<String, List<AppearUnit>> _failureDeliverRateBase = {};
  final Map<String, List<AppearUnit>> _failureDefeatRateBase = {};

  StatDetailInstractor() {
    reset();
  }

  void reset() {
    _statDetail = StatDetail();
    _clearRateBase = {};
    for (int i = 0; i < 333; i += 10) {
      _clearRateBase[i.toString()] = [];
      _deliverRateBase[i.toString()] = [];
      _defeatRateBase[i.toString()] = [];
      _failureDeliverRateBase[i.toString()] = [];
      _failureDefeatRateBase[i.toString()] = [];
    }
  }

  StatDetail getStageStat() {
    return _statDetail;
  }

  // Future<void> calcStatFromStream(Stream<CoopHistory> stream) async {
  //   stream.listen(
  //     (event) {
  //       _update(event.coopHistoryDetail);
  //     },
  //   );
  // }

  Future<void> calcStat(CoopHistoryDetail history) async {
    _update(history);
  }

  void fix() {
    _clearRateBase.forEach((step, values) {
      int total = values.length;
      int success = 0;
      for (bool res in values) {
        if (res) {
          success++;
        }
      }
      _statDetail.clearRate[step] =
          total != 0 ? (success / total).toDouble() : -1;
    });
    _deliverRateBase.forEach((step, values) {
      _statDetail.delivers[step] = _calcNum(values);
    });
    _defeatRateBase.forEach((step, values) {
      _statDetail.defeats[step] = _calcNum(values);
    });
    _failureDeliverRateBase.forEach((step, values) {
      _statDetail.failureDelivers[step] = _calcNum(values);
    });
    _failureDefeatRateBase.forEach((step, values) {
      _statDetail.failureDefeats[step] = _calcNum(values);
    });
  }

  double _calcNum(List<AppearUnit> base) {
    int mytotal = 0;
    for (AppearUnit appearUnit in base) {
      mytotal += appearUnit.my;
    }

    return base.isNotEmpty ? (mytotal / base.length).toDouble() : -1;
  }

  double _calcRate(List<AppearUnit> base) {
    double res = -1;

    int total = 0;
    int my = 0;
    for (AppearUnit appearUnit in base) {
      my += appearUnit.my;
      total += appearUnit.appear;
    }

    if (total != 0) {
      res = (my / total).toDouble();
    }
    return res;
  }

  void _update(CoopHistoryDetail j) {
    if (j.afterGrade == null) {
      // private
      return;
    }
    if (j.myResult.weapons.isEmpty) {
      return;
    }

    String stage = j.coopStage.id;
    if (_statDetail.stages[stage] == null) {
      _statDetail.stages[stage] = Stage();
    }

    _statDetail.minHazard = min(_statDetail.minHazard, j.dangerRate * 100);

    // played
    _statDetail.stages[stage]!.played++;

    // max grade
    if (j.afterGrade != null) {
      if (_statDetail.stages[stage]!.maxGradeId.isEmpty) {
        _statDetail.stages[stage]!.maxGradeId = j.afterGrade!.id;
        _statDetail.stages[stage]!.maxGradePoint = j.afterGradePoint!;
      } else if (_statDetail.stages[stage]!.maxGradeId
              .compareTo(j.afterGrade!.id) <
          0) {
        _statDetail.stages[stage]!.maxGradeId = j.afterGrade!.id;
        _statDetail.stages[stage]!.maxGradePoint = j.afterGradePoint!;
      } else if (_statDetail.stages[stage]!.maxGradePoint <
          j.afterGradePoint!) {
        _statDetail.stages[stage]!.maxGradePoint = j.afterGradePoint!;
      }
    }

    // clear
    if (j.resultWave == 0) {
      _statDetail.stages[stage]!.clear++;
    }

    // check nightless or night
    bool isNightless = true;
    for (int i = 0; i < j.waveResults.length; i++) {
      if (j.waveResults[i].eventWave != null) {
        isNightless = false;
        break;
      }
    }

    // max eggs
    int egg = 0;
    bool isGrizzco = false;
    if (j.weapons.isNotEmpty && j.weapons.first.image.url == Common.goldenRandomWeapon) {
      isGrizzco = true;
    }

    for (var wave in j.waveResults) {
      egg += wave.teamDeliverCount ?? 0;
    }
    if (j.resultWave == 0) {
      if (isGrizzco) {
        if (isNightless) {
          _statDetail.stages[stage]!.maxEggsWithGrizzco.nightless
              .setIfOver(egg.toDouble());
        } else {
          _statDetail.stages[stage]!.maxEggsWithGrizzco.night
              .setIfOver(egg.toDouble());
        }
      } else {
        if (isNightless) {
          _statDetail.stages[stage]!.maxEggs.nightless
              .setIfOver(egg.toDouble());
        } else {
          _statDetail.stages[stage]!.maxEggs.night.setIfOver(egg.toDouble());
        }
      }
    }

    // count regular and private
    if (j.afterGrade == null) {
      _statDetail.private++;
    } else {
      _statDetail.regular++;
    }

    // put point
    String hazard = (j.dangerRate * 100).floor().toString();
    Points unit;
    if (j.resultWave == 0) {
      unit = _statDetail.success;
    } else {
      unit = _statDetail.failure;
    }

    unit.eggs[hazard] ??= [];
    unit.defeats[hazard] ??= [];
    unit.rescued[hazard] ??= [];

    int defeats = 0;
    for (var boss in j.enemyResults) {
      defeats += boss.defeatCount;
    }

    unit.eggs[hazard]!.add(j.myResult.goldenDeliverCount);
    unit.defeats[hazard]!.add(defeats);
    unit.rescued[hazard]!.add(j.myResult.rescuedCount);

    // check max value
    _statDetail.maxEggs =
        max(_statDetail.maxEggs, j.myResult.goldenDeliverCount);
    _statDetail.maxDefeats = max(_statDetail.maxDefeats, defeats);

    // rate
    String hazardStep = ((j.dangerRate * 10).floor() * 10).toString();
    if (j.dangerRate == 3.33) {
      hazardStep = '333';
    }
    _clearRateBase[hazardStep] ??= [];
    _deliverRateBase[hazardStep] ??= [];
    _failureDeliverRateBase[hazardStep] ??= [];
    _defeatRateBase[hazardStep] ??= [];
    _failureDefeatRateBase[hazardStep] ??= [];

    _clearRateBase[hazardStep]!.add(j.resultWave == 0);

    int popEggs = 0;
    for (var w in j.waveResults) {
      popEggs += w.goldenPopCount;
    }
    if (j.resultWave == 0) {
      _deliverRateBase[hazardStep]!
          .add(AppearUnit(my: j.myResult.goldenDeliverCount, appear: popEggs));
    } else {
      _failureDeliverRateBase[hazardStep]!
          .add(AppearUnit(my: j.myResult.goldenDeliverCount, appear: popEggs));
    }

    int defeatCount = 0;
    int popBosses = 0;
    for (var e in j.enemyResults) {
      defeatCount += e.defeatCount;
      popBosses += e.popCount;
    }
    if (j.resultWave == 0) {
      _defeatRateBase[hazardStep]!
          .add(AppearUnit(my: defeatCount, appear: popBosses));
    } else {
      _failureDefeatRateBase[hazardStep]!
          .add(AppearUnit(my: defeatCount, appear: popBosses));
    }
  }
}
