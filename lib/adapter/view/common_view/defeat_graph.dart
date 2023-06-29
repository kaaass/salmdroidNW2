import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/salmonrun_data/common.dart';
import '../../view/common_view/widget_util.dart';

class DefeatGraph {
  static Widget createDefeatChart(BuildContext context, Map<String, int> defs,
      double rate, Widget Function(double, TitleMeta)? f) {
    List<BarChartGroupData> datalist = [];
    int count = 0;
    int maxVal = 0;
    defs.forEach(
      (key, v) {
        maxVal = max(maxVal, v);
        datalist.add(
          BarChartGroupData(
              x: count++,
              barsSpace: 0,
              showingTooltipIndicators: [
                0
              ],
              barRods: [
                BarChartRodData(
                    toY: v.toDouble(),
                    width: 30,
                    borderRadius: const BorderRadius.all(Radius.zero),
                    rodStackItems: [
                      BarChartRodStackItem(
                          0, v.toDouble(), WidgetUtil.colorList[0]),
                    ]),
              ]),
        );
      },
    );

    double maxY = 10 * rate;
    if (maxVal < 10 * rate) {
      maxY = 10 * rate;
    } else if (maxVal < 100 * rate) {
      maxY = 100 * rate;
    } else if (maxVal < 300 * rate) {
      maxY = 300 * rate;
    } else if (maxVal < 600 * rate) {
      maxY = 600 * rate;
    } else if (maxVal < 1000 * rate) {
      maxY = 1000 * rate;
    } else {
      int tmp = maxVal % 10000;
      maxY = (maxVal - tmp) + 10000;
    }

    return Column(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.9,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: f)),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false))),
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
              borderData: FlBorderData(show: false),
              gridData: FlGridData(drawVerticalLine: false),
              maxY: maxY,
              groupsSpace: 1,
              barGroups: datalist,
            ),
          ),
        ),
      ],
    );
  }

  static Widget getBottomAxWidget(double value, TitleMeta meta) {
    List<String> bossList = [];

    Common.bossList.forEach((key, value) {
      bossList.add(key);
    });

    int n = value.toInt();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Image.asset(
        Common.getOomono(bossList[n]),
        scale: 5,
      ),
    );
  }

  static Widget getBottomAxWidgetForKing(double value, TitleMeta meta) {
    List<String> bossList = [];

    Common.okashiraList.forEach((key, value) {
      bossList.add(key);
    });

    int n = value.toInt();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Image.asset(
        Common.getOkashira(bossList[n]),
        scale: 5,
      ),
    );
  }
}
