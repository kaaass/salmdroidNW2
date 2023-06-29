import 'package:flutter/material.dart';

import '../../../adapter/view/common_view/empty_app_bar.dart';
import '../../../adapter/view/common_view/widget_util.dart';
import '../../../application/backup_interactor.dart';
import '../../../domain/app_data/backup.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({
    super.key,
    required this.backupInteractor,
  });

  final BackupInteractor backupInteractor;

  @override
  State<DialogWidget> createState() {
    return _DialogWidget();
  }
}

class _DialogWidget extends State<DialogWidget> {
  @override
  void initState() {
    super.initState();
    widget.backupInteractor.addListener(_update);
  }

  @override
  void dispose() {
    super.dispose();
    widget.backupInteractor.removeListener(_update);
  }

  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double verticalPadding = screenSize.height * 0.2;
    double horizentalPadding = screenSize.width * 0.1;

    List<Widget> widgetList = [];
    BackupStatus status = widget.backupInteractor.getBackupStatus();
    switch (status.type) {
      case BackupType.check:
        break;
      case BackupType.backup:
        break;
      case BackupType.restore:
        break;
    }
    if (status.type == BackupType.restore) {
      int now = status.now;
      int shiftsNum = status.shiftsNum;
      int resultsNum = status.resultsNum;
      int all = shiftsNum + resultsNum;
      if (all == 0) {
        widgetList.add(const CircularProgressIndicator());
      } else {
        widgetList.add(Column(
          children: [
            SizedBox(
              width: screenSize.width * 0.7,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetUtil.createText('shifts :', 14),
                  WidgetUtil.createText('$shiftsNum', 14),
                ],
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.7,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetUtil.createText('results  :', 14),
                  WidgetUtil.createText('$resultsNum', 14),
                ],
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.7,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WidgetUtil.createText('$now', 14),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: LinearProgressIndicator(value: (now.toDouble() / all))),
            now == (shiftsNum + resultsNum)
                ? SizedBox(
                    width: screenSize.width * 0.7,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetUtil.createText('Completed.', 14),
                      ],
                    ),
                  )
                : Container()
          ],
        ));
      }
    } else {
      widgetList.add(const CircularProgressIndicator());
    }
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: horizentalPadding,
              right: horizentalPadding,
              top: verticalPadding,
              bottom: verticalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
