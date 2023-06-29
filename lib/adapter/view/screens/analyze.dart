import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../adapter/view/common_view/widget_util.dart';
import '../../../adapter/view/screens/statistics.dart';
import '../../../adapter/view/screens/weapon_list_widget.dart';
import '../../../application/data_interactor.dart';
import '../../../application/stage_stat_instractor.dart';
import '../../../application/stat_insteractor.dart';
import '../../../domain/coop_history_detail/coop_history_detail.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/stat/stat.dart';
import '../../../domain/stat/stat_detail.dart';
import '../../../util/log.dart';

class Analyze extends StatefulWidget {
  const Analyze({super.key, required this.dataInteractor});

  final DataInteractor dataInteractor;

  @override
  State<StatefulWidget> createState() {
    return _Analyze();
  }
}

class _Analyze extends State<Analyze> {
  final StatDetailInstractor stageStatInstractor = StatDetailInstractor();
  final StatInteractor statInteractor = StatInteractor();

  final double _maxHazard = 350;
  final double _verticalInterval = 50;

  bool _isDisplayEggsAll = false;
  bool _isDisplayDefeatsAll = false;

  bool _isDisplayRate = true;
  bool _isGraphRate = true;
  int _initialSelectTab = 0;

  final List<Widget> _tabs = [
    Tab(height: 30, child: WidgetUtil.createText('Stage', 12)),
    Tab(height: 30, child: WidgetUtil.createText('Data', 12)),
    Tab(height: 30, child: WidgetUtil.createText('Stat', 12)),
    Tab(height: 30, child: WidgetUtil.createText('Weapons', 12)),
  ];
  bool _isFinished = false;
  StatDetail? _statDetail;
  Stat? _stat;

