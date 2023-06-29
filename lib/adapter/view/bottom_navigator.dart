import 'package:flutter/material.dart';

enum TabItem {
  profile(
    title: 'profile',
    icon: Icons.emoji_emotions_outlined,
  ),
  data(
    title: 'data',
    icon: Icons.insert_chart_outlined,
  ),
  analyze(
    title: 'analyze',
    icon: Icons.query_stats,
  ),
  setting(
    title: 'setting',
    icon: Icons.settings,
  );

  final String title;
  final IconData icon;

  const TabItem({
    required this.title,
    required this.icon,
  });
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentTab,
    required this.selected,
    required this.onSelect,
  });

  final TabItem currentTab;
  final ValueChanged<int> onSelect;

  final int selected;

  void _update(int index) {
    onSelect(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        bottomItem(
          context,
          TabItem.profile,
        ),
        bottomItem(
          context,
          TabItem.data,
        ),
        bottomItem(
          context,
          TabItem.analyze,
        ),
        bottomItem(
          context,
          TabItem.setting,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selected,
      selectedItemColor: Colors.blue,
      // unselectedItemColor: Colors.white24,
      // selectedFontSize: 20,
      // unselectedFontSize: 14,
      onTap: (index) {
        _update(index);
      },
    );
  }

  BottomNavigationBarItem bottomItem(BuildContext context, TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(tabItem.icon),
      label: tabItem.title,
    );
  }
}
