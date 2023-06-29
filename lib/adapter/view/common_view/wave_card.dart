import 'package:flutter/material.dart';

import '../../../adapter/view/common_view/widget_util.dart';
import '../../../application/common_utility.dart';
import '../../../domain/coop_history_detail/coop_history_detail.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/salmonrun_data/rule.dart';
import '../../../domain/stat/wave_info.dart';
import '../../../util/log.dart';

class WaveCard {
  static Widget ikuraText2(int gikura, int gikurapop, int quota) {
    Color c = gikura >= quota ? Colors.green : Colors.red;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('$gikura', style: TextStyle(color: c, fontSize: 18)),
        Text('/$quota', style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  static Widget getSpecials(List<String>? sp) {
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

  static Widget createWaveCardForContest(
      BuildContext context, WaveInfo info, int w, double width) {
    Log.i('info.sp: ${info.sp.length}');
    return _createWaveCard(
      context,
      w,
      width,
      null,
      Rule.teamContest.rawString,
      info.sp,
      info.maxEggs,
      info.maxAppearEggs,
      info.norm,
      info.tide,
      info.eventId,
    );
  }

  static Widget createWaveCardForDefault(
      BuildContext context, CoopHistoryDetail detail, int w, double width) {
    bool? isBossClear;
    if (detail.bossResult != null) {
      isBossClear = detail.bossResult!.hasDefeatBoss;
    }
    WaveResult wave = detail.waveResults[w];
    List<String> sp = [];
    List<String> spSortedByPlayer = [
      detail.myResult.specialWeapon!.image.url,
    ];
    for (var v in detail.memberResults) {
      spSortedByPlayer.add(v.specialWeapon!.image.url);
    }
    for (var s in spSortedByPlayer) {
      for (int i = 0; i < wave.specialWeapons.length; i++) {
        if (s == wave.specialWeapons[i].image.url) {
          sp.add(wave.specialWeapons[i].image.url);
        }
      }
    }

    return _createWaveCard(
      context,
      w,
      width,
      isBossClear,
      detail.rule,
      sp,
      wave.teamDeliverCount ?? -1,
      wave.goldenPopCount,
      wave.deliverNorm ?? -1,
      wave.waterLevel,
      wave.eventWave != null ? wave.eventWave!.id : 'NoEvent',
    );
  }

  static Widget _createWaveCard(
    BuildContext context,
    int w,
    double width,
    bool? isBossClear,
    String rule,
    List<String> sp,
    int delv,
    int pop,
    int norm,
    int tide,
    String eventId,
  ) {
    String waveText;
    Widget ikuraWidget;
    if (CommonUtil.isRuleRegular(rule) || CommonUtil.isRuleBigRun(rule)) {
      if (w < 3) {
        waveText = 'wave ${w + 1}';
        ikuraWidget = ikuraText2(delv, pop, norm);
      } else {
        waveText = 'Extra';
        String resultText = 'NG';
        Color c = Colors.red;
        if (isBossClear != null && isBossClear) {
          resultText = 'Clear';
          c = Colors.green;
        }
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
      ikuraWidget = ikuraText2(delv, pop, norm);
    }

    double widthRate = isBossClear == null ? 0.3 : 0.27;
    double childWidthRate = widthRate - 0.0;
    double waveHeightPos = 42;
    if (tide == 2) {
      waveHeightPos = 17;
    }
    if (tide == 0) {
      waveHeightPos = 67;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: SizedBox(
        height: 130,
        width: width * widthRate,
        child: Card(
          child: Column(
            children: [
              SizedBox(
                width: width * childWidthRate,
                height: 20,
                child: Center(child: WidgetUtil.createText(waveText, 14)),
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
                height: 75,
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
                              child: Image.asset(Common.getWave()),
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
                                    Common.getEventNameFromId(context, eventId),
                                    10)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 35, child: getSpecials(sp)),
                        SizedBox(
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Image.asset(Common.getImageGikura(),
                                      scale: 5.0),
                                ),
                                WidgetUtil.createText('x$pop', 12),
                              ],
                            )),
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

  static Widget createWaveCardShort(
      BuildContext context, double width, int w, int tide, String eventId) {
    const double cardHeight = 65;
    double waveHeightPos = 22.5;
    if (tide == 2) {
      waveHeightPos = 10;
    }
    if (tide == 0) {
      waveHeightPos = 35;
    }

    return SizedBox(
      height: cardHeight,
      width: width * 0.3,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              height: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetUtil.createText('wave ${w + 1}', 12),
                ],
              ),
            ),
            SizedBox(
              width: width,
              height: 40,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: waveHeightPos + 0.5,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Opacity(
                            opacity: 0.5,
                            child: Image.asset(Common.getWave()),
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
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WidgetUtil.createText(
                                  Common.getEventNameFromId(context, eventId),
                                  10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
