import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../application/app_data_instractor.dart';
import '../../../application/backup_interactor.dart';
import '../../../application/data_interactor.dart';
import '../../../domain/app_data/language.dart';
import '../../../util/log.dart';
import '../gateway/database/coop_detail_repository.dart';
import '../gateway/database/defeat_repository.dart';
import '../gateway/database/king_defeat_repository.dart';
import '../gateway/database/shift_repository.dart';
import '../gateway/file/app_data_config.dart';
import '../view/bottom_navigator.dart';
import '../view/screens/analyze_setting.dart';
import '../view/screens/profile.dart';
import '../view/screens/setting.dart';
import '../view/tab_navigation.dart';
import 'screens/shift_w.dart';

class SalmdroidApp extends StatefulWidget {
  const SalmdroidApp({Key? key}) : super(key: key);

  @override
  State<SalmdroidApp> createState() {
    return SalmdroidAppState();
  }
}

class SalmdroidAppState extends State<SalmdroidApp> {
  final AppDataConfig _appDataConfig = AppDataConfig();
  final CoopDetailRepository _coopDetailRepository = CoopDetailRepository();
  final DefeatRepository _defeatRepository = DefeatRepository();
  final ShiftRepository _shiftRepository = ShiftRepository();
  final KingDefeatRepository _kingDefeatRepository = KingDefeatRepository();

  late final AppDataInteractor _appDataInteractor;
  late final DataInteractor _dataInteractor;
  late final BackupInteractor _backupInteractor;

  final Map<String, Widget> _screenMap = {};

  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.profile: GlobalKey<NavigatorState>(),
    TabItem.data: GlobalKey<NavigatorState>(),
    TabItem.analyze: GlobalKey<NavigatorState>(),
    TabItem.setting: GlobalKey<NavigatorState>(),
  };

  TabItem _currentTab = TabItem.profile;
  int _selectedTab = 0;

  SalmdroidAppState() {
    _appDataInteractor = AppDataInteractor(appDataConfig: _appDataConfig);
    _dataInteractor = DataInteractor(
      shiftRepository: _shiftRepository,
      coopDetailRepository: _coopDetailRepository,
      defeatRepository: _defeatRepository,
      kingDefeatRepository: _kingDefeatRepository,
      appDataInteractor: _appDataInteractor,
    );
    _backupInteractor = BackupInteractor(
      appDataInteractor: _appDataInteractor,
      dataInteractor: _dataInteractor,
      shiftRepository: _shiftRepository,
      coopDetailRepository: _coopDetailRepository,
    );

    _screenMap['profile'] = Profile(
      appDataInteractor: _appDataInteractor,
      dataInteractor: _dataInteractor,
      backupInteractor: _backupInteractor,
    );
    _screenMap['data'] = ShiftW(
      appDataInteractor: _appDataInteractor,
      dataInteractor: _dataInteractor,
    );
    _screenMap['analyze'] = AnalyzeSetting(
      dataInteractor: _dataInteractor,
    );
    _screenMap['setting'] = Setting(
      appDataInteractor: _appDataInteractor,
      dataInteractor: _dataInteractor,
      backupInteractor: _backupInteractor,
    );
  }

  @override
  void initState() {
    super.initState();

    _appDataInteractor.addListener(_update);
    _appDataInteractor.init();
  }

  @override
  void dispose() {
    super.dispose();
    _appDataInteractor.removeListener(_update);
  }

  void _update() {
    Log.i('SalmdroidApp#_update()');
    String appName = _appDataInteractor.getAppName() ?? 'salmdroidNW';
    String appVersion = _appDataInteractor.getAppVersion() ?? '1.0.0';
    _dataInteractor.loadFutureSchedule(appName, appVersion);
    Log.i('buildversion: ${_appDataInteractor.getLastBuildVersion()}');
    Log.i('isFirstRun: ${_appDataInteractor.getIsFirstRun()}');
    _appDataInteractor.finishInitialize();
    setState(() {});
  }

  Locale _getLocale(Language lang) {
    switch (lang) {
      case Language.japanese:
        return const Locale('ja');
      case Language.english:
        return const Locale('en');
      case Language.zh:
        return const Locale('zh');
      case Language.zhtw:
        return const Locale('zh', 'TW');
      default:
        return const Locale('ja');
    }
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (_currentTab != TabItem.profile) {
        onSelect(0);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  void onSelect(int index) {
    Log.i('onSelect()');
    TabItem tabItem = TabItem.values[index];
    if (_currentTab == tabItem) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedTab = index;
        _currentTab = tabItem;
      });
    }
  }

  Widget _buildTabItem(TabItem tabItem) {
    String root = '/${tabItem.title}';
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigationKey: _navigatorKeys[tabItem]!,
        routerName: root,
        screens: _screenMap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Log.i('build');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      locale: _getLocale(_appDataInteractor.getLanguage()),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: WillPopScope(
          onWillPop: onWillPop,
          child: Stack(
            children: <Widget>[
              _buildTabItem(
                TabItem.profile,
              ),
              _buildTabItem(
                TabItem.data,
              ),
              _buildTabItem(
                TabItem.analyze,
              ),
              _buildTabItem(
                TabItem.setting,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab,
            selected: _selectedTab,
            onSelect: onSelect),
      ),
    );
  }
}
