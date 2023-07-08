import 'dart:math';

import 'package:flutter/src/widgets/image.dart' as materialImage;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../adapter/view/app_bar/shift_app_bar.dart';
import '../../../adapter/view/common_view/wave_card.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../application/app_data_instractor.dart';
import '../../../application/common_utility.dart';
import '../../../application/data_interactor.dart';
import '../../../domain/coop_history_detail/coop_history_detail.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/shift/shift.dart';
import '../../../util/log.dart';

class Detail extends StatefulWidget {
  const Detail({
    super.key,
    required this.appDataInteractor,
    required this.dataInteractor,
    required this.shiftDetail,
    required this.details,
    required this.idList,
    required this.id,
  });

  final AppDataInteractor appDataInteractor;
  final DataInteractor dataInteractor;

  final Shift? shiftDetail;
  final List<CoopHistoryDetail> details;
  final List<String> idList;
  final String id;

  @override
  State<StatefulWidget> createState() {
    return _Detail();
  }
}

class _Detail extends State<Detail> {
  static const double _swipeDelta = 25;

  bool _isHideName = false;
  late String _nowId;
  late CoopHistoryDetail _detail;

  void _loadDetail(String id) {
    for (CoopHistoryDetail h in widget.details) {
      if (h.id == id) {
        _detail = h;
        break;
      }
    }
  }

  String? _getNextJobId(String now) {
    int pos = widget.idList.indexOf(now);
    if (pos <= 0) {
      return null;
    }
    return widget.idList[pos - 1];
  }

  String? _getPrevJobId(String now) {
    int pos = widget.idList.indexOf(now);
    if (pos < 0 || pos == widget.idList.length - 1) {
      return null;
    }
    return widget.idList[pos + 1];
  }

  // void _updateAll(CoopHistory his) async {
  //   DateTime target = DateTime.parse(his.playedTime);
  //   var shifts = await widget.dataInteractor.loadAllShifts();
  //   for (Shift shift in shifts) {
  //     DateTime s = DateTime.parse(shift.start);
  //     DateTime e = DateTime.parse(shift.start);
  //     if (target.isAfter(s) && target.isBefore(e)) {}
  //   }
  // }

  void _updateJobId(String newId) {
    setState(() {
      _nowId = newId;
      _loadDetail(_nowId);
    });
  }

  void _update(bool isHide) {
    setState(() {
      _isHideName = isHide;
    });
  }

  @override
  void initState() {
    super.initState();
    _nowId = widget.id;

    _loadDetail(_nowId);
  }

