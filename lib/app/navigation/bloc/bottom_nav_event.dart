import 'package:my_player/app/navigation/enum/app_tab.dart';

abstract class BottomNavEvent {}

class ChangeTabEvent extends BottomNavEvent {
  final AppTab tab;

  ChangeTabEvent(this.tab);
}
