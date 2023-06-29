import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    required this.routerName,
    required this.navigationKey,
    required this.screens,
  });

  final String routerName;
  final GlobalKey<NavigatorState> navigationKey;
  final Map<String, Widget> screens;

  Map<String, Widget Function(BuildContext)> _routerBuilder(
          BuildContext context) =>
      {
        '/profile': (context) => screens['profile']!,
        '/data': (context) => screens['data']!,
        '/analyze': (context) => screens['analyze']!,
        '/setting': (context) => screens['setting']!,
      };

  @override
  Widget build(BuildContext context) {
    final routerBuilder = _routerBuilder(context);

    return Navigator(
      key: navigationKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return routerBuilder[routerName]!(context);
          },
        );
      },
    );
  }
}
