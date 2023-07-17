import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/app_data/resolution.dart';

class Screen {
  static Future<void> init(BuildContext context) {
    return ScreenUtil.init(
      context,
      designSize: Resolution.resolution,
      minTextAdapt: true,
    );
  }
}