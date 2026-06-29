import 'package:get_it/get_it.dart';
import 'package:my_player/app/di/core_di.dart';
import 'package:my_player/features/library/di/library_di.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await initCore();

  await initLibraryDependencies();
}
