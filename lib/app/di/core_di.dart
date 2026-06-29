import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/core/platform/media_store_channel.dart';
import 'package:my_player/core/repository/permission_repository.dart';
import 'package:my_player/core/service/permission_service.dart';
import 'package:my_player/core/usecase/request_audio_permission_use_case.dart';

Future<void> initCore() async {
  //channel
  sl.registerLazySingleton<MediaStoreChannel>(() => MediaStoreChannel());

  //service
  sl.registerLazySingleton<PermissionService>(() => PermissionServiceImpl());

  //repository
  sl.registerLazySingleton<PermissionRepository>(
    () => PermissionRepositoryImpl(sl()),
  );

  //use case
  sl.registerLazySingleton(() => RequestAudioPermissionUseCase(sl()));
}
