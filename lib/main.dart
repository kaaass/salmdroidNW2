import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'adapter/view/salmdroid_app.dart';
import 'domain/app_data/resolution.dart';
import 'util/log.dart';

void main() {
  Log.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Resolution.resolution,
      minTextAdapt: true,
      builder: (context, child) => const SalmdroidApp(),
    );
  }
}
