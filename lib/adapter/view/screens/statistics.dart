import 'package:expandable/expandable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/src/widgets/image.dart' as materialImage;

import '../../../adapter/view/app_bar/shift_app_bar.dart';
import '../../../adapter/view/common_view/inner_tab_controller.dart';
import '../../../adapter/view/common_view/wave_card.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../adapter/view/screens/weapon_list_widget.dart';
import '../../../application/common_utility.dart';
import '../../../application/data_interactor.dart';
import '../../../application/stat_insteractor.dart';
import '../../../domain/coop_history_detail/coop_history_detail.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/salmonrun_data/rule.dart';
import '../../../domain/shift/shift.dart';
import '../../../domain/stat/player_info.dart';
import '../../../domain/stat/rate.dart';
import '../../../domain/stat/stat.dart';
import '../../../domain/stat/tide.dart';
import '../../../domain/stat/wave_info.dart';
import '../../../util/log.dart';

class StatData {
  StatData({
    required this.statInteractor,
    required this.shiftDetail,
    required this.details,
  });

  final StatInteractor statInteractor;
  final Shift shiftDetail;
  final List<CoopHistoryDetail> details;
}

class Statistics extends StatefulWidget {
  const Statistics({
    super.key,
    required this.dataInteractor,
    required this.statInteractor,
    required this.shiftDetail,
    required this.details,
  });

  final DataInteractor dataInteractor;
  final StatInteractor statInteractor;
  final Shift shiftDetail;
  final List<CoopHistoryDetail> details;

  @override
  State<StatefulWidget> createState() {
    return _Statistics();
  }
}

class InnerStats {
  final BuildContext context;
  final List<String> weapons;
  final Stat stat;
  final bool isDisplayRate;
  final bool isGraphRate;
  final int initialSelectTab;
  final bool isNeedAllWeapon;
  Function? _updateDisplayRate;
  Function? _updateGraphRate;
  Function? _updateSelectTab;

  InnerStats({
    required this.context,
    required this.weapons,
    required this.stat,
    required this.isDisplayRate,
    required this.isGraphRate,
    required this.initialSelectTab,
    required this.isNeedAllWeapon,
  });

  void setUpdateDisplayRate(Function f) {
    _updateDisplayRate = f;
  }

  void setUpdateGraphRate(Function f) {
    _updateGraphRate = f;
  }

  void setUpdateSelectTab(Function f) {
    _updateSelectTab = f;
  }

