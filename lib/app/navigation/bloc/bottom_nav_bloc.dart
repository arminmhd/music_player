import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_event.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState.initial()) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  void _onChangeTab(ChangeTabEvent event, Emitter<BottomNavState> emit) {
    emit(state.copyWith(tab: event.tab));
  }
}
