import 'package:my_player/app/navigation/enum/app_tab.dart';

class BottomNavState {
  final AppTab tab;

  const BottomNavState({required this.tab});

  factory BottomNavState.initial() {
    return const BottomNavState(tab: AppTab.library);
  }

  BottomNavState copyWith({AppTab? tab}) {
    return BottomNavState(tab: tab ?? this.tab);
  }
}