  Widget build() {
    return SingleChildScrollView(
      child: SizedBox(
//                    height: screenSize.height,
        child: Column(
          children: [
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: createAllJobSummary(),
              ),
            ),
            WidgetUtil.createDivider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: InnerTabController(
                initailIndex: initialSelectTab,
                tebSpaceFlex: 2,
                freeSpaceFlex: 0,
                callback: (idx) {
                  if (idx != initialSelectTab) {
                    if (_updateSelectTab != null) {
                      _updateSelectTab!(idx);
                    }
                  }
                },
                tabs: [
                  Tab(height: 30, child: Text(L10n.of(context)!.individual)),
                  Tab(height: 30, child: Text(L10n.of(context)!.team)),
                ],
                bodys: [createInfoTable(false), createInfoTable(true)],
              ),
            ),
            WidgetUtil.createDivider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (_updateDisplayRate != null) {
                  _updateDisplayRate!();
                }
              },
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5, right: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.touch_app, size: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          createGraph(0, isDisplayRate),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                              child: createPieChardGuidWeapon()),
                        ],
                      ),
                      Row(
                        children: [
                          createGraph(1, isDisplayRate),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                              child: createPieChardGuidSp()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            WidgetUtil.createDivider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: createOkashiraGraph()),
            WidgetUtil.createDivider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: createEventGraph()),
            WidgetUtil.createDivider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: createKillGraph()),
          ],
        ),
      ),
    );
  }

  Widget createAllJobSummary() {
    const double barWidth = 15;
    var screenSize = MediaQuery.of(context).size;
    const double height = 95;
    double maxGradeByGradeId;
    if (stat.maxGradeId == 'Q29vcEdyYWRlLTg=') {
      maxGradeByGradeId = 999;
    } else {
      maxGradeByGradeId = 100;
    }
    Tide tide = Tide();
    for (int i = 0; i < 3; i++) {
      for (var ev in Common.getEventIdList()) {
        tide.t[i.toString()]!.win += stat.eventRate[ev]!.t[i.toString()]!.win;
        tide.t[i.toString()]!.lose += stat.eventRate[ev]!.t[i.toString()]!.lose;
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: screenSize.width * 0.45,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: getText(Common.getGrade(context, stat.maxGradeId)),
              ),
              SizedBox(
                width: screenSize.width * 0.45,
                height: 20,
                child: Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 1,
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          maxY: maxGradeByGradeId,
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barsSpace: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: maxGradeByGradeId,
                                  width: barWidth,
                                  rodStackItems: [
                                    BarChartRodStackItem(
                                        0,
                                        stat.maxGrade.toDouble(),
                                        Common.colorList[0]),
                                    BarChartRodStackItem(
                                        stat.maxGrade.toDouble(),
                                        maxGradeByGradeId,
                                        Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: getText(stat.maxGrade.toString(), 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [getText(L10n.of(context)!.jobNum)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: getTextBold('${stat.clearNum}', 14,
                        Colors.lightGreenAccent.shade400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: getTextBold('+', 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: getTextBold(
                        '${stat.jobNum - stat.clearNum}', 14, Colors.redAccent),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: getTextBold('=', 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: getText(stat.jobNum.toString(), 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenSize.width * 0.45,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: createScaleInfo(),
              ),
              SizedBox(height: 10, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  getText(L10n.of(context)!.clearRate),
                  getText('${(stat.clearRate * 100).toStringAsFixed(2)}%'),
                ],
              ),
              SizedBox(
                height: 20,
                child: Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 1,
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          maxY: 3,
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barsSpace: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: 3,
                                  width: barWidth,
                                  rodStackItems: [
                                    BarChartRodStackItem(
                                        0, stat.clearWave, Common.colorList[0]),
                                    BarChartRodStackItem(
                                        stat.clearWave, 3, Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: getText(
                          '${stat.clearWave.toStringAsFixed(2)} wave', 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget createScaleInfo() {
    double height = 20;
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white, fontSize: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              materialImage.Image.asset(Common.getImageScaleBronze(),
                  height: height),
              WidgetUtil.createText('${stat.scale.bronze}', 14),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              materialImage.Image.asset(Common.getImageScaleSilver(),
                  height: height),
              WidgetUtil.createText('${stat.scale.silver}', 14),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              materialImage.Image.asset(Common.getImageScaleGold(),
                  height: height),
              WidgetUtil.createText('${stat.scale.gold}', 14),
            ],
          ),
        ],
      ),
    );
  }

  Widget createOkashiraGraph() {
    Widget tw = WidgetUtil.createText(L10n.of(context)!.bossName, 12);
    Widget im = stat.okashiraId != null
        ? SizedBox(
            width: 20,
            child: materialImage.Image.asset(
              Common.getOkashira(stat.okashiraId!),
            ))
        : Container();
    int totalWin = 0, totalLose = 0;
    Tide tide = Tide();
    for (int i = 0; i < 3; i++) {
      tide.t[i.toString()]!.win += stat.okashira.t[i.toString()]!.win;
      tide.t[i.toString()]!.lose += stat.okashira.t[i.toString()]!.lose;
      totalWin += stat.okashira.t[i.toString()]!.win;
      totalLose += stat.okashira.t[i.toString()]!.lose;
    }
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [tw, im],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: createTideChildGraph(
                      Common.allRule,
                      2,
                      L10n.of(context)!.highTide,
                      tide.t['2']!.win,
                      tide.t['2']!.lose),
                ),
                Card(
                  child: createTideChildGraph(
                      Common.allRule,
                      1,
                      L10n.of(context)!.midTide,
                      tide.t['1']!.win,
                      tide.t['1']!.lose),
                ),
                Card(
                  child: createTideChildGraph(
                      Common.allRule,
                      0,
                      L10n.of(context)!.lowTide,
                      tide.t['0']!.win,
                      tide.t['0']!.lose),
                ),
                Card(
                  child: createTideChildGraph(Common.allRule, -1,
                      L10n.of(context)!.total, totalWin, totalLose),
                ),
                const SizedBox(
                  width: 14,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget createInfoTable(bool isTeam) {
    var size = MediaQuery.of(context).size;
    PlayerInfo avg, max, sum;
    PlayerInfo day, night;
    bool emptyFlag;
    if (isTeam) {
      avg = stat.teamAvgIkuras;
      max = stat.teamMaxIkuras;
      sum = stat.teamTotalIkuras;
      day = stat.teamMaxIkuraDay;
      night = stat.teamMaxIkuraNight;
      emptyFlag = true;
    } else {
      avg = stat.avgIkuras;
      max = stat.maxIkuras;
      sum = stat.totalIkuras;
      day = stat.maxIkuraOnlyDay;
      night = stat.maxIkuraIncNight;
      emptyFlag = false;
    }
    return Column(
      children: [
        DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(1.7),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.5),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                getText(''),
                getText(L10n.of(context)!.nightless),
                getText(L10n.of(context)!.nights),
              ]),
              _createDayNightIkuraRow(
                  day.goldenikura.v, night.goldenikura.v, 0),
              _createDayNightIkuraRow(day.ikura.v, night.ikura.v, 1),
            ],
          ),
        ),
        SizedBox(
            height: 10,
            width: size.width * 0.9,
            child: const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 1,
            )),
        DefaultTextStyle(
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1.7),
                1: FlexColumnWidth(1.0),
                2: FlexColumnWidth(1.0),
                3: FlexColumnWidth(1.0),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  getText(' '),
                  getText(L10n.of(context)!.average),
                  getText(L10n.of(context)!.max),
                  getText(L10n.of(context)!.total),
                ]),
                createIkuraTableRow(
                    avg.goldenikura.v, max.goldenikura.v, sum.goldenikura.v, 0),
                createIkuraTableRow(avg.ikura.v, max.ikura.v, sum.ikura.v, 1),
                createIkuraTableRow(
                    avg.rescue.v, max.rescue.v, sum.rescue.v, 2),
                createIkuraTableRow(
                    avg.rescued.v, max.rescued.v, sum.rescued.v, 3, emptyFlag),
                createIkuraTableRow(
                    avg.defeat.v, max.defeat.v, sum.defeat.v, 4),
              ],
            )),
      ],
    );
  }

  TableRow _createDayNightIkuraRow(double day, double night, int i) {
    Widget tw;
    Widget im = Container();
    switch (i) {
      case 0:
        tw = WidgetUtil.createText(L10n.of(context)!.goldenEgg, 12);
        im = materialImage.Image.asset(
          Common.getImageGikura(),
          scale: 7.0,
        );
        break;
      case 1:
        tw = WidgetUtil.createText(L10n.of(context)!.powerEgg, 12);
        im = materialImage.Image.asset(
          Common.getImageIkura(),
          scale: 11.0,
        );
        break;
      default:
        throw Exception();
    }
    BoxDecoration dec;
    if (i % 2 == 0) {
      dec = BoxDecoration(color: Colors.grey.shade800);
    } else {
      dec = const BoxDecoration();
    }
    return TableRow(decoration: dec, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tw,
          im,
        ],
      ),
      getText(day.toInt().toString()),
      getText(night.toInt().toString()),
    ]);
  }

  TableRow createIkuraTableRow(double avg, double max, double ttl, int i,
      [bool isEmpty = false]) {
    Widget tw;
    Widget im = Container();

    switch (i) {
      case 0:
        tw = WidgetUtil.createText(L10n.of(context)!.goldenEgg, 12);
        im = materialImage.Image.asset(
          Common.getImageGikura(),
          scale: 7.0,
        );
        break;
      case 1:
        tw = WidgetUtil.createText(L10n.of(context)!.powerEgg, 12);
        im = materialImage.Image.asset(
          Common.getImageIkura(),
          scale: 11.0,
        );
        break;
      case 2:
        tw = WidgetUtil.createText(L10n.of(context)!.statRescue, 12);
        im = materialImage.Image.asset(
          Common.getImageRescue(),
          scale: 7.0,
        );
        break;
      case 3:
        tw = WidgetUtil.createText(L10n.of(context)!.statRescued, 12);
        im = materialImage.Image.asset(
          Common.getImageDead(),
          scale: 7.0,
        );
        break;
      case 4:
        tw = WidgetUtil.createText(L10n.of(context)!.statDefeat, 12);
        im = materialImage.Image.asset(
          Common.getSakelienGolden(),
          scale: 20.0,
        );
        break;
      default:
        throw Exception();
    }

    BoxDecoration dec;
    if (i % 2 == 0) {
      dec = BoxDecoration(color: Colors.grey.shade800);
    } else {
      dec = const BoxDecoration();
    }
    return TableRow(decoration: dec, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tw,
          im,
        ],
      ),
      getText(isEmpty ? '-' : avg.toStringAsFixed(2)),
      getText(isEmpty ? '-' : max.toInt().toString()),
      getText(isEmpty ? '-' : ttl.toInt().toString()),
    ]);
  }

  Widget createTideChildGraph(
      int ruleType, int tideLevel, String tide, int win, int lose) {
    var screenSize = MediaQuery.of(context).size;
    double wid = screenSize.width * 0.21;
    double hgt = 18;
    double rate = (win + lose) == 0 ? -1 : (win / (win + lose));
    String rateStr = (win == 0 && lose == 0)
        ? 'NoData'
        : '${(rate * 100).toStringAsFixed(2)}%';
    double waveHeightPos = -1;
    double blockHeight = hgt * 2.1;
    switch (tideLevel) {
      case 2: // hight
        waveHeightPos = blockHeight * 0.2;
        break;
      case 1: // normal
        waveHeightPos = blockHeight * 0.5;
        break;
      case 0: // low
        waveHeightPos = blockHeight * 0.95;
        break;
      default: // for total
        waveHeightPos = -1;
        break;
    }

    if ((ruleType) == 0) {
      return SizedBox(
        width: wid,
      );
    } else {
      Color winColor = Colors.lightGreenAccent.shade400;
      Color loseColor = Colors.redAccent;
      Color divColor = Colors.white;

      if (win == 0 && lose == 0) {
        winColor = Colors.grey.shade500;
        loseColor = Colors.grey.shade500;
        divColor = Colors.grey.shade500;
      }
      return SizedBox(
        width: wid,
        height: blockHeight,
        child: Stack(
          children: [
            if (waveHeightPos > -1)
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: waveHeightPos,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: 0.5,
                        child: materialImage.Image.asset(Common.getWave()),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            if (tideLevel == -1)
              Align(
                alignment: Alignment.topLeft,
                child: WidgetUtil.createText('All', 10),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: wid,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      getTextBold(win.toString(), 11, winColor),
                      getTextBold(' / ', 11, divColor),
                      getTextBold(lose.toString(), 11, loseColor),
                    ],
                  ),
                ),
                (win != 0 || lose != 0)
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: hgt,
                            width: wid,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Opacity(
                                  opacity: 0.7,
                                  child: BarChart(
                                    BarChartData(
                                      titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                        leftTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                        topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                        rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                      ),
                                      borderData: FlBorderData(show: false),
                                      gridData: FlGridData(show: false),
                                      maxY: 1,
                                      barGroups: [
                                        BarChartGroupData(
                                          x: 0,
                                          barsSpace: 0,
                                          barRods: [
                                            BarChartRodData(
                                              toY: 1,
                                              width: hgt * 0.6,
                                              rodStackItems: [
                                                BarChartRodStackItem(0, rate,
                                                    Common.colorList[0]),
                                                BarChartRodStackItem(
                                                    rate,
                                                    1,
                                                    (win + lose) == 0
                                                        ? Colors.grey.shade700
                                                        : Colors.black),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          getText(rateStr, 10),
                        ],
                      )
                    : SizedBox(
                        height: hgt,
                        width: wid,
                      ),
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget createTideGraph(int num) {
    List<String> eventList = Common.getEventIdList();
    List<String> eventNameList = Common.getEventNameList(context);
    List<int> tideList = Common.eventTideMap[eventList[num]] ??
        [Rule.none.rawValue, Rule.none.rawValue, Rule.none.rawValue];
    int totalWin = 0, totalLose = 0;
    for (int i = 0; i < 3; i++) {
      totalWin += stat.eventRate[eventList[num]]!.t[i.toString()]!.win;
      totalLose += stat.eventRate[eventList[num]]!.t[i.toString()]!.lose;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 1, 0, 0),
          child: WidgetUtil.createText(eventNameList[num], 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: createTideChildGraph(
                  tideList[0],
                  2,
                  L10n.of(context)!.highTide,
                  stat.eventRate[eventList[num]]!.t['2']!.win,
                  stat.eventRate[eventList[num]]!.t['2']!.lose),
            ),
            Card(
              child: createTideChildGraph(
                  tideList[1],
                  1,
                  L10n.of(context)!.midTide,
                  stat.eventRate[eventList[num]]!.t['1']!.win,
                  stat.eventRate[eventList[num]]!.t['1']!.lose),
            ),
            Card(
              child: createTideChildGraph(
                  tideList[2],
                  0,
                  L10n.of(context)!.lowTide,
                  stat.eventRate[eventList[num]]!.t['0']!.win,
                  stat.eventRate[eventList[num]]!.t['0']!.lose),
            ),
            Card(
              child: createTideChildGraph(Common.allRule, -1,
                  L10n.of(context)!.total, totalWin, totalLose),
            ),
          ],
        ),
      ],
    );
  }

  Widget createTideTotalGraph() {
    List<String> eventList = Common.getEventIdList();
    int totalWin = 0, totalLose = 0;
    Tide tide = Tide();
    for (int i = 0; i < 3; i++) {
      for (var ev in eventList) {
        tide.t[i.toString()]!.win += stat.eventRate[ev]!.t[i.toString()]!.win;
        tide.t[i.toString()]!.lose += stat.eventRate[ev]!.t[i.toString()]!.lose;
        totalWin += stat.eventRate[ev]!.t[i.toString()]!.win;
        totalLose += stat.eventRate[ev]!.t[i.toString()]!.lose;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: WidgetUtil.createText(L10n.of(context)!.total, 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: createTideChildGraph(
                  Common.allRule,
                  2,
                  L10n.of(context)!.highTide,
                  tide.t['2']!.win,
                  tide.t['2']!.lose),
            ),
            Card(
              child: createTideChildGraph(
                  Common.allRule,
                  1,
                  L10n.of(context)!.midTide,
                  tide.t['1']!.win,
                  tide.t['1']!.lose),
            ),
            Card(
              child: createTideChildGraph(
                  Common.allRule,
                  0,
                  L10n.of(context)!.lowTide,
                  tide.t['0']!.win,
                  tide.t['0']!.lose),
            ),
            Card(
              child: createTideChildGraph(Common.allRule, -1,
                  L10n.of(context)!.total, totalWin, totalLose),
            ),
          ],
        ),
      ],
    );
  }

  Widget createEventGraph() {
    List<Widget> lists = [];
    for (int i = 0; i < Common.getEventIdList().length; i++) {
      lists.add(
        const Divider(
          color: Colors.grey,
          height: 1,
          thickness: 0.5,
        ),
      );
      lists.add(createTideGraph(i));
    }
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white, fontSize: 14),
      child: ExpandablePanel(
        header: createTideTotalGraph(),
        collapsed: Container(),
        expanded: Column(children: lists),
        theme: const ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.top,
          iconSize: 10,
          iconColor: Colors.white,
          iconPadding: EdgeInsets.fromLTRB(0, 0, 3, 0),
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
        ),
      ),
    );
  }

  Widget getText(String s, [double size = 14, Color c = Colors.white]) {
    return Text(
      s,
      style: TextStyle(color: c, fontSize: size),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget getTextBold(String s, [double size = 14, Color c = Colors.white]) {
    return Text(
      s,
      style: TextStyle(color: c, fontSize: size, fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget createGraph(int type, bool isDisplayRate) {
    List<PieChartSectionData> func;
    switch (type) {
      case 0:
        func = createWeaponSections(isDisplayRate);
        break;
      case 1:
        func = createSpecialSections(isDisplayRate);
        break;
      default:
        throw Error();
    }
    return SizedBox(
      width: 80,
      height: 120,
      child: PieChart(
        PieChartData(
            borderData: FlBorderData(show: true),
            startDegreeOffset: 270,
            sectionsSpace: 2,
            centerSpaceRadius: 10,
            sections: func),
      ),
    );
  }

  List<PieChartSectionData> createWeaponSections(bool isDisplayRate) {
    var tStyle = const TextStyle(
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    bool isAllRandom = weapons.contains(Common.randomWeapon);
    bool isKumaRandom = weapons.contains(Common.goldenRandomWeapon);
    int useCount = stat.weaponRate.keys.length;
    int length;
    if (isAllRandom) {
      int weaponNum;
      double rate;
      if (isNeedAllWeapon) {
        weaponNum = Common.weaponMap.length + Common.grizzcoWeaponMap.length;
        rate = useCount /
            (Common.weaponMap.length +
                Common.grizzcoWeaponMap.length); // add Grizzco weapon
      } else {
        weaponNum = Common.weaponMap.length + 1;
        rate = useCount / (Common.weaponMap.length + 1); // add Grizzco weapon
      }
      length = 2;
      return List.generate(
        length,
        (index) {
          double val = isDisplayRate ? rate * 100 : useCount.toDouble();
          String ttl = isDisplayRate
              ? '${(rate * 100).toStringAsFixed(2)}%'
              : useCount.toString();
          if (index == 0) {
            val = isDisplayRate ? rate * 100 : useCount.toDouble();
            ttl = isDisplayRate
                ? '${(rate * 100).toStringAsFixed(2)}%'
                : useCount.toString();
          } else {
            val = isDisplayRate
                ? (1 - rate) * 100
                : (weaponNum - useCount).toDouble();
            ttl = isDisplayRate
                ? '${((1 - rate) * 100).toStringAsFixed(2)}%'
                : (weaponNum - useCount).toString();
          }
          return PieChartSectionData(
              color: Common.colorList[index],
              value: val,
              title: ttl,
              titleStyle: tStyle);
        },
      );
    } else if (isKumaRandom) {
      List<Rate> list = [];
      length = 0;
      Common.grizzcoWeaponMap.forEach((key, value) {
        if (stat.weaponRate.containsKey(key)) {
          list.add(stat.weaponRate[key]!);
        } else {
          list.add(Rate(name: key, num: 0, rate: 0));
        }
        length++;
      });
      return List.generate(length, (index) {
        double val = isDisplayRate
            ? list[index].rate * 100.toDouble()
            : list[index].num.toDouble();
        String ttl = isDisplayRate
            ? '${(list[index].rate * 100).toStringAsFixed(2)}%'
            : list[index].num.toString();
        return PieChartSectionData(
          color: Common.colorList[index],
          value: val,
          title: ttl,
          titleStyle: tStyle,
          titlePositionPercentageOffset: 0.6,
        );
      });
    } else {
      List<Rate> list = [];
      for (var w in weapons) {
        if (stat.weaponRate[w] != null) {
          list.add(stat.weaponRate[w]!);
        }
      }
      length = list.length;

      return List.generate(length, (index) {
        double val = isDisplayRate
            ? list[index].rate * 100.toDouble()
            : list[index].num.toDouble();
        String ttl = isDisplayRate
            ? '${(list[index].rate * 100).toStringAsFixed(2)}%'
            : list[index].num.toString();
        return PieChartSectionData(
          color: Common.colorList[index],
          value: val,
          title: ttl,
          titleStyle: tStyle,
          titlePositionPercentageOffset: 0.6,
        );
      });
    }
  }

  List<PieChartSectionData> createSpecialSections(bool isDisplayRate) {
    List<Rate> list = [];
    for (var sp in Common.getSpecialWeaponList()) {
      if (stat.specialRate[sp] != null) {
        list.add(stat.specialRate[sp]!);
      } else {
        list.add(Rate(name: sp, rate: 0, num: 0));
      }
    }

    var tStyle = const TextStyle(
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return List.generate(list.length, (index) {
      double val = isDisplayRate
          ? list[index].rate * 100.toDouble()
          : list[index].num.toDouble();
      String ttl = isDisplayRate
          ? '${(list[index].rate * 100).toStringAsFixed(2)}%'
          : list[index].num.toString();
      return PieChartSectionData(
        color: Common.colorList[index],
        value: val,
        title: ttl,
        titleStyle: tStyle,
        titlePositionPercentageOffset: 0.7,
      );
    });
  }

  Widget createPieChardGuidWeapon() {
    List<Widget> wList = [];

    bool isGreenRandom = weapons.contains(Common.randomWeapon);
    bool isKumaRandom = weapons.contains(Common.goldenRandomWeapon);
    if (isGreenRandom) {
      wList.add(
        Card(
          color: Common.colorList[0],
          margin: const EdgeInsets.all(0.1),
          child: createWeaponImage(Common.randomWeapon),
        ),
      );
      if (!isNeedAllWeapon) {
        wList.add(
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WeaponListWidget(
                    weapon: stat.weaponRate,
                    jobnum: stat.jobNum,
                    isNeedRate: true,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Text(
//                  '${calcCompleteRate(stat.allWeaponRate).toStringAsFixed(2)}%',
                    L10n.of(context)!.weaponDetail,
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontSize: 12))
              ],
            ),
          ),
        );
      }
    } else if (isKumaRandom) {
      List<Widget> col = [];
      List<Widget> row = [];
      int idx = 0;
      Common.grizzcoWeaponMap.forEach((key, value) {
        if (col.length == 4) {
          row.add(Column(children: col));
          col = [];
        }

        col.add(Card(
          color: Common.colorList[idx++],
          margin: const EdgeInsets.all(0.1),
          child: createWeaponImage(key),
        ));
      });
      row.add(Column(children: col));
      return Row(
        children: row,
      );
    } else {
      for (int i = 0; i < weapons.length; i++) {
        wList.add(
          Card(
            color: Common.colorList[i],
            margin: const EdgeInsets.all(0.1),
            child: createWeaponImage(weapons[i]),
          ),
        );
      }
    }
    return Column(
      children: wList,
    );
  }

  Widget createPieChardGuidSp() {
    List<Widget> wList = [];
    List<String> spList = Common.getSpecialWeaponList();
    for (int start = 0, end = 4; start < spList.length; start += 4, end += 4) {
      List<Widget> children = [];
      for (int i = start; i < end; i++) {
        if (i >= spList.length) {
          break;
        }
        children.add(Card(
          color: Common.colorList[i],
          margin: const EdgeInsets.all(0.1),
          child: createImageSpecial(spList[i]),
        ));
      }
      wList.add(Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ));
    }

    return Row(
      children: wList,
    );
  }

  Widget createImageSpecial(String s) {
    return WidgetUtil.createSpecialImageFromId(s, 25, false);
  }

  Widget createWeaponImage(String p) {
    return WidgetUtil.createWeaponImage(p, 25, false);
  }

  Widget getLeftAxWidget(double value, TitleMeta meta) {
    String str = (isGraphRate && value.toInt() == 100)
        ? '100%'
        : value.toInt().toString();
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 5,
        child: Text(str, style: const TextStyle(fontSize: 11)));
  }

  Widget getBottomAxWidget(double value, TitleMeta meta) {
    List<String> bossNameList = Common.getBossList();
    int n = value.toInt();
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: materialImage.Image.asset(
          Common.getOomono(bossNameList[n]),
          scale: 5,
        ));
  }

  Widget getEmptyAxWidget(double value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide: meta.axisSide, space: 2, child: const Text(''));
  }

  Widget createKillGraph() {
    var screenSize = MediaQuery.of(context).size;
    double? max = isGraphRate ? 100 : null;
    return SizedBox(
      width: screenSize.width,
      height: 150,
      child: GestureDetector(
        onTap: () {
          if (_updateGraphRate != null) {
            _updateGraphRate!();
          }
        },
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5, right: 5),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.touch_app, size: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 20, 0),
              child: BarChart(
                BarChartData(
                    titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: getBottomAxWidget)),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 35,
                          getTitlesWidget: getLeftAxWidget,
                        )),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: getEmptyAxWidget,
                                reservedSize: 15))),
                    borderData: FlBorderData(
                        border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1, color: Colors.white),
                      bottom: BorderSide(width: 1, color: Colors.white),
                    )),
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipPadding: EdgeInsets.zero,
                        tooltipMargin: 0,
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            rod.toY.round().toString(),
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    maxY: max,
                    alignment: BarChartAlignment.spaceBetween,
                    groupsSpace: 10,
                    barGroups: getData(isGraphRate)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(bool isRate) {
    List<BarChartGroupData> l = [];
    int count = 0;
    for (var b in Common.getBossList()) {
      double value;
      if (isRate) {
        double def = (stat.salmonidsMyDef[b] == null
            ? 0
            : stat.salmonidsMyDef[b]!.toDouble());
        double pop = (stat.salmonidsPop[b] == null
            ? 0
            : stat.salmonidsPop[b]!.toDouble());

        value = pop != 0 ? def / pop * 100 : 0;
      } else {
        value = (stat.salmonidsMyDef[b] == null
            ? 0
            : stat.salmonidsMyDef[b]!.toDouble());
      }
      BarChartRodData data = BarChartRodData(
          toY: value,
          width: 15,
          borderRadius: const BorderRadius.all(Radius.zero),
          rodStackItems: [
            BarChartRodStackItem(0, value, Common.colorList[0]),
          ]);

      l.add(BarChartGroupData(
        x: count++,
        showingTooltipIndicators: [0],
        barRods: [data],
      ));
    }

    return l;
  }

  double calcCompleteRate(List<Rate> list) {
    int count = 0;
    for (var v in list) {
      if (v.num != 0) {
        count++;
      }
    }

    return count / 51 * 100;
  }
}

