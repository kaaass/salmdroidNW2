import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../adapter/view/common_view/widget_util.dart';
import '../../../domain/app_data/language.dart';
import '../../../domain/app_data/news_content.dart';
import '../../../util/log.dart';

class NewsDialog extends StatelessWidget {
  const NewsDialog({
    super.key,
    required this.language,
    required this.version,
  });
  final Language language;
  final String version;

  @override
  Widget build(BuildContext context) {
    Section section;
    switch (language) {
      case Language.japanese:
        section = NewsContent.ja;
        break;
      case Language.english:
        section = NewsContent.en;
        break;
      case Language.zh:
        section = NewsContent.zh;
        break;
      case Language.zhtw:
        section = NewsContent.zhtw;
        break;
      default:
        section = NewsContent.ja;
        break;
    }

    Log.i('_createNewsDialog: ${language.name}');

    List<Widget> newFuncColumns = [];
    List<Widget> bugFixColumns = [];
    double sectionSize = 20;
    double mainSize = 17;
    double subSize = 14;

    // new function
    if (section.newFunc.isNotEmpty) {
      newFuncColumns.add(WidgetUtil.createTextNoEllipsis(
          L10n.of(context)!.newFunction, sectionSize));
      newFuncColumns.add(WidgetUtil.createBlueDivider());
      newFuncColumns.add(const SizedBox(height: 10));
    }
    for (Item item in section.newFunc) {
      newFuncColumns.add(Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: WidgetUtil.createTextNoEllipsis(item.main, mainSize),
      ));
      newFuncColumns.add(WidgetUtil.createSubDivider());
      newFuncColumns.add(const SizedBox(height: 5));
      List<Widget> contSubCol = [];
      for (String s in item.sub) {
        contSubCol.add(Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: WidgetUtil.createTextNoEllipsis('- $s', subSize),
        ));
      }
      newFuncColumns.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: contSubCol));
      newFuncColumns.add(const SizedBox(height: 10));
    }

    // bug fix
    if (section.bugFix.isNotEmpty) {
      bugFixColumns.add(WidgetUtil.createTextNoEllipsis(
          L10n.of(context)!.bugFix, sectionSize));
      bugFixColumns.add(WidgetUtil.createBlueDivider());
      bugFixColumns.add(const SizedBox(height: 10));
    }
    for (Item item in section.bugFix) {
      bugFixColumns.add(Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: WidgetUtil.createTextNoEllipsis(item.main, mainSize),
      ));
      bugFixColumns.add(WidgetUtil.createSubDivider());
      bugFixColumns.add(const SizedBox(height: 5));
      List<Widget> contSubCol = [];
      for (String s in item.sub) {
        contSubCol.add(Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: WidgetUtil.createTextNoEllipsis('- $s', subSize),
        ));
      }
      bugFixColumns.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: contSubCol));
      bugFixColumns.add(const SizedBox(height: 10));
    }

    return AlertDialog(
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      title: Column(
        children: [
          WidgetUtil.createText(L10n.of(context)!.news, 20),
          WidgetUtil.createDivider(),
          Align(
            alignment: Alignment.centerRight,
            child: WidgetUtil.createText('version $version', subSize),
          ),
        ],
      ),
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: newFuncColumns,
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bugFixColumns,
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: WidgetUtil.createText('OK', 14)),
      ],
    );
  }
}
