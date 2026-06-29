import 'package:get_it/get_it.dart';
import 'package:my_player/app/di/core_di.dart';
import 'package:my_player/app/navigation/di/bottom_nav_di.dart';
import 'package:my_player/features/library/di/library_di.dart';
import 'package:my_player/features/player/di/player_di.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await initCore();

  await initBottomNavDependencies();

  await initLibraryDependencies();

  await initPlayerDependencies();
}
