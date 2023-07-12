import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/shift/shift.dart';

class WidgetUtil {
  static final colorList = [
    Colors.blue.shade600,
    Colors.orange.shade900,
    Colors.green.shade700,
    Colors.purple.shade700,
    Colors.teal.shade900,
    Colors.indigo.shade500,
    Colors.pink.shade600,
    Colors.indigo.shade500,
    Colors.grey,
  ];

  static Widget createShiftCard(Shift m) {
    final DateTime s = DateTime.parse(m.start).toLocal();
    String start = DateFormat('yyyy-MM-dd HH:mm').format(s);
    final DateTime e = DateTime.parse(m.end).toLocal();
    String end = DateFormat('MM-dd HH:mm').format(e);
    return _createCard(m.weapons, m.stageId, '$start - $end');
  }

  static Widget createPrivateShiftCard(String? st) {
    return _createCard([], st ?? Common.getBaseStageId(), 'Private');
  }

  static Widget _createCard(List<String> weapons, String stageId, String str) {
    List<Widget> weaponList = [];
    for (var w in weapons) {
//      weaponList.add(createWeaponImage(w, 35, true));
    }

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        border: Border(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 80,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 2, bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: weaponList,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      str,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 7.0,
                                color: Colors.black)
                          ]),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  static Widget createText(String txt, double size) {
    return Text(
      txt,
      style: TextStyle(fontSize: size),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget createTextBold(String txt, double size) {
    return Text(
      txt,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  static Widget createTextNoEllipsis(String txt, double size) {
    return Text(
      txt,
      style: TextStyle(fontSize: size),
    );
  }

  static Widget createWeaponImage(String w, double size,
      [bool isBackgroud = false]) {
    return isBackgroud
        ? Card(
            color: isBackgroud ? Colors.black : null,
            margin: const EdgeInsets.all(0),
            child: Container(),
          )
        : Container();
  }

  static Widget createSpecialImageFromId(String id, double size,
      [bool isBackgroud = false]) {
    return isBackgroud
        ? Card(
            color: Colors.black,
            margin: const EdgeInsets.all(0),
            child: Container(),
          )
        : Container();
  }

  static Widget createSpecialImage(String sp, double size,
      [bool isBackgroud = false]) {
    return isBackgroud
        ? Card(
            color: isBackgroud ? Colors.black : null,
            margin: const EdgeInsets.all(0),
            child: Container(),
          )
        : Container();
  }

  static Widget createDivider() {
    return const Divider(
      color: Colors.white,
      height: 1,
      thickness: 1,
    );
  }

  static Widget createBlueDivider() {
    return Divider(
      color: Common.colorList[0],
      height: 5,
      thickness: 5,
    );
  }

  static Widget createSubDivider() {
    return const Divider(
      color: Colors.grey,
      height: 1,
      thickness: 1,
    );
  }
}

class CirclePaint extends MyCustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height);
    canvas.drawCircle(center, radius, paint);
  }
}

abstract class MyCustomPainter extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
