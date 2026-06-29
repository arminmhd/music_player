import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/app/navigation/app_bottom_nav.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_bloc.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_event.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_state.dart';
import 'package:my_player/app/navigation/enum/app_tab.dart';
import 'package:my_player/features/library/presentation/pages/library_page.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        final index = tabToIndex(state.tab);

        return Scaffold(
          body: IndexedStack(index: index, children: pages),

          bottomNavigationBar: AppBottomNav(
            currentIndex: index,
            onTap: (i) {
              context.read<BottomNavBloc>().add(ChangeTabEvent(appTabs[i]));
            },
          ),
        );
      },
    );
  }

  List<Widget> get pages => const [
    Center(child: Text("Home")),
    LibraryPage(),
    Center(child: Text("Search")),
    Center(child: Text("Settings")),
  ];

  int tabToIndex(AppTab tab) {
    return appTabs.indexOf(tab);
  }
}
