import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../adapter/view/app_bar/shift_app_bar.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../adapter/view/screens/detail.dart';
import '../../../adapter/view/screens/statistics.dart';
import '../../../application/app_data_instractor.dart';
import '../../../application/data_interactor.dart';
import '../../../application/stat_insteractor.dart';
import '../../../domain/coop_history_detail/coop_history_detail.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/shift/shift.dart';
import '../../../domain/state/data_state.dart';
import '../../../util/log.dart';

class Summary extends StatefulWidget {
  const Summary({
    super.key,
    required this.appDataInteractor,
    required this.dataInteractor,
    this.targetShift,
  });

  final AppDataInteractor appDataInteractor;
  final DataInteractor dataInteractor;
  final Shift? targetShift;

  @override
  State<StatefulWidget> createState() {
    return _Summary();
  }
}

class _Summary extends State<Summary> {
  List<CoopHistoryDetail> _details = [];
  Shift? _targetShift;
  List<Widget> _detailSummary = [];
  bool isTeam = false;
  List<String> _idList = [];
  bool isLoading = false;
  bool isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _targetShift = widget.targetShift;
    widget.appDataInteractor.addListener(_update);
    widget.dataInteractor.addListener(_updateByData);
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    widget.appDataInteractor.removeListener(_update);
    widget.dataInteractor.removeListener(_updateByData);
  }

  Future<void> loadData() async {
    isLoading = true;
    await widget.dataInteractor.waitTableCreated();
    if (_targetShift != null) {
      _details = await widget.dataInteractor.loadResultsByShift(
          _targetShift!.start, _targetShift!.end, _targetShift!.rule);
      getResults();
    } else {
      _details = await widget.dataInteractor.loadPrivateJobs();
      getResults();
    }
    setState(() {});
  }

  void _update() {
    Log.i('Summary#_update()');
    if (!isLoading) {
      loadData();
      setState(() {});
    }
  }

  void _updateByData() {
    Log.i('Summary#_updateByDataInter()');
    DataState st = widget.dataInteractor.getDataState();
    if (st.type == Type.finishGetResult) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Log.i('build(): target: ${_targetShift?.start}');
    return Scaffold(
      appBar: ShiftAppBar(shift: _targetShift).build(),
      body: _buildChild(),
      persistentFooterButtons: _footer(),
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }

  List<Widget> _footer() {
    var size = MediaQuery.of(context).size;

    List<Widget> rowChild;
    rowChild = _footerOfStats();
    return [
      SizedBox(
        height: size.height * 0.035,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowChild,
        ),
      )
    ];
  }

  List<Widget> _footerOfStats() {
    var size = MediaQuery.of(context).size;
    List<Widget> widgets = [];
    if (widget.targetShift == null) {
      widgets.add(SizedBox(width: size.width / 4, child: Container()));
    } else {
      widgets.add(
        OutlinedButton(
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
                  builder: (context) => Statistics(
                    dataInteractor: widget.dataInteractor,
                    statInteractor: StatInteractor(),
                    shiftDetail: _targetShift!,
                    details: _details,
                  ),
                ),
              );
            },
            child: WidgetUtil.createText(L10n.of(context)!.statistics, 12)),
      );
    }
    widgets.add(SizedBox(width: size.width / 4, child: Container()));
    widgets.add(
      Switch(
        value: isTeam,
        activeColor: Common.colorList.first,
        onChanged: (value) {
          isTeam = value;

          getResults();
        },
      ),
    );
    widgets.add(
      WidgetUtil.createText(
          isTeam ? L10n.of(context)!.team : L10n.of(context)!.individual, 12),
    );

    return widgets;
  }

  Widget _buildChild() {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _detailSummary.length,
            itemBuilder: (context, index) {
              return _detailSummary[index];
            },
          );
  }
  //--------------------------------------

  Future<void> getResults() async {
    Log.i('_detail.length: ${_details.length}');
    _detailSummary = [];
    _idList = [];
    for (var detail in _details) {
      _idList.add(detail.historyId);
    }
    for (var detail in _details) {
      _detailSummary.add(createResultCard(detail));
    }
    Log.i('detailSummary: ${_detailSummary.length}');
    isLoading = false;
    setState(() {});
  }

  Widget createResultCard(CoopHistoryDetail detail) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detail(
              appDataInteractor: widget.appDataInteractor,
              dataInteractor: widget.dataInteractor,
              shiftDetail: _targetShift,
              details: _details,
              idList: _idList,
              id: detail.historyId,
            ),
          ),
        );
      },
      child: createCard(detail),
    );
  }

  Widget createCard(CoopHistoryDetail job) {
    var screenSize = MediaQuery.of(context).size;
    var cardwid = screenSize.width * 0.29;
    var extrawid = screenSize.width * 0.1;
    var cardShortWid = screenSize.width * 0.18;
    final DateTime s = DateTime.parse(job.playedTime).toLocal();
    String playedtime = DateFormat('MM/dd HH:mm').format(s);
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      child: Column(children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                job.afterGrade == null
                    ? job.scenarioCode != null
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellow),
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                              width: screenSize.width * 0.05,
                              child: const Center(
                                child: Text('SC',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                          )
                        : SizedBox(width: screenSize.width * 0.05)
                    : Container(),
                job.afterGrade == null
                    ? SizedBox(
                        width: screenSize.width * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: getText(playedtime),
                        ))
                    : SizedBox(
                        width: screenSize.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: createGrade(job.afterGrade),
                        ),
                      ),
                job.afterGrade == null
                    ? Container()
                    : SizedBox(
                        width: screenSize.width * 0.1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: getText('${job.afterGradePoint}'),
                        ),
                      ),
                SizedBox(
                    width: screenSize.width * 0.15,
                    child: job.dangerRate > 0.0
                        ? getText('${(job.dangerRate * 1000).round() / 10}%')
                        : getText('???%')),
                Container(
                  width: screenSize.width * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image.asset(
                      //   Common.getImageGikura(),
                      //   scale: 5.0,
                      // ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 2, 0),
                          child: getText('x${getGoldenEgg(job)}')),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image.asset(
                      //   Common.getImageIkura(),
                      //   scale: 8.0,
                      // ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 2, 0),
                          child: getText('x${getEgg(job)}')),
                    ],
                  ),
                ),
                job.myResult.specialWeapon == null
                    ? Container(width: screenSize.width * 0.1)
                    : SizedBox(
                        width: screenSize.width * 0.1,
                        child: WidgetUtil.createSpecialImage(
                            job.myResult.specialWeapon!.image.url, 20, true)),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.blue.shade100,
          height: 0,
          thickness: 1,
          indent: 15.0,
          endIndent: 15.0,
        ),
        job.myResult.specialWeapon == null
            ? Container(child: getText('No Data.'))
            : job.rule == 'REGULAR' || job.rule == 'BIG_RUN'
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                          width: cardwid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCard(job, 0))),
                      SizedBox(
                          width: cardwid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCard(job, 1))),
                      SizedBox(
                          width: cardwid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCard(job, 2))),
                      SizedBox(
                          width: extrawid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: extraWaveCard(job))),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                          width: cardShortWid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCardForShort(job, 0))),
                      SizedBox(
                          width: cardShortWid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCardForShort(job, 1))),
                      SizedBox(
                          width: cardShortWid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCardForShort(job, 2))),
                      SizedBox(
                          width: cardShortWid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCardForShort(job, 3))),
                      SizedBox(
                          width: cardShortWid,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: waveCardForShort(job, 4))),
                    ],
                  ),
      ]),
    );
  }

  Widget createGrade(AfterGrade? grade) {
    if (grade == null) {
      // private job
      return Container();
    } else {
      return getText(Common.getGrade(context, grade.id));
    }
  }

  int getGoldenEgg(CoopHistoryDetail job) {
    int count = 0;
    if (isTeam) {
      for (var wave in job.waveResults) {
        count += wave.teamDeliverCount ?? 0;
      }
    } else {
      count = job.myResult.goldenDeliverCount;
    }

    return count;
  }

  int getEgg(CoopHistoryDetail job) {
    int count = job.myResult.deliverCount;
    if (isTeam) {
      for (var member in job.memberResults) {
        count += member.deliverCount;
      }
    }

    return count;
  }

  Widget waveCard(CoopHistoryDetail job, int wave) {
    if (job.waveResults.length < wave + 1) {
      return Container();
    }

    bool isClear = job.resultWave != wave + 1;
    String weaponid = job.myResult.weapons[wave].image.url;
    return Container(
      alignment: const Alignment(0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            createQuota(isClear, job.waveResults[wave].teamDeliverCount,
                job.waveResults[wave].deliverNorm),
            WidgetUtil.createWeaponImage(weaponid, 25),
          ]),
          createTideEvent(
              job.waveResults[wave].waterLevel, job.waveResults[wave].eventWave)
        ]),
      ),
    );
  }

  Widget extraWaveCard(CoopHistoryDetail job) {
    String resultText = '';
    Color c = Colors.white;

    if (job.bossResult != null) {
      resultText = job.bossResult!.hasDefeatBoss ? 'Clear' : 'NG';
      c = job.bossResult!.hasDefeatBoss ? Colors.white : Colors.red;
    }
    return job.bossResult == null
        ? Container()
        : Container(
            alignment: const Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: [
                job.bossResult != null
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: Container()
                        //  Image.asset(
                        //   Common.getOkashira(job.bossResult!.boss.id),
                        // ),
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(resultText, style: TextStyle(color: c, fontSize: 9)),
                  ],
                )
              ]),
            ),
          );
  }

  Widget waveCardForShort(CoopHistoryDetail job, int wave) {
    if (job.waveResults.length < wave + 1) {
      return Container();
    }

    bool isClear = job.resultWave != wave + 1;
    return Container(
      alignment: const Alignment(0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            createQuotaForShort(
                isClear, job.waveResults[wave].teamDeliverCount),
          ]),
          createTideEvent(
              job.waveResults[wave].waterLevel, job.waveResults[wave].eventWave)
        ]),
      ),
    );
  }

  Widget createQuota(bool isClear, var gikura, var quota) {
    if (isClear) {
      return getText("$gikura / $quota");
    } else {
      return Text("$gikura / $quota",
          style: const TextStyle(color: Colors.red));
    }
  }

  Widget createQuotaForShort(bool isClear, var gikura) {
    if (isClear) {
      return getText("$gikura");
    } else {
      return Text("$gikura", style: const TextStyle(color: Colors.red));
    }
  }

  Widget createTideEvent(int tide, EventWave? event) {
    String str = Common.getTideName(context, tide);
    String name = Common.getEventName(context, event);
    if (name != '-') {
      str += '/$name';
    }
    return Text(str,
        style: const TextStyle(fontSize: 9), overflow: TextOverflow.ellipsis);
  }

  Widget eventText(String s) {
    return Text((s == '-') ? '' : s, style: const TextStyle(fontSize: 9));
  }

  Widget getText(String s) {
    return Text(s, style: const TextStyle(), overflow: TextOverflow.ellipsis);
  }

  Widget createBar(bool b) {
    if (b) {
      return CustomPaint(size: const Size(100, 5), painter: RectPaint3());
    } else {
      return CustomPaint(size: const Size(100, 5), painter: RectPaint2());
    }
  }
}

class RectPaint3 extends MyCustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;
    canvas.drawLine(const Offset(0, 0), const Offset(100, 0), paint);
  }
}

class RectPaint2 extends MyCustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;
    canvas.drawLine(const Offset(0, 0), const Offset(100, 0), paint);
  }
}
