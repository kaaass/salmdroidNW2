import 'dart:math';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../domain/app_data/app_data.dart';
import '../domain/app_data/i_app_data_config.dart';
import '../domain/app_data/language.dart';
import '../util/log.dart';

class AppDataInteractor extends ChangeNotifier {
  IAppDataConfig appDataConfig;

  AppDataInteractor({required this.appDataConfig});

  void requestUpdate() {
    notifyListeners();
  }

  String getInquiryUrl() {
    return AppData.inquiryUrl;
  }

  String getFaqUrl() {
    return AppData.faqUrl;
  }

  String getBackupFileNamePrefix() {
    return AppData.backupFileNamePrefix;
  }

  String getBackupFileNameExt() {
    return AppData.backupFileNameExt;
  }

  Language getLanguage() {
    return AppData().language;
  }

  bool getIsUploadToSalmonStats() {
    return AppData().isUploadToSalmonStats;
  }

  String? getAppName() {
    return null;

//    return AppData().packageInfo?.appName;
  }

  String? getAppVersion() {
    return null;

//    return AppData().packageInfo?.version;
  }

  String? getAppBuildVersion() {
    return null;

//    return AppData().packageInfo?.buildNumber;
  }

  String getLastBuildVersion() {
    return AppData().lastVersion;
  }

  bool getIsFirstRun() {
    return AppData().isFirstRun;
  }

  bool getIsInitialize() {
    return AppData().isInitializing;
  }

  bool getIsAd() {
    return AppData().isAd;
  }

  bool getIsEstimatedKingSalmonids() {
    return AppData().isEstimatedKingSalmonids;
  }

  void finishInitialize() {
    AppData().isInitializing = false;
  }

  Future<void> init() async {
    await loadAppInfo();
    await loadLanguage(false);
    await loadLastVersion();
    await loadIsFirstRun();
    await loadUploadStats();
    await loadIsAd();
    await loadIsEstimatedKingSalmonids();
    notifyListeners();
  }

  Future<void> loadAppInfo() async {
    AppData().packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> loadLanguage([bool isNeedNotify = true]) async {
    var readdata = await appDataConfig.loadLanguage();
    Language lang = Language.japanese;
    if (readdata == null) {
      await appDataConfig.saveLanguage(Language.japanese);
    } else {
      lang = readdata;
    }

    AppData().language = lang;
    if (isNeedNotify) {
      notifyListeners();
    }
  }

  Future<void> loadUploadStats() async {
    var readdata = await appDataConfig.loadUploadStats();
    bool isOn;
    if (readdata == null) {
      await appDataConfig.saveUploadStats(false);
      isOn = false;
    } else {
      isOn = readdata;
    }
    AppData().isUploadToSalmonStats = isOn;
  }

  Future<void> loadLastVersion() async {
    var last = await appDataConfig.loadLastVersion();
    int? num = int.tryParse(last ?? '');

    if (num != null) {
      AppData().lastVersion = num.toString();
    }
    await appDataConfig
        .saveLastVersion(AppData().packageInfo!.buildNumber.toString());
  }

  Future<void> loadIsFirstRun() async {
    var readdata = await appDataConfig.loadIsFirstRun();
    if (readdata != null) {
      if (AppData().lastVersion.compareTo(AppData().packageInfo!.buildNumber) <
          0) {
        AppData().isFirstRun = true;
      } else {
        AppData().isFirstRun = false;
      }
    } else {
      AppData().isFirstRun = true;
    }
    Log.i(
        'sp:lastVersion: ${AppData().lastVersion} / app Version: ${AppData().packageInfo!.buildNumber} ');
    Log.i('isFirstRun: ${AppData().isFirstRun}');
    await appDataConfig.saveIsFirstRun(false);
  }

  Future<void> loadIsAd() async {
    var readdata = await appDataConfig.loadIsAd();
    bool isOn;
    if (readdata == null) {
      await appDataConfig.saveIsAd(true);
      isOn = true;
    } else {
      isOn = readdata;
    }
    AppData().isAd = isOn;
  }

  Future<void> loadIsEstimatedKingSalmonids() async {
    var readdata = await appDataConfig.loadIsEstimatedKingSalmonids();
    bool isOn;
    if (readdata == null) {
      await appDataConfig.saveIsEstimatedKingSalmonids(false);
      isOn = false;
    } else {
      isOn = readdata;
    }
    AppData().isEstimatedKingSalmonids = isOn;
  }

  Future<void> saveLanguage(Language newValue) async {
    appDataConfig.saveLanguage(newValue);
    AppData().language = newValue;
    notifyListeners();
  }

  Future<void> saveUploadStats(bool newValue) async {
    appDataConfig.saveUploadStats(newValue);
    AppData().isUploadToSalmonStats = newValue;
  }

  Future<void> saveAd(bool newValue) async {
    appDataConfig.saveIsAd(newValue);
    AppData().isAd = newValue;
  }

  Future<void> saveEstimatedKingSalmonids(bool newValue) async {
    appDataConfig.saveIsEstimatedKingSalmonids(newValue);
    AppData().isEstimatedKingSalmonids = newValue;
  }

  String getConvertedBuildVersion() {
    String? buildVersion = getAppBuildVersion();
    Log.i('convertBuildVersion: $buildVersion');
    if (buildVersion == null || buildVersion.isEmpty) {
      return '';
    }

    // 12345678 => 12.34.56 (78)
    int num = int.parse(buildVersion);
    int major = (num / pow(100, 3)).floor();
    num -= (major * pow(100, 3)).floor();
    int minor = (num / pow(100, 2)).floor();
    num -= (minor * pow(100, 2)).floor();
    int patch = (num / pow(100, 1)).floor();
    num -= (patch * pow(100, 1)).floor();
    int test = (num % 100).floor();

    String converted = '$major.$minor.$patch  ($test)';
    Log.i('converted: $converted');
    return converted;
  }
}
