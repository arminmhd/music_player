import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';

Future<void> initPlayerDependencies() async {
  sl.registerFactory(() => PlayerBloc());
}
