import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: AppIcons.home, label: "Home"),
        BottomNavigationBarItem(icon: AppIcons.library, label: "Library"),
        BottomNavigationBarItem(icon: AppIcons.search, label: "Search"),
        BottomNavigationBarItem(icon: AppIcons.settings, label: "Settings"),
      ],
    );
  }
}
