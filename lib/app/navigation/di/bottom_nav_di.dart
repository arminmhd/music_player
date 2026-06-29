import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_bloc.dart';

Future initBottomNavDependencies() async {
  sl.registerFactory(() => BottomNavBloc());
}
