import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salmdroidnw2/util/string/king_salmonid_util.dart';
import 'package:salmdroidnw2/util/string/salmonid_util.dart';

import '../../view/common_view/widget_util.dart';

class DefeatGraph {
  static final double _textSize = 10.w;
  static BuildContext? _context;

  static Widget createDefeatChart(BuildContext context, Map<String, int> defs,
      double rate, Widget Function(double, TitleMeta)? f) {
    _context = context;
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
          height: 300,
          width: 20 + defs.keys.length * 30, //.of(context).size.width * 0.9,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 150,
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
                  tooltipMargin: 10,
                  rotateAngle: -90,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.toY.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontSize: 14.w,
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
    List<int> idList = SalmonidUtil.getAllIds();
    int n = value.toInt();
    String name = SalmonidUtil.getName(_context, idList[n]);

    return RotatedBox(
      quarterTurns: -1,
      child: SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: WidgetUtil.createText(name, 18.w),
          ),
        ),
      ),
    );
  }

  static Widget getBottomAxWidgetForKing(double value, TitleMeta meta) {
    List<int> idList = KingSalmonidUtil.getAllIds();
    int n = value.toInt();
    String name = KingSalmonidUtil.getName(_context, idList[n]);

    return RotatedBox(
      quarterTurns: -1,
      child: SideTitleWidget(
        axisSide: meta.axisSide,
        space: 2,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: WidgetUtil.createText(name, 18.w),
          ),
        ),
      ),
    );
  }
}
