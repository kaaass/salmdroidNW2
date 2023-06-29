import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../adapter/view/common_view/widget_util.dart';
import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/stat/rate.dart';
import '../../../util/log.dart';

class WeaponListWidget extends StatefulWidget {
  const WeaponListWidget(
      {Key? key,
      required this.weapon,
      required this.jobnum,
      required this.isNeedRate})
      : super(key: key);

  final Map<String, Rate> weapon;
  final int jobnum;
  final bool isNeedRate;

  @override
  State<StatefulWidget> createState() {
    return _WeaponListWidget();
  }
}

class _WeaponListWidget extends State<WeaponListWidget> {
  _WeaponListWidget();

  final double weaponSize = 30;
  late List<Rate> weapon;
  WidgetUtil common = WidgetUtil();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InnerWeaponListWidget innerWeaponListWidget = InnerWeaponListWidget(
      context: context,
      weapons: widget.weapon,
      isNeedRate: widget.isNeedRate,
      jobnum: widget.jobnum,
    );
    return Scaffold(
      appBar: AppBar(
        title: WidgetUtil.createText('Weapon List', 14),
        toolbarHeight: 45,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            innerWeaponListWidget.build(),
          ],
        ),
      ),
    );
  }
}

class InnerWeaponListWidget {
  final BuildContext context;
  final Map<String, Rate> weapons;
  final bool isNeedRate;
  final int jobnum;

  final double weaponSize = 30;
  late List<Rate> weapon;
  WidgetUtil common = WidgetUtil();

  InnerWeaponListWidget({
    required this.context,
    required this.weapons,
    required this.isNeedRate,
    required this.jobnum,
  });

  Widget build() {
    var screenSize = MediaQuery.of(context).size;
    Log.i(screenSize);

    weapon = [];

    weapons.forEach((key, value) {
      weapon.add(value);
    });

    Common.weaponMap.forEach((key, value) {
      if (!weapons.keys.contains(key)) {
        weapon.add(Rate(name: key, rate: 0, num: 0));
      }
    });

    double wid = screenSize.width * 0.17;
    double hei = 45;
    List<Widget> useList = [], notUseList = [];
    List<Rate> used = [];
    int usedCount = 0;
    for (var v in weapon) {
      if (v.num > 0) {
        usedCount++;
      }
      used.add(v);
    }
    used.sort(((a, b) {
      int compareResult = a.num.compareTo(b.num);
      if (compareResult == 0) {
        int anum = Common.weaponMap[a.name] ?? 0;
        int bnum = Common.weaponMap[b.name] ?? 0;
        return anum.compareTo(bnum);
      } else {
        return -1 * a.num.compareTo(b.num);
      }
    }));

    Border nonusedBorder = Border.all(color: Colors.red);
    Border generalBorder = Border.all(color: Colors.grey.shade700);
    for (var v in used) {
      Widget sizedbox = Container(
        decoration: BoxDecoration(
            color: Colors.black,
            border: v.num > 0 ? generalBorder : nonusedBorder),
        child: SizedBox(
          width: wid,
          height: hei,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetUtil.createWeaponImage(v.name, weaponSize),
              WidgetUtil.createText('${v.num > 0 ? v.num : ' '}', 10),
            ],
          ),
        ),
      );
      useList.add(sizedbox);
    }
    if (weapon.length <= Common.weaponMap.length) {
      // クマブキまだ出てない状態なので金はてなで代用する
      // 出ていれば↑のループで追加されるはず。
      notUseList.add(
        Card(
          child: SizedBox(
            width: wid,
            height: hei,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetUtil.createWeaponImage(Common.randomWeapon, weaponSize),
                ]),
          ),
        ),
      );
    }

    return SizedBox(
      width: screenSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Row(
                  mainAxisAlignment: isNeedRate
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.center,
                  children: [
                    isNeedRate
                        ? WidgetUtil.createText(
                            '${L10n.of(context)!.usedRate} : ${(usedCount / (Common.weaponMap.length + 1) * 100).toStringAsFixed(2)}%',
                            20)
                        : Container(),
                    WidgetUtil.createText(
                        '${L10n.of(context)!.jobNum} : $jobnum', 20),
                  ])),
          Center(child: Wrap(children: useList)),
        ],
      ),
    );
  }
}