  @override
  void initState() {
    super.initState();
    _isFinished = false;
    _statDetail = null;
    _calc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _calc() async {
    stageStatInstractor.reset();
    statInteractor.reset();

    var stream = widget.dataInteractor.getStreamOfResults();
    await for (CoopHistoryDetail history in stream) {
      stageStatInstractor.calcStat(history);
      statInteractor.calcStatEach(history);
    }

    stageStatInstractor.fix();
    _stat = statInteractor.fix();

    _statDetail = stageStatInstractor.getStageStat();
    setState(() {
      _isFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Log.i('analyze build: isFinished: $_isFinished');
    return Scaffold(
      appBar: AppBar(
        title: WidgetUtil.createText('Analyze', 14),
        toolbarHeight: 45,
      ),
      body: _isFinished ? _createAnalyze() : _createLoading(),
    );
  }

  Widget _createLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _createAnalyze() {
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        children: [
          TabBar(
            indicator: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: _tabs,
          ),
          Expanded(
              child: TabBarView(
            children: [
              _createSummary(),
              _createGraph(),
              _createStat(),
              _createWeaponStat()
            ],
          ))
        ],
      ),
    );
  }

  Widget _createSummary() {
    double width = MediaQuery.of(context).size.width;
    List<Widget> widgets = [];

    widgets.add(const SizedBox(height: 5));

    // final dataWidth = width * 0.7;
    // widgets.add(
    //   Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(color: Colors.grey),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Column(
    //       children: [
    //         WidgetUtil.createText('Data Num', 18),
    //         WidgetUtil.createDivider(),
    //         SizedBox(
    //           width: dataWidth,
    //           height: 30,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               const Text('Regular'),
    //               Text('${_stat!.regular}'),
    //             ],
    //           ),
    //         ),
    //         SizedBox(width: dataWidth, child: WidgetUtil.createSubDivider()),
    //         SizedBox(
    //           width: dataWidth,
    //           height: 30,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               const Text('Private'),
    //               Text('${_stat!.private}'),
    //             ],
    //           ),
    //         ),
    //         SizedBox(width: dataWidth, child: WidgetUtil.createSubDivider()),
    //         const SizedBox(height: 5),
    //       ],
    //     ),
    //   ),
    // );

    widgets.add(const SizedBox(height: 15));

    widgets.addAll(_createStageInfo());
    return SingleChildScrollView(
      child: Column(children: widgets),
    );
  }

  List<Widget> _createStageInfo() {
    double width = MediaQuery.of(context).size.width;
    final imageBlockWidth = width * 0.4;
    final textBlockWidth = width * 0.5;

    List<Widget> stages = [];
    Common.stageList.forEach(
      (id, url) {
        int played = 0;
        String grade = '-';
        int gradePoint = 0;
        String clearRate = '-';
        String eggsNightless = '-';
        String eggsNight = '-';
        String grzcEggsNightless = '-';
        String grzcEggsNight = '-';
        if (_statDetail!.stages[id] != null &&
            _statDetail!.stages[id]!.played > 0) {
          played = _statDetail!.stages[id]!.played;
          grade = Common.getGrade(context, _statDetail!.stages[id]!.maxGradeId);
          gradePoint = _statDetail!.stages[id]!.maxGradePoint;
          double rate =
              _statDetail!.stages[id]!.clear / _statDetail!.stages[id]!.played;
          clearRate = '${(rate * 100).toStringAsFixed(2)}%';
          eggsNightless =
              '${_statDetail!.stages[id]!.maxEggs.nightless.v.floor()}';
          eggsNight = '${_statDetail!.stages[id]!.maxEggs.night.v.floor()}';
          grzcEggsNightless =
              '${_statDetail!.stages[id]!.maxEggsWithGrizzco.nightless.v.floor()}';
          grzcEggsNight =
              '${_statDetail!.stages[id]!.maxEggsWithGrizzco.night.v.floor()}';
        }

        bool isValidGrizzco = Common.isRegularStage(id);

        stages.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // WidgetUtil.createText('hoge', 18),
                // WidgetUtil.createDivider(),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: imageBlockWidth,
                        child: Image.asset(
                          Common.getImageStage(id),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        _createTitle(
                            textBlockWidth, L10n.of(context)!.maxGrade, 14),
                        _createContent(
                          textBlockWidth,
                          WidgetUtil.createText(grade, 14),
                          WidgetUtil.createText('$gradePoint', 14),
                        ),
                        SizedBox(
                          width: textBlockWidth,
                          child: WidgetUtil.createSubDivider(),
                        ),
                        _createTitle(
                            textBlockWidth, L10n.of(context)!.jobNum, 14),
                        _createContent(
                          textBlockWidth,
                          null,
                          WidgetUtil.createText('$played', 14),
                        ),
                        SizedBox(
                          width: textBlockWidth,
                          child: WidgetUtil.createSubDivider(),
                        ),
                        _createTitle(
                            textBlockWidth, L10n.of(context)!.clearRate, 14),
                        _createContent(
                          textBlockWidth,
                          null,
                          WidgetUtil.createText(clearRate, 14),
                        ),
                        SizedBox(
                          width: textBlockWidth,
                          child: WidgetUtil.createSubDivider(),
                        ),
                        _createTitle(
                            textBlockWidth, L10n.of(context)!.maxEggs, 14),
                        _createContent(
                          textBlockWidth,
                          Row(
                            children: [
                              const Icon(Icons.sunny),
                              WidgetUtil.createText(eggsNightless, 14)
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.mode_night),
                              WidgetUtil.createText(eggsNight, 14)
                            ],
                          ),
                        ),
                        if (isValidGrizzco)
                          _createContent(
                            textBlockWidth,
                            Row(
                              children: [
                                const Icon(Icons.sunny, color: Colors.yellow),
                                Text(
                                  grzcEggsNightless,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.yellow),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.mode_night,
                                    color: Colors.yellow),
                                Text(
                                  grzcEggsNight,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.yellow),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: textBlockWidth,
                          child: WidgetUtil.createSubDivider(),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return stages;
  }

  Widget _createTitle(double w, String str, double size) {
    return SizedBox(
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WidgetUtil.createText(str, size),
        ],
      ),
    );
  }

  Widget _createContent(double w, Widget? cont1, Widget cont2) {
    return SizedBox(
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (cont1 != null)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: cont1,
            ),
          cont2,
        ],
      ),
    );
  }