  @override
  Widget build(BuildContext context) {
    double start = -1, diff = 0;

    return Scaffold(
      appBar: ShiftAppBar(shift: widget.shiftDetail).build(),
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragDown: (details) {
            start = details.globalPosition.dx;
            diff = 0;
          },
          onHorizontalDragUpdate: (details) {
            diff = start - details.globalPosition.dx;
          },
          onHorizontalDragEnd: (details) {
            if (diff <= -1 * _swipeDelta) {
              // 次のバイトへ
              String? next = _getNextJobId(_nowId);
              if (next != null) {
                _updateJobId(next);
              }
            }
            if (diff >= _swipeDelta) {
              // 前のバイトへ
              String? prev = _getPrevJobId(_nowId);
              if (prev != null) {
                _updateJobId(prev);
              }
            }
          },
          child: buildchild(context),
        ),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniEndDocked,
      // floatingActionButton: SizedBox(
      //   width: 100,
      //   height: 30,
      //   child: FloatingActionButton.extended(
      //     tooltip: '最新のバイトを取得するよ',
      //     label: WidgetUtil.createText('最新のバイトへ', 10),
      //     foregroundColor: Colors.white,
      //     backgroundColor: Colors.grey.shade800,
      //     shape: const RoundedRectangleBorder(
      //       side: BorderSide(color: Colors.white),
      //       borderRadius: BorderRadius.all(Radius.circular(10)),
      //     ),
      //     // extendedPadding: const EdgeInsets.only(left: 5, right: 5),
      //     onPressed: () {
      //       Log.i('onPressed');
      //     },
      //   ),
      // )
      // persistentFooterButtons: _footer(),
      // persistentFooterAlignment: AlignmentDirectional.center,
    );
  }

  // List<Widget> _footer() {
  //   var size = MediaQuery.of(context).size;
  //   List<Widget> widgets = [];
  //   widgets.add(
  //     OutlinedButton(
  //         style: OutlinedButton.styleFrom(
  //           foregroundColor: Colors.white,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           side: const BorderSide(color: Colors.blue),
  //         ),
  //         onPressed: () async {
  //           CoopHistory? latest = await widget.dataInteractor
  //               .loadOnlyFirstResult(widget.appDataInteractor.getActiveUser()!);
  //           if (latest != null) {
  //             Log.i('success load latest');
  //             _updateAll(latest);
  //           }
  //         },
  //         child: WidgetUtil.createText('To Latest', 12)),
  //   );
  //   widgets.add(SizedBox(width: size.width / 4, child: Container()));

  //   return widgets;
  // }

  Widget createHeader(Shift? shiftInfo, String id) {
    return shiftInfo == null
        ? WidgetUtil.createPrivateShiftCard(id)
        : WidgetUtil.createShiftCard(shiftInfo);
  }

  Widget buildchild(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    const double graphAreaHeight = 100;
    Widget timeAndRate = SizedBox(
      width: screenSize.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [createPlayTime(), createDangerRate()],
      ),
    );
    if (_detail.myResult.weapons.isEmpty) {
      // Incorrect job data
      return Column(
        children: [
          timeAndRate,
          SizedBox(
            height: screenSize.height - (80 + 10 + 50 + 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createNoData(),
              ],
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        timeAndRate,
        createJobInfo(screenSize.width * 0.95),
        createWaves(screenSize.width * 0.9),
        createPlayers(screenSize.width * 0.9, _isHideName),
        GestureDetector(
          onTap: () {
            _update(!_isHideName);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child:
                  Icon(_isHideName ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenSize.width * 0.3,
                  height: graphAreaHeight,
                  child: createPieGraph(1),
                ),
                SizedBox(
                  width: screenSize.width * 0.3,
                  height: graphAreaHeight,
                  child: createPieGraph(2),
                ),
                SizedBox(
                  width: screenSize.width * 0.3,
                  height: graphAreaHeight,
                  child: createPieGraph(3),
                ),
              ],
            )),
        SizedBox(
          width: screenSize.width * 0.9,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: createKillGraph()),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget createPlayTime() {
    final DateTime s = DateTime.parse(_detail.playedTime).toLocal();
    String start = DateFormat('yyyy-MM-dd HH:mm').format(s);
    return Text(start, style: const TextStyle(fontSize: 14));
  }

  Widget createDangerRate() {
    var rate = (_detail.dangerRate * 1000).round() / 10;
    String rateStr = rate > 0.0 ? '$rate%' : '???%';
    return Text('${L10n.of(context)!.dangerRate} : $rateStr',
        style: const TextStyle(fontSize: 14));
  }

  Widget createNoData() {
    return const Text('No Data.', style: TextStyle(fontSize: 14));
  }

  Widget createJobInfo(double widgetWidth) {
    double cardWidth = widgetWidth * 0.5;
    double height = 80;
    Widget infoWidget;
    if (CommonUtil.isRuleTeamContest(_detail.rule)) {
      infoWidget = _createInfo(widgetWidth);
    } else if (_detail.afterGrade != null) {
      infoWidget = _createInfo(widgetWidth);
    } else {
      infoWidget = Center(child: SelectableText(_detail.scenarioCode ?? '-'));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: cardWidth,
          height: height,
          child: Card(
            child: infoWidget,
          ),
        ),
        SizedBox(
          width: cardWidth,
          height: height,
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(
                  left: cardWidth * 0.1, right: cardWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetUtil.createText(L10n.of(context)!.grizzcoPoint, 14),
                      WidgetUtil.createText(
                          _detail.jobPoint == null
                              ? '-'
                              : '${_detail.jobPoint}',
                          18),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetUtil.createText(
                          _detail.jobScore == null
                              ? '-'
                              : '${_detail.jobScore}p',
                          14),
                      WidgetUtil.createText('x', 14),
                      WidgetUtil.createText(
                          _detail.jobRate == null ? '-' : '${_detail.jobRate}',
                          14),
                      WidgetUtil.createText('+', 14),
                      WidgetUtil.createText(
                          _detail.jobBonus == null
                              ? '-'
                              : '${_detail.jobBonus}p',
                          14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createInfo(double widgetWidth) {
    double cardWidth = widgetWidth * 0.5;
    double width = 20;
    String grade = _detail.afterGrade != null
        ? Common.getGrade(context, _detail.afterGrade!.id)
        : ' ';
    int gikura = 0;
    for (var wave in _detail.waveResults) {
      gikura += wave.teamDeliverCount ?? 0;
    }
    int ikura = _detail.myResult.deliverCount;
    for (var player in _detail.memberResults) {
      ikura += player.deliverCount;
    }
    return Padding(
      padding: EdgeInsets.only(left: cardWidth * 0.07, right: cardWidth * 0.07),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(grade, overflow: TextOverflow.ellipsis),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('${_detail.afterGradePoint ?? ' '}'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  materialImage.Image.asset(
                    Common.getImageGikura(),
                    scale: 4.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('x$gikura'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    materialImage.Image.asset(
                      Common.getImageIkura(),
                      scale: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('x$ikura'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: cardWidth * 0.8 * 0.33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    materialImage.Image.asset(Common.getImageScaleBronze(), width: width),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: WidgetUtil.createText(
                          _detail.scale == null
                              ? '-'
                              : 'x${_detail.scale!.bronze}',
                          12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: cardWidth * 0.8 * 0.33,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      materialImage.Image.asset(Common.getImageScaleSilver(), width: width),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: WidgetUtil.createText(
                            _detail.scale == null
                                ? '-'
                                : 'x${_detail.scale!.silver}',
                            12),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth * 0.8 * 0.33,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      materialImage.Image.asset(Common.getImageScaleGold(), width: width),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: WidgetUtil.createText(
                            _detail.scale == null
                                ? '-'
                                : 'x${_detail.scale!.gold}',
                            12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createPieGraph(int type) {
    List<PieChartSectionData> sections;
    String uri;
    double sc;
    switch (type) {
      case 1:
        sections = createGikuraSections();
        uri = Common.getImageGikura();
        sc = 3.5;
        break;
      case 2:
        sections = createIkuraSections();
        uri = Common.getImageIkura();
        sc = 6.0;
        break;
      case 3:
        sections = createOomonoSections();
        uri = Common.getSakelienGolden();
        sc = 14.0;
        break;
      default:
        Log.s(Exception('type $type is not allowd.'));
        throw Exception();
    }

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
                borderData: FlBorderData(show: true),
                startDegreeOffset: 270,
                sectionsSpace: 2,
                centerSpaceRadius: 15,
                sections: sections),
          ),
          Center(
            child: materialImage.Image.asset(uri, scale: sc),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> createGikuraSections() {
    var tStyle = const TextStyle(fontSize: 10, color: Colors.white);
    const double radius = 30;
    int n;
    int len = _detail.memberResults.length + 1;
    return List.generate(len, (index) {
      switch (index) {
        case 0:
          n = getGikura(_detail.myResult);
          return PieChartSectionData(
              color: Common.colorList[0],
              radius: radius,
              value: n.toDouble(),
              title: n.toString(),
              titleStyle: tStyle);
        default:
          n = getGikura(_detail.memberResults[index - 1]);
          return PieChartSectionData(
              color: Common.colorList[index],
              radius: radius,
              value: n.toDouble(),
              title: n.toString(),
              titleStyle: tStyle);
      }
    });
  }

  int getGikura(PlayerResult p) {
    return p.goldenDeliverCount;
  }

  List<PieChartSectionData> createIkuraSections() {
    var tStyle = const TextStyle(fontSize: 10, color: Colors.white);
    const double radius = 30;
    int n;
    int len = _detail.memberResults.length + 1;
    return List.generate(len, (index) {
      switch (index) {
        case 0:
          n = getIkura(_detail.myResult);
          return PieChartSectionData(
              color: Common.colorList[0],
              radius: radius,
              value: n.toDouble(),
              title: n.toString(),
              titleStyle: tStyle);
        default:
          n = getIkura(_detail.memberResults[index - 1]);
          return PieChartSectionData(
              color: Common.colorList[index],
              radius: radius,
              value: n.toDouble(),
              title: n.toString(),
              titleStyle: tStyle);
      }
    });
  }

  int getIkura(PlayerResult p) {
    return p.deliverCount;
  }

  List<PieChartSectionData> createOomonoSections() {
    var tStyle = const TextStyle(fontSize: 10, color: Colors.white);
    const double radius = 30;
    int n;
    int len = _detail.memberResults.length;

    return List.generate(len + 2, (index) {
      if (index == 0) {
        n = _detail.myResult.defeatEnemyCount;
        return PieChartSectionData(
            color: Common.colorList[0],
            radius: radius,
            value: n.toDouble(),
            title: n.toString(),
            titleStyle: tStyle);
      } else if (1 <= index && index <= len) {
        n = _detail.memberResults[index - 1].defeatEnemyCount;
        return PieChartSectionData(
            color: Common.colorList[index],
            radius: radius,
            value: n.toDouble(),
            title: n.toString(),
            titleStyle: tStyle);
      } else {
        int nonDefeat = calcNonDefeatNum();
        int our = _detail.myResult.defeatEnemyCount;
        for (var v in _detail.memberResults) {
          our += v.defeatEnemyCount;
        }
        Log.i(nonDefeat);
        Log.i(our);
        if (our == 0 && nonDefeat == 0) {
          return PieChartSectionData(
              color: Colors.grey,
              radius: radius,
              value: 1,
              title: '0',
              titleStyle: tStyle);
        } else {
          return PieChartSectionData(
              color: Colors.grey,
              radius: radius,
              value: nonDefeat.toDouble(),
              title: nonDefeat.toString(),
              titleStyle: tStyle);
        }
      }
    });
  }

  int calcNonDefeatNum() {
    int nonDefeat = 0;
    List<Map<String, int>> l = getKills();
    Map<String, int> team = l[1];
    Map<String, int> pop = l.last;
    pop.forEach((key, value) {
      nonDefeat += (pop[key] ?? 0) - (team[key] ?? 0);
    });

    return nonDefeat;
  }

  Widget createWaves(double width) {
    List<Widget> list = [];
    int waveLength = _detail.waveResults.length;

    if (waveLength > 3 && _detail.bossResult == null) {
      // contest
      List<Widget> child = [];

      for (int i = 0, idx = 0; i < waveLength; i++, idx++) {
        child
            .add(WaveCard.createWaveCardForDefault(context, _detail, i, width));
        if (idx == 2) {
          list.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: child,
          ));
          child = [];
          idx = 0;
        }
      }
      return Column(
        children: list,
      );
    } else {
      for (int i = 0; i < waveLength; i++) {
        list.add(WaveCard.createWaveCardForDefault(context, _detail, i, width));
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      );
    }
  }

  Widget createWaveResult(int w, double width) {
    WaveResult wave = _detail.waveResults[w];
    List<String> sp = [];
    List<String> spSortedByPlayer = [
      _detail.myResult.specialWeapon!.image.url,
    ];

    for (var v in _detail.memberResults) {
      spSortedByPlayer.add(v.specialWeapon!.image.url);
    }

    for (var s in spSortedByPlayer) {
      for (int i = 0; i < wave.specialWeapons.length; i++) {
        if (s == wave.specialWeapons[i].image.url) {
          sp.add(wave.specialWeapons[i].image.url);
        }
      }
    }

    String waveText;
    Widget ikuraWidget;
    if (_detail.rule == 'REGULAR' || _detail.rule == 'BIG_RUN') {
      if (w < 3) {
        waveText = 'wave ${w + 1}';
        ikuraWidget = ikuraText2(wave.teamDeliverCount ?? -1,
            wave.goldenPopCount, wave.deliverNorm ?? -1);
      } else {
        waveText = 'Extra';
        String resultText = _detail.bossResult!.hasDefeatBoss ? 'Clear' : 'NG';
        Color c = _detail.bossResult!.hasDefeatBoss ? Colors.green : Colors.red;
        ikuraWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(resultText, style: TextStyle(color: c, fontSize: 18)),
          ],
        );
      }
    } else {
      waveText = 'wave ${w + 1}';
      ikuraWidget = ikuraText2(wave.teamDeliverCount ?? -1, wave.goldenPopCount,
          wave.deliverNorm ?? -1);
    }

    double widthRate = _detail.bossResult == null ? 0.3 : 0.27;
    double childWidthRate = widthRate - 0.0;
    double waveHeightPos = 32;
    if (wave.waterLevel == 2) {
      waveHeightPos = 17;
    }
    if (wave.waterLevel == 0) {
      waveHeightPos = 47;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: SizedBox(
        height: 110,
        width: width * widthRate,
        child: Card(
          child: Column(
            children: [
              SizedBox(
                width: width * childWidthRate,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      waveText,
                    ),
//                    createTideText(wave.waterLevel),
                  ],
                ),
              ),
              SizedBox(
                  width: width * childWidthRate,
                  height: 25,
                  child: Container(
                      alignment: Alignment.bottomCenter, child: ikuraWidget)),
              const Divider(
                thickness: 1,
                height: 1,
              ),
              SizedBox(
                width: width * childWidthRate,
                height: 55,
                child: Stack(
                  children: [
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
                    Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetUtil.createText(
                                    Common.getEventName(
                                        context, wave.eventWave),
                                    10)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 35, child: getSpecials(sp)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createTideText(int s) {
    return WidgetUtil.createText(Common.getTideName(context, s), 10);
  }

  Widget ikuraText2(int gikura, int gikurapop, int quota) {
    Color c = gikura >= quota ? Colors.green : Colors.red;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('$gikura', style: TextStyle(color: c, fontSize: 18)),
        Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text('($gikurapop)', style: const TextStyle(fontSize: 10))),
        Text('/$quota', style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget ikuraText(String s) {
    return Text(s,
        textAlign: TextAlign.center, style: const TextStyle(fontSize: 18));
  }

  Widget getSpecials(List<String>? sp) {
    List<Widget> list = [];
    if (sp != null && sp.isNotEmpty) {
      List<Widget> row = [];
      int count = 0;
      for (var s in sp) {
        row.add(WidgetUtil.createSpecialImage(s, 16, true));
        count++;
        if (count == 4) {
          list.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row,
          ));
          count = 0;
          row = [];
        }
      }
      if (row.isNotEmpty) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row,
        ));
      }
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: list);
  }

  Widget createPlayers(double width, bool isHide) {
    List<Widget> list = [];

    list.add(createPlayerResult(_detail.myResult, Common.colorList[0], width));
    int idx = 1;
    for (var v in _detail.memberResults) {
      list.add(createPlayerResult(v, Common.colorList[idx++], width,
          isHideName: isHide));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  Widget createPlayerResult(PlayerResult p, Color c, double wid,
      {bool isHideName = false}) {
    String name = isHideName ? '' : p.player.name;
    String sp = p.specialWeapon!.image.url;
    List<String> weapons = [];
    for (var v in p.weapons) {
      weapons.add(v.image.url);
    }
    List<Widget> weaponSpList = [];
    double unitWidth = min((MediaQuery.of(context).size.width) / 2.5 / 5, 32);
    switch (_detail.waveResults.length) {
      case 5:
        unitWidth = min((MediaQuery.of(context).size.width) / 2.5 / 6, 32);
        break;
      default:
        break;
    }
    for (var v in weapons) {
      weaponSpList.add(Padding(
          padding: const EdgeInsets.only(right: 2),
          child: WidgetUtil.createWeaponImage(v, unitWidth, true)));
    }
    String dead = p.rescuedCount.toString();
    String rescue = p.rescueCount.toString();
    String ikura = p.deliverCount.toString();
    String gikuraAs = p.goldenAssistCount.toString();
    String gikura = p.goldenDeliverCount.toString();
    String kill = p.defeatEnemyCount.toString();

    return SizedBox(
      width: wid,
      height: 70,
      child: Card(
        shape: RoundedRectangleBorder(side: BorderSide(color: c, width: 2)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 2),
              child: Row(children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(children: weaponSpList),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, right: 10),
                        child:
                            WidgetUtil.createSpecialImage(sp, unitWidth, true),
                      ),
                    ],
                  ),
                ),
                Card(
//                  color: Colors.black,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WidgetUtil.createText(
                          '${L10n.of(context)!.defeatEnemy}: x$kill', 10),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                              child: createDetailCard(1, gikura, gikuraAs)),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(1, 1, 5, 1),
                              child: createDetailCard(2, ikura)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                              child: createDetailCard(3, rescue)),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(1, 1, 5, 1),
                              child: createDetailCard(4, dead)),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 5),
              child: WidgetUtil.createText(name, 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget createDetailCard(int type, String num, [String? sub]) {
    String uri = '';
    double sc = 6.0;
    switch (type) {
      case 1:
        uri = Common.getImageGikura();
        break;
      case 2:
        uri = Common.getImageIkura();
        sc = 10.0;
        break;
      case 3:
        uri = Common.getImageRescue();
        break;
      case 4:
        uri = Common.getImageDead();
        break;
    }

    return SizedBox(
        width: 55,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  materialImage.Image.asset(
                    uri,
                    scale: sc,
                    // colorBlendMode: BlendMode.modulate,
                  )
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WidgetUtil.createText(' x$num', 10),
                    sub != null
                        ? WidgetUtil.createText('<$sub>', 8)
                        : Container(),
                  ],
                )
              ],
            )));
  }

  Widget getEmptyAxWidget(double value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide: meta.axisSide, space: 2, child: const Text(''));
  }

  Widget createKillGraph() {
    List<Map<String, int>> list = getKills();
    var screenSize = MediaQuery.of(context).size;

    if (list.last.isEmpty) {
      return Container();
    } else {
      return SizedBox(
        width: screenSize.width * 0.9,
        height: 20 + _detail.enemyResults.length * 20,
        child: RotatedBox(
          quarterTurns: 1,
          child: BarChart(
            BarChartData(
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: getBottomAxWidget)),
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: getLeftAxWidget)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: getEmptyAxWidget,
                          reservedSize: 15))),
              borderData: FlBorderData(
                border: const Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                ),
              ),
              gridData: FlGridData(show: true, drawVerticalLine: false),
              barTouchData: BarTouchData(enabled: false),
              alignment: BarChartAlignment.spaceBetween,
              groupsSpace: 5,
              barGroups: getData(list),
            ),
          ),
        ),
      );
    }
  }

  Widget getLeftAxWidget(double value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: RotatedBox(
            quarterTurns: -1,
            child: Text(
                value - value.toInt() == 0.0 ? value.toInt().toString() : '',
                style: const TextStyle(fontSize: 11))));
  }

  Widget getBottomAxWidget(double value, TitleMeta meta) {
    List<String> bossList = [];

    for (var element in _detail.enemyResults) {
      bossList.add(element.enemy.id);
    }

    int n = value.toInt();
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: RotatedBox(
            quarterTurns: -1,
            child: materialImage.Image.asset(
              Common.getOomono(bossList[n]),
              scale: 5,
            )));
  }

  List<BarChartGroupData> getData(List<Map<String, int>> list) {
    Map<String, int> myKills = list[0];
    Map<String, int> teamKills = list[1];
    Map<String, int> bossCounts = list.last;

    List<BarChartGroupData> l = [];

    int count = 0;
    myKills.forEach((key, value) {
      double total = (bossCounts[key] ?? 0).toDouble();
      double my = (myKills[key] ?? 0).toDouble();
      double team = (teamKills[key] ?? 0).toDouble();
      BarChartRodData data = BarChartRodData(
          toY: total,
          width: 12,
          borderRadius: const BorderRadius.all(Radius.zero),
          rodStackItems: [
            BarChartRodStackItem(0, my, Common.colorList[0]),
            BarChartRodStackItem(
                my, team, Common.colorList[Common.colorList.length - 2]),
            BarChartRodStackItem(team, total, Common.colorList.last),
          ]);

      l.add(
        BarChartGroupData(
          x: count++,
          barsSpace: 4,
          barRods: [data],
        ),
      );
    });

    return l;
  }

  List<Map<String, int>> getKills() {
    Map<String, int> my = {};
    Map<String, int> team = {};
    Map<String, int> pop = {};

    for (EnemyResult e in _detail.enemyResults) {
      my[e.enemy.id] = e.defeatCount;
      team[e.enemy.id] = e.teamDefeatCount;
      pop[e.enemy.id] = e.popCount;
    }

    return [my, team, pop];
  }
}
