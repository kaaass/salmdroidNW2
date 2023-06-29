import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../adapter/view/common_view/widget_util.dart';
import '../../../adapter/view/screens/analyze.dart';
import '../../../application/data_interactor.dart';
import '../../../application/stage_stat_instractor.dart';
import '../../../application/stat_insteractor.dart';

class AnalyzeSetting extends StatefulWidget {
  const AnalyzeSetting({super.key, required this.dataInteractor});

  final DataInteractor dataInteractor;

  @override
  State<StatefulWidget> createState() {
    return _Analyze();
  }
}

class _Analyze extends State<AnalyzeSetting> {
  final StatDetailInstractor stageStatInstractor = StatDetailInstractor();
  final StatInteractor statInteractor = StatInteractor();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: WidgetUtil.createText('Analyze', 14),
        toolbarHeight: 45,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetUtil.createText(L10n.of(context)!.calcOfTarget, 20),
                  WidgetUtil.createText('- ${L10n.of(context)!.regular}', 20),
                  WidgetUtil.createText('- ${L10n.of(context)!.bigRun}', 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Analyze(
                        dataInteractor: widget.dataInteractor,
                      ),
                    ),
                  );
                },
                child: Text(L10n.of(context)!.analyzeStart),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
