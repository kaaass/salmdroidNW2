import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../adapter/view/common_view/widget_util.dart';
import '../../../adapter/view/screens/summary.dart';
import '../../../application/app_data_instractor.dart';
import '../../../application/common_utility.dart';
import '../../../application/data_interactor.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/shift/shift.dart';
import '../../../util/log.dart';

class ShiftW extends StatefulWidget {
  const ShiftW({
    super.key,
    required this.appDataInteractor,
    required this.dataInteractor,
  });

  final AppDataInteractor appDataInteractor;
  final DataInteractor dataInteractor;

  @override
  State<ShiftW> createState() {
    return _Shift();
  }
}

class _Shift extends State<ShiftW> {
  _Shift();
  final Map<String, bool> _mapIsShowStage = {};
  int _gradeSliderValue = 0;
  int _eggSliderValue = 0;
  int _gradeMinimum = 0;
  int _eggMinimum = 0;

  @override
  void initState() {
    super.initState();
    widget.appDataInteractor.addListener(_update);
    widget.dataInteractor.addListener(_update);

    Common.stageList.forEach((key, value) {
      _mapIsShowStage[key] = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.appDataInteractor.removeListener(_update);
    widget.dataInteractor.removeListener(_update);
  }

  void _update() {
    Log.i('Shift#_update()');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Log.i('shift build');
    Widget barTitle = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(L10n.of(context)!.workedShiftList),
        GestureDetector(
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Summary(
                        appDataInteractor: widget.appDataInteractor,
                        dataInteractor: widget.dataInteractor,
                        targetShift: null,
                      );
                    },
                  ),
                ).then((_) {
                  _doWhenNavigatorePop();
                });
              },
              child: WidgetUtil.createText('Private', 16)),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: barTitle,
        toolbarHeight: 45,
      ),
      endDrawer: _buildDrawer(),
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Widget> l = snapshot.data as List<Widget>;
              return l.isNotEmpty
                  ? ListView.builder(
                      itemCount: l.length,
                      itemBuilder: (context, index) {
                        return l[index];
                      },
                    )
                  : Container();
            } else {
              return const CircularProgressIndicator();
            }
          },
          future: _createShiftList()),
    );
  }

  Widget _buildDrawer() {
    Log.i(
        '_buildDrawer: ${widget.appDataInteractor.getIsEstimatedKingSalmonids()}');
    final double drawerWidth = MediaQuery.of(context).size.width * 0.75;

    List<Widget> col = [];
    List<Widget> row = [];
    int idx = 0;
    _mapIsShowStage.forEach((key, value) {
      row.add(Row(
        children: [
          GestureDetector(
            onTap: () {
              _mapIsShowStage[key] = !(_mapIsShowStage[key] ?? true);
              setState(() {});
            },
            child: Image.asset(
              Common.getImageStage(key),
              width: drawerWidth * 0.4,
              color: (_mapIsShowStage[key] ?? false) ? null : Colors.white,
              colorBlendMode:
                  (_mapIsShowStage[key] ?? false) ? null : BlendMode.saturation,
            ),
          )
        ],
      ));
      idx++;
      if (idx > 0 && idx % 2 == 0) {
        col.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...row]));
        idx = 0;
        row = [];
      }
    });
    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: WidgetUtil.createTextBold(L10n.of(context)!.options, 18),
              textColor: Colors.blue,
            ),
            SwitchListTile(
              title: WidgetUtil.createTextNoEllipsis(
                  L10n.of(context)!.estimatedKing, 16),
              value: widget.appDataInteractor.getIsEstimatedKingSalmonids(),
              onChanged: (value) {
                widget.appDataInteractor.saveEstimatedKingSalmonids(value);
                setState(() {});
              },
            ),
            WidgetUtil.createDivider(),
            ListTile(
              title: WidgetUtil.createTextBold(L10n.of(context)!.filter, 18),
              textColor: Colors.blue,
            ),
            ListTile(
              title: WidgetUtil.createText(L10n.of(context)!.resetFilter, 16),
              onTap: () {
                _mapIsShowStage.forEach((key, value) {
                  _mapIsShowStage[key] = true;
                });
                _gradeSliderValue = 0;
                _gradeMinimum = 0;
                _eggSliderValue = 0;
                _eggMinimum = 0;
                setState(() {});
              },
            ),
            ExpansionTile(
              title: WidgetUtil.createText(L10n.of(context)!.stage, 16),
              childrenPadding: EdgeInsets.only(
                  left: drawerWidth * 0.05, right: drawerWidth * 0.05),
              children: col,
            ),
            ExpansionTile(
              title: WidgetUtil.createText(L10n.of(context)!.maxGrade, 16),
              childrenPadding: EdgeInsets.only(
                  left: drawerWidth * 0.05, right: drawerWidth * 0.05),
              children: [
                Center(
                    child: WidgetUtil.createText(
                        '${_gradeSliderValue == 1000 ? '999' : _gradeSliderValue}',
                        14)),
                SfSlider(
                  min: 0,
                  max: 1000,
                  stepSize: 50,
                  interval: 200,
                  showTicks: true,
                  showLabels: true,
                  value: _gradeSliderValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _gradeSliderValue = (value as double).round();
                    });
                  },
                  onChangeEnd: (value) {
                    setState(() {
                      int n = (value as double).round();
                      if (n == 1000) {
                        _gradeMinimum = 999;
                      } else {
                        _gradeMinimum = n;
                      }
                    });
                  },
                  labelFormatterCallback: (actualValue, formattedText) {
                    if (formattedText == '1000') {
                      return '999';
                    } else {
                      return formattedText;
                    }
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: WidgetUtil.createText(L10n.of(context)!.maxEggs, 16),
              childrenPadding: EdgeInsets.only(
                left: drawerWidth * 0.05,
                right: drawerWidth * 0.05,
              ),
              children: [
                Center(child: WidgetUtil.createText('$_eggSliderValue', 14)),
                SfSlider(
                  min: 0,
                  max: 200,
                  stepSize: 50,
                  interval: 50,
                  showTicks: true,
                  showLabels: true,
                  value: _eggSliderValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _eggSliderValue = (value as double).round();
                    });
                  },
                  onChangeEnd: (value) {
                    setState(() {
                      _eggMinimum = (value as double).round();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _doWhenNavigatorePop() async {
    Log.i('_doWhenNavigatorePop');
    setState(() {});
  }

  Future<List<Widget>> _createShiftList() async {
    await widget.dataInteractor.waitTableCreated();
    var locals = await widget.dataInteractor.loadAllShifts();
    var futures = await widget.dataInteractor.getFutureSchedule();
    Log.i('shifts: ${locals.length}, futures:${futures.length}');
    List<Widget> listview = [];

    if (futures.isNotEmpty) {
      // check future and local saved shift.
      // 'start' is duplicated when contenst, check repeat
      for (Shift shift in futures) {
        bool isNeedAdd = true;
        for (Shift local in locals) {
          if (local.end.compareTo(shift.start) < 0) {
            break;
          }
          if (local.start.compareTo(shift.start) == 0 &&
              local.end.compareTo(shift.end) == 0) {
            isNeedAdd = false;
          }
        }

        if (isNeedAdd) {
          if (_mapIsShowStage[shift.stageId] ?? true) {
            listview.add(createShiftCard(shift, true));
          }
        }
      }
    }
    for (Shift shift in locals) {
      if (_mapIsShowStage[shift.stageId] ?? true) {
        // _gradeMinimumが0ならすべて、0でないならでんせつのみ
        if (_gradeMinimum == 0 ||
            (shift.maxGradeId == Common.getEggVPGrade() &&
                _gradeMinimum <= shift.maxGradePoint)) {
          if (_eggMinimum <= shift.maxEggs) {
            listview.add(createShiftCard(shift, false));
          }
        }
      }
    }
    return listview;
  }

  Widget createShiftCard(Shift m, bool isFuture) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!isFuture) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Summary(
                  appDataInteractor: widget.appDataInteractor,
                  dataInteractor: widget.dataInteractor,
                  targetShift: m,
                );
              },
            ),
          ).then((_) {
            _doWhenNavigatorePop();
          });
        }
      },
      child: _createShiftCard(m, isFuture),
    );
  }

  Widget _createShiftCard(Shift m, bool isFuture) {
    final DateTime s = DateTime.parse(m.start).toLocal();
    String start = DateFormat('yyyy-MM-dd HH:mm').format(s);
    final DateTime e = DateTime.parse(m.end).toLocal();
    String end = DateFormat('MM-dd HH:mm').format(e);
    var screenSize = MediaQuery.of(context).size;
    double unitWidth = screenSize.width * 0.33;

    final TextStyle timeStyle = TextStyle(
        color: isFuture ? Colors.yellow : Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        shadows: const <Shadow>[
          Shadow(offset: Offset(2.0, 2.0), blurRadius: 7.0, color: Colors.black)
        ]);

    List<Widget> weaponList = [];
    double imageHeight = 65;
    for (var w in m.weapons) {
      weaponList.add(WidgetUtil.createWeaponImage(w, unitWidth * 0.25, true));
    }

    Widget detailWidget;
    if (!isFuture) {
      detailWidget = _createDetailWidget(m);
    } else {
      detailWidget = SizedBox(
        width: unitWidth,
      );
    }

    Color? kingColor = isFuture ? Colors.white : null;
    bool isEstimated = false;
    if (isFuture && widget.appDataInteractor.getIsEstimatedKingSalmonids()) {
      isEstimated = true;
    }
    if (!isFuture && m.kingSalmonids.isNotEmpty) {
      isEstimated = true;
    }
    Widget kingSalmonidsWidget = isEstimated
        ? Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              width: unitWidth * 0.25,
              child: Image.asset(Common.getOkashira(m.kingSalmonids),
                  color: kingColor),
            ),
          )
        : Container();

    return SizedBox(
      height: imageHeight,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: unitWidth,
                child: Image.asset(
                  Common.getImageStage(m.stageId),
                  height: imageHeight,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                width: unitWidth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: weaponList,
                  ),
                ),
              ),
              detailWidget,
            ],
          ),
          WidgetUtil.createSubDivider(),
          SizedBox(
            width: unitWidth,
            height: imageHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                kingSalmonidsWidget,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$start - $end', style: timeStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDetailWidget(Shift m) {
    var screenSize = MediaQuery.of(context).size;
    final double unitWidth = screenSize.width * 0.33;
    const double stringSize = 16;
    final Color barColor;
    if (m.maxGradePoint == 999) {
      barColor = Colors.yellow;
    } else if (m.maxGradePoint >= 600) {
      barColor = Colors.grey.shade400;
    } else if (m.maxGradePoint >= 400) {
      barColor = const Color(0xf9c26200);
    } else {
      barColor = Colors.grey.shade800;
    }
    Widget grade;
    if (CommonUtil.isRuleTeamContest(m.rule)) {
      grade = Container();
    } else {
      if (m.maxGradeId == Common.getEggVPGrade()) {
        grade = WidgetUtil.createText('${m.maxGradePoint}', stringSize);
      } else {
        grade = WidgetUtil.createText(
            Common.getGrade(context, m.maxGradeId), stringSize * 0.8);
      }
    }
    return SizedBox(
      width: unitWidth,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2, right: 5),
                  child: Image.asset(
                    Common.getImageGikura(),
                    scale: 5.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: WidgetUtil.createText('${m.maxEggs}', stringSize),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: WidgetUtil.createText('${m.played}', stringSize),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: WidgetUtil.createText(
                      L10n.of(context)!.works, stringSize * 0.8),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: grade,
                ),
              ],
            ),
            Divider(
              color: barColor,
              thickness: 4,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
