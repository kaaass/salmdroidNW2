import 'package:package_info_plus/package_info_plus.dart';

import 'language.dart';

class AppData {
  static final AppData _instance = AppData._();
  static const String inquiryUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSfFl98x3KUkrAbwx0oG66yOFegL4Xc2ADAKDMhhGI2rZ5YGlg/viewform';
  static const String faqUrl = 'https://aoi2blue.github.io/';
  static const String backupFileNamePrefix = 'salmdroid_backup_';
  static const String backupFileNameExt = '.zip';

  Language language = Language.japanese;
  bool isUploadToSalmonStats = false;
  String lastVersion = '';
  bool isFirstRun = true;
  bool isInitializing = true;
  bool isAd = true;
  bool isEstimatedKingSalmonids = false;

  PackageInfo? packageInfo;

  // ----- singleton
  AppData._();

  factory AppData() {
    return _instance;
  }
}
