import '../../../domain/app_data/i_app_data_config.dart';
import '../../../domain/app_data/language.dart';

class AppDataConfig extends IAppDataConfig {
  static const String _keyLanguage = 'language';
  static const String _keyUploadStats = 'isUploadToSalmonStats';
  static const String _keyLastVersion = 'lastVersion';
  static const String _keyIsFirstRun = 'isFirstRun';
  static const String _keyIsAd = 'isAd';
  static const String _keyIsEstimatedKingSalmonids = 'isEstimatedKingSalmonids';

  @override
  Future<Language?> loadLanguage() async {
    return null;

    // var readdata = await _keychain.read(key: _keyLanguage);
    // if (readdata == null) {
    //   return null;
    // }
    // Language lang = Language.from(rawValue: int.parse(readdata));
    // return lang;
  }

  @override
  Future<bool?> loadUploadStats() async {
    return null;
  }

  @override
  Future<String?> loadLastVersion() async {
    return null;

    // var readdata = await _keychain.read(key: _keyLastVersion);
    // return readdata;
  }

  @override
  Future<bool?> loadIsFirstRun() async {
    return null;
  }

  @override
  Future<bool?> loadIsAd() async {
    return null;
  }

  @override
  Future<bool?> loadIsEstimatedKingSalmonids() async {
    return null;
  }

  @override
  Future<void> saveLanguage(Language newValue) async {
    // _keychain.write(key: _keyLanguage, value: newValue.rawValue.toString());
  }

  @override
  Future<void> saveUploadStats(bool newValue) async {}

  @override
  Future<void> saveLastVersion(String newValue) async {}

  @override
  Future<void> saveIsFirstRun(bool newValue) async {}

  @override
  Future<void> saveIsAd(bool newValue) async {}

  @override
  Future<void> saveIsEstimatedKingSalmonids(bool newValue) async {}
}