  Widget _createGraph() {
    double maxEggsY = min(_statDetail!.maxEggs + 10, 100);
    double maxDefeatsY = min(_statDetail!.maxDefeats + 10, 100);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
                height: 30,
                child: WidgetUtil.createText(L10n.of(context)!.clearRate, 14)),
            Stack(
              children: [
                _createLineGraph([_statDetail!.clearRate],
                    _statDetail!.minHazard, true, 100, [Colors.blue], false),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _createUsage(L10n.of(context)!.average, Colors.blue),
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 30,
              child: Stack(
                children: [
                  Center(
                      child: WidgetUtil.createText(
                          '${L10n.of(context)!.eggs}(${L10n.of(context)!.average})',
                          14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WidgetUtil.createText(L10n.of(context)!.allData, 12),
                      Switch(
                        value: _isDisplayEggsAll,
                        activeColor: Common.colorList.first,
                        onChanged: (value) {
                          setState(() {
                            _isDisplayEggsAll = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                if (_isDisplayEggsAll)
                  _createGraphUnit(_statDetail!.success.eggs,
                      _statDetail!.failure.eggs, maxEggsY, _getLeftWidget),
                _createLineGraph(
                  [_statDetail!.delivers, _statDetail!.failureDelivers],
                  _statDetail!.minHazard,
                  false,
                  maxEggsY,
                  [Colors.green, Colors.red],
                  _isDisplayEggsAll,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: _createUsage(
                                  L10n.of(context)!.successJob, Colors.green)),
                          _createUsage(
                              L10n.of(context)!.failureJob, Colors.red),
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 30,
              child: Stack(
                children: [
                  Center(
                      child: WidgetUtil.createText(
                          '${L10n.of(context)!.defeatEnemy}(${L10n.of(context)!.average})',
                          14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WidgetUtil.createText(L10n.of(context)!.allData, 12),
                      Switch(
                        value: _isDisplayDefeatsAll,
                        activeColor: Common.colorList.first,
                        onChanged: (value) {
                          setState(() {
                            _isDisplayDefeatsAll = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                if (_isDisplayDefeatsAll)
                  _createGraphUnit(
                      _statDetail!.success.defeats,
                      _statDetail!.failure.defeats,
                      maxDefeatsY,
                      _getLeftWidget),
                _createLineGraph(
                  [_statDetail!.defeats, _statDetail!.failureDefeats],
                  _statDetail!.minHazard,
                  false,
                  maxDefeatsY,
                  [Colors.green, Colors.red],
                  _isDisplayDefeatsAll,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: _createUsage(
                                  L10n.of(context)!.successJob, Colors.green)),
                          _createUsage(
                              L10n.of(context)!.failureJob, Colors.red),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLineGraph(
      List<Map<String, double>> maps,
      double minHzd,
      bool isRate,
      double maxY,
      List<Color> colors,
      bool isBackgroundTransparent) {
    final int rate = isRate ? 100 : 1;
    List<LineChartBarData> lineCharts = [];
    double maxValue = 0;

    for (int i = 0; i < maps.length; i++) {
      var map = maps[i];
      List<FlSpot> spots = [];
      map.forEach((hazardStr, value) {
        int? hazard = int.tryParse(hazardStr);
        if (hazard != null && value > -1) {
          maxValue = max(maxValue, value * rate);
          spots.add(FlSpot(hazard.toDouble(), value * rate));
        }
      });
      lineCharts.add(LineChartBarData(
        spots: spots,
        color: colors[i],
        isCurved: false,
      ));
    }

    return _createLineGraphUnit(
        lineCharts, minHzd, maxY, isBackgroundTransparent);
  }

  Widget _createLineGraphUnit(List<LineChartBarData> lineCharts, double minHzd,
      double maxValue, bool isBackgroundTransparent) {
    Widget graph = SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.95,
      child: LineChart(
        LineChartData(
          backgroundColor: isBackgroundTransparent
              ? const Color.fromARGB(0, 0, 0, 0)
              : Colors.black,
          lineBarsData: lineCharts,
//          minX: minHzd,
          maxX: _maxHazard,
          minY: 0,
          maxY: maxValue,
          gridData: FlGridData(show: true, verticalInterval: _verticalInterval),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              axisNameWidget: Align(
                alignment: Alignment.centerRight,
                child: WidgetUtil.createText(L10n.of(context)!.dangerRate, 12),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 14,
                getTitlesWidget: _getHazardWidget,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: _getLeftWidget,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
        ),
      ),
    );
    return graph;
  }

  List<ScatterSpot> _getScatterSpot(Map<String, List<int>> maps, Color c) {
    final double radius = MediaQuery.of(context).size.width * 0.004;
    List<ScatterSpot> spots = [];
    maps.forEach((hazardStr, value) {
      int? hazard = int.tryParse(hazardStr);
      if (hazard != null) {
        for (int p in value) {
          spots.add(ScatterSpot(hazard.toDouble(), p.toDouble(),
              color: c, radius: radius));
        }
      }
    });
    return spots;
  }

  Widget _createGraphUnit(
      Map<String, List<int>> success,
      Map<String, List<int>> failure,
      double maxY,
      Widget Function(double, TitleMeta)? f) {
    final Color successColor = Colors.green.shade500.withAlpha(64);
    final Color failureColor = Colors.red.shade500.withAlpha(64);

    List<ScatterSpot> spots = [];
    spots.addAll(_getScatterSpot(failure, failureColor));
    spots.addAll(_getScatterSpot(success, successColor));

    Widget graph = SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.95,
      child: ScatterChart(
        ScatterChartData(
          scatterSpots: spots,
          backgroundColor: Colors.black,
          minX: _statDetail!.minHazard,
          maxX: _maxHazard,
          minY: 0,
          maxY: maxY,
          borderData: FlBorderData(
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white),
            ),
          ),
          gridData: FlGridData(show: true, verticalInterval: _verticalInterval),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              axisNameWidget: Align(
                alignment: Alignment.centerRight,
                child: WidgetUtil.createText(L10n.of(context)!.dangerRate, 12),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 14,
                getTitlesWidget: _getAxisEmpty,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: _getAxisEmpty,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
        ),
      ),
    );
    return graph;
  }

  Widget _getLeftWidget(double value, TitleMeta meta) {
    if ((value % 10) == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: WidgetUtil.createText('${(value.floor())}', 12),
      );
    }
    return Container();
  }

  Widget _getAxisEmpty(double value, TitleMeta meta) {
    return Container();
  }

  Widget _getLeftWidgetSmall(double value, TitleMeta meta) {
    if ((value % 2) == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: WidgetUtil.createText('${(value.floor())}', 12),
      );
    }
    return Container();
  }

  Widget _getHazardWidget(double value, TitleMeta meta) {
    if (value == _maxHazard) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: WidgetUtil.createText('${(value.floor())}%', 12),
      );
    } else if (value % 50 == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: WidgetUtil.createText('${(value.floor())}', 12),
      );
    } else {
      return Container();
    }
  }

  Widget _createUsage(String str, Color blockColor) {
    const double bs = 10;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Container(
            width: bs,
            height: bs,
            color: blockColor,
          ),
        ),
        WidgetUtil.createText(str, 12),
      ],
    );
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

  Widget _createStat() {
    InnerStats innerStats = InnerStats(
      context: context,
      weapons: [
        Common.randomWeapon,
        Common.randomWeapon,
        Common.randomWeapon,
        Common.randomWeapon
      ],
      stat: _stat!,
      isDisplayRate: _isDisplayRate,
      isGraphRate: _isGraphRate,
      initialSelectTab: _initialSelectTab,
      isNeedAllWeapon: true,
    );
    innerStats.setUpdateDisplayRate(_updateDisplayRate);
    innerStats.setUpdateGraphRate(_updateGraphRate);
    innerStats.setUpdateSelectTab(_updateSelectTab);
    return innerStats.build();
  }

  Widget _createWeaponStat() {
    InnerWeaponListWidget innerWeaponListWidget = InnerWeaponListWidget(
      context: context,
      weapons: _stat!.weaponRate,
      isNeedRate: false,
      jobnum: _stat!.jobNum,
    );
    return SingleChildScrollView(child: innerWeaponListWidget.build());
  }
}
