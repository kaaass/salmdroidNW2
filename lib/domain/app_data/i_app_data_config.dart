import 'language.dart';

abstract class IAppDataConfig {
  Future<void> saveLanguage(Language newValue);
  Future<Language?> loadLanguage();
  Future<void> saveUploadStats(bool newValue);
  Future<bool?> loadUploadStats();
  Future<void> saveLastVersion(String newValue);
  Future<String?> loadLastVersion();
  Future<void> saveIsFirstRun(bool newValue);
  Future<bool?> loadIsFirstRun();
  Future<void> saveIsAd(bool newValue);
  Future<bool?> loadIsAd();
  Future<void> saveIsEstimatedKingSalmonids(bool newValue);
  Future<bool?> loadIsEstimatedKingSalmonids();
}
