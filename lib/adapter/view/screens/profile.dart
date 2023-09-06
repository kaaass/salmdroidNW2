import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../adapter/view/common_view/defeat_graph.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../application/app_data_instractor.dart';
import '../../../application/backup_interactor.dart';
import '../../../application/data_interactor.dart';
import '../../../domain/defeat/defeat.dart';
import '../../../domain/king_defeat/king_defeat.dart';
import '../../../domain/state/data_state.dart';
import '../../../util/converter/defeat_converter.dart';
import '../../../util/converter/king_defeat_converter.dart';
import '../../../util/log.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.appDataInteractor,
    required this.dataInteractor,
    required this.backupInteractor,
  });

  final AppDataInteractor appDataInteractor;
  final DataInteractor dataInteractor;
  final BackupInteractor backupInteractor;

  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  Defeat? _defeat;
  KingDefeat? _kingDefeat;
  late Future<void> _data;

  @override
  void initState() {
    super.initState();

    widget.appDataInteractor.addListener(_update);
    widget.dataInteractor.addListener(_updateByData);
    _data = _getDefeatInfo();
  }

  @override
  void dispose() {
    super.dispose();
    widget.appDataInteractor.removeListener(_update);
    widget.dataInteractor.removeListener(_updateByData);
  }

  void _update() {
    Log.i('Profile#_update()');
    setState(() {});
  }

  void _updateByData() {
    Log.i('Profile#_updateByDataInter()');
    DataState st = widget.dataInteractor.getDataState();
    _data = _getDefeatInfo();
    if (st.type == Type.finishGetResult) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10, child: Container()),
            _createDefeatInfo(),
            if (kDebugMode) _debugButton(),
          ],
        ),
      ),
    );
  }

  Future<void> _getDefeatInfo() async {
    Log.i('getDefeatInfo()');
    await widget.dataInteractor.waitTableCreated();
    _defeat = await widget.dataInteractor.loadDefeat();
    _kingDefeat = await widget.dataInteractor.loadKingDefeat();
    _calcDefeatIfNeed();
  }

  Future<void> _calcDefeatIfNeed() async {
    Log.i('_calcDefeatIfNeed()');
    while (widget.dataInteractor.isUpdating) {
      await Future.delayed(const Duration(seconds: 1));
    }
    Log.i(
        '_calcDefeatIfNeed() isUpdating: ${widget.dataInteractor.isUpdating}');
    int localNum = await widget.dataInteractor.getNumOfJobs();
    Log.i(
        '_calcDefeatIfNeed() defeatsnum: ${_defeat!.num} kingDefeatNum: ${_defeat!.num} / localNum: $localNum');

    if (localNum != _defeat!.num || localNum != _kingDefeat!.num) {
      // re-calc
      Log.i('_calcDefeatIfNeed() re-calc');
      await widget.dataInteractor.calcForAllData();
      Defeat d = await widget.dataInteractor.loadDefeat();
      KingDefeat k = await widget.dataInteractor.loadKingDefeat();
      setState(() {
        _defeat = d;
        _kingDefeat = k;
      });
    }
  }

  Widget _createDefeatInfo() {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (_defeat != null && _kingDefeat != null) {
          Map<String, int> defeatMap =
              DefeatConverter.getOnlySamonidsMap(_defeat!);
          Map<String, int> kingDefeatMap =
              KingDefeatConverter.getOnlySamonidsMap(_kingDefeat!);
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  WidgetUtil.createText(L10n.of(context)!.totalDefeats, 16),
                  WidgetUtil.createDivider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: WidgetUtil.createText(
                          '${L10n.of(context)!.countingData} : ${_defeat!.num}',
                          12),
                    ),
                  ),
                  SizedBox(height: 20, child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: WidgetUtil.createText(
                              L10n.of(context)!.salmonids, 14),
                        ),
                        WidgetUtil.createSubDivider(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20, child: Container()),
                  DefeatGraph.createDefeatChart(
                      context, defeatMap, 10, DefeatGraph.getBottomAxWidget),
                  SizedBox(height: 20, child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: WidgetUtil.createText(
                              L10n.of(context)!.kingSalmonids, 14),
                        ),
                        WidgetUtil.createSubDivider(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20, child: Container()),
                  DefeatGraph.createDefeatChart(context, kingDefeatMap, 1,
                      DefeatGraph.getBottomAxWidgetForKing),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _data,
    );
  }

  Widget _debugButton() {
    return Row(
      children: [
        ElevatedButton(
          child: const Text("1"),
          onPressed: () async {
            var version = widget.appDataInteractor.getAppVersion();
            while (version == null) {
              await Future.delayed(const Duration(seconds: 1));
              version = widget.appDataInteractor.getAppVersion();
            }
            var bversion = widget.appDataInteractor.getAppBuildVersion();
            while (bversion == null) {
              await Future.delayed(const Duration(seconds: 1));
              bversion = widget.appDataInteractor.getAppBuildVersion();
            }
            Log.i('-debug-----------------------');
            Log.i('app version: $version');
            Log.i('app buildversion: $bversion');
          },
        ),
        ElevatedButton(
          child: const Text("5"),
          onPressed: () async {
            await widget.dataInteractor.calcForAllData();
            Log.i('-debug-----------------------');
          },
        ),
        ElevatedButton(
          child: const Text("delAll"),
          onPressed: () {
            widget.dataInteractor.deleteAll();
          },
        ),
      ],
    );
  }
}