class InnerStatsForEggstraWork extends InnerStats {
  InnerStatsForEggstraWork({
    required super.context,
    required super.weapons,
    required super.stat,
    required super.isDisplayRate,
    required super.isGraphRate,
    required super.initialSelectTab,
    required super.isNeedAllWeapon,
  });

  Widget _createHighScoreWaveCard() {
    const int switchNum = 3;
    final double width = MediaQuery.of(context).size.width * 0.9;

    List<Widget> row = [];
    List<Widget> col = [];

    Log.i('eggstraMaxEggsWaveInfo: ${stat.eggstraMaxEggsWaveInfo.length}');
    for (int i = 0; i < stat.eggstraMaxEggsWaveInfo.length; i++) {
      if (i == switchNum) {
        col.add(Row(
            mainAxisAlignment: MainAxisAlignment.center, children: [...row]));
        row.clear();
      }
      row.add(WaveCard.createWaveCardForContest(
          context, stat.eggstraMaxEggsWaveInfo[i], i, width));
    }

    col.add(
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [...row]));
    return Column(
      children: col,
    );
  }

  List<Widget> _createWaveInfo() {
    const double cardHeight = 65;
    const double titleHeight = 40;
    var width = MediaQuery.of(context).size.width;
    final double cardWidth = width * 0.3;

    List<Widget> ret = [];

    ret.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: titleHeight,
            width: cardWidth,
          ),
          SizedBox(
            height: titleHeight,
            width: cardWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: materialImage.Image.asset(
                        Common.getImageGikura(),
                        scale: 4.5,
                      ),
                    ),
                    WidgetUtil.createText(L10n.of(context)!.eggs, 14),
                  ],
                ),
                WidgetUtil.createText('[ave/max]', 12),
              ],
            ),
          ),
          SizedBox(
            height: titleHeight,
            width: cardWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: materialImage.Image.asset(
                        Common.getImageGikura(),
                        scale: 4.5,
                      ),
                    ),
                    WidgetUtil.createText(L10n.of(context)!.popEggs, 14),
                  ],
                ),
                WidgetUtil.createText('[ave/max]', 12),
              ],
            ),
          ),
        ],
      ),
    );
    ret.add(WidgetUtil.createSubDivider());

    for (int i = 0; i < stat.eggstraWaveInfo.length; i++) {
      WaveInfo wave = stat.eggstraWaveInfo[i];
      List<Widget> rowChild = [];

      // wave card
      rowChild.add(WaveCard.createWaveCardShort(
          context, width, i, wave.tide, wave.eventId));

      // ave
      String ave = wave.num == 0
          ? '0.0'
          : (wave.totalEggs / wave.num).toStringAsFixed(2);
      String appearAve = wave.num == 0
          ? '0.0'
          : (wave.totalAppearEggs / wave.num).toStringAsFixed(2);
      rowChild.add(
        SizedBox(
          height: cardHeight,
          width: cardWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetUtil.createText(ave, 14),
              WidgetUtil.createText('${wave.maxEggs}', 14),
            ],
          ),
        ),
      );

      rowChild.add(
        SizedBox(
          height: cardHeight,
          width: cardWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetUtil.createText(appearAve, 14),
              WidgetUtil.createText('${wave.maxAppearEggs}', 14),
            ],
          ),
        ),
      );

      ret.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowChild,
      ));
      ret.add(WidgetUtil.createSubDivider());
    }
    return ret;
  }

  @override
  Widget build() {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
//              height: 40,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                    child:
                        WidgetUtil.createText(L10n.of(context)!.highScore, 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            materialImage.Image.asset(Common.getImageGikura(),
                                scale: 4.5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: WidgetUtil.createText(
                                  '${stat.eggstraMaxEggs}', 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            materialImage.Image.asset(Common.getImageIkura(),
                                scale: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: WidgetUtil.createText(
                                  '${stat.eggstraMaxPowerEggs}', 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _createHighScoreWaveCard(),
            WidgetUtil.createDivider(),
            SizedBox(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetUtil.createText(L10n.of(context)!.playCount, 14),
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: WidgetUtil.createText('${stat.jobNum}', 14)),
                ],
              ),
            ),
            WidgetUtil.createDivider(),
            Column(children: _createWaveInfo()),
            WidgetUtil.createDivider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: createKillGraph()),
          ],
        ),
      ),
    );
  }
}

