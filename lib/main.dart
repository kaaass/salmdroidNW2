import 'package:flutter/material.dart';

import 'adapter/view/salmdroid_app.dart';
import 'util/log.dart';

void main() {
  Log.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SalmdroidApp();
  }
}
