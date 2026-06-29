import 'package:flutter/material.dart';
import 'package:my_player/features/library/presentation/pages/library_page.dart';

enum AppTab { home, library, search, settings }

const List<AppTab> appTabs = [
  AppTab.home,
  AppTab.library,
  AppTab.search,
  AppTab.settings,
];

List<Widget> get pages => const [
  Center(child: Text("Home")),
  LibraryPage(),
  Center(child: Text("Search")),
  Center(child: Text("Settings")),
];

int tabToIndex(AppTab tab) {
  return appTabs.indexOf(tab);
}
