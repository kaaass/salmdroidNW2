import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/salmonrun_data/common.dart';
import '../../../domain/shift/shift.dart';
import '../../view/common_view/widget_util.dart';

class ShiftAppBar {
  const ShiftAppBar({required this.shift});
  final Shift? shift;

  AppBar build() {
    Widget title;
    if (shift == null) {
      title = _buildPrivate();
    } else {
      title = _buildRegularShift(shift!);
    }

    return AppBar(
      title: title,
      toolbarHeight: 45,
    );
  }

  Widget _buildPrivate() {
    return const Text('Private');
  }

  Widget _buildRegularShift(Shift s) {
    // weapon
    double weaponImageSize = 30;

    // schedule date
    final DateTime sd = DateTime.parse(s.start).toLocal();
    String start = DateFormat('yyyy-MM-dd HH:mm').format(sd);
    final DateTime ed = DateTime.parse(s.end).toLocal();
    String end = DateFormat('MM-dd HH:mm').format(ed);
    String str = '$start - $end';

    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Image.asset(
            //   Common.getImageStage(s.stageId),
            //   height: 45,
            // ),
            // Row(
            //   children: [
            //     WidgetUtil.createWeaponImage(
            //         s.weapons[0], weaponImageSize, true),
            //     WidgetUtil.createWeaponImage(
            //         s.weapons[1], weaponImageSize, true),
            //     WidgetUtil.createWeaponImage(
            //         s.weapons[2], weaponImageSize, true),
            //     WidgetUtil.createWeaponImage(
            //         s.weapons[3], weaponImageSize, true),
            //   ],
            // ),
          ],
        ),
        Text(
          str,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 7.0,
                  color: Colors.black)
            ],
          ),
        ),
      ],
    );
  }
}
