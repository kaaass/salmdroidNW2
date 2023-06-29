import 'package:flutter/material.dart';

class CommonAppBar {
  final double _toolbarHeight = 60;

  AppBar build(Widget widget) {
    return AppBar(
        toolbarHeight: _toolbarHeight,
        title: Row(
          children: [widget],
        ));
  }
}