class _Statistics extends State<Statistics> {
  _Statistics();

  Stat stat = Stat();
  bool _isDisplayRate = true;
  bool _isGraphRate = true;
  int _initialSelectTab = 0;

  @override
  void initState() {
    _computeStat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static Future<Stat> _calcStat(StatData data) async {
    Log.i('stat');
    data.statInteractor.reset();
    Rule rule = CommonUtil.convertRule(data.shiftDetail.rule);
    await data.statInteractor.calcStat(data.details, rule);
    return data.statInteractor.fix();
  }

  Future<void> _computeStat([bool isForce = false]) async {
    if (isForce || stat.jobNum == 0) {
      Log.i('calc');
      StatData data = StatData(
        statInteractor: widget.statInteractor,
        shiftDetail: widget.shiftDetail,
        details: widget.details,
      );
      compute(_calcStat, data).then((value) {
        bool isUpdate = false;
        Shift newShift = widget.shiftDetail;
        if (CommonUtil.isRuleRegular(widget.shiftDetail.rule) ||
            CommonUtil.isRuleBigRun(widget.shiftDetail.rule)) {
          isUpdate = (newShift.maxGradeId != value.maxGradeId) ||
              (newShift.maxGradePoint != value.maxGrade) ||
              (newShift.played != value.jobNum);
          newShift.maxGradeId = value.maxGradeId;
          newShift.maxGradePoint = value.maxGrade;
          newShift.played = value.jobNum;
        } else if (CommonUtil.isRuleTeamContest(widget.shiftDetail.rule)) {
          isUpdate = (newShift.maxEggs != value.eggstraMaxEggs) ||
              (newShift.played != value.jobNum);
          newShift.maxEggs = value.eggstraMaxEggs;
          newShift.played = value.jobNum;
        }

        if (isUpdate) {
          widget.dataInteractor.saveShiftData(newShift);
        }
        if (mounted) {
          setState(() {
            stat = value;
          });
        }
      });
    }
  }

  void _updateDisplayRate() {
    setState(() {
      _isDisplayRate = !_isDisplayRate;
    });
  }

  void _updateGraphRate() {
    setState(() {
      _isGraphRate = !_isGraphRate;
    });
  }

  void _updateSelectTab(int idx) {
    setState(() {
      _initialSelectTab = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ShiftAppBar(shift: widget.shiftDetail).build(),
        body: stat.jobNum == 0
            ? const Center(child: CircularProgressIndicator())
            : _createChild());
  }

  Widget _createChild() {
    InnerStats innerStats;
    if (CommonUtil.isRuleTeamContest(widget.shiftDetail.rule)) {
      innerStats = InnerStatsForEggstraWork(
          context: context,
          weapons: widget.shiftDetail.weapons,
          stat: stat,
          isDisplayRate: _isDisplayRate,
          isGraphRate: _isGraphRate,
          initialSelectTab: _initialSelectTab,
          isNeedAllWeapon: false);
      innerStats.setUpdateDisplayRate(_updateDisplayRate);
      innerStats.setUpdateGraphRate(_updateGraphRate);
    } else {
      innerStats = InnerStats(
          context: context,
          weapons: widget.shiftDetail.weapons,
          stat: stat,
          isDisplayRate: _isDisplayRate,
          isGraphRate: _isGraphRate,
          initialSelectTab: _initialSelectTab,
          isNeedAllWeapon: false);
      innerStats.setUpdateDisplayRate(_updateDisplayRate);
      innerStats.setUpdateGraphRate(_updateGraphRate);
      innerStats.setUpdateSelectTab(_updateSelectTab);
    }
    return innerStats.build();
  }
}
