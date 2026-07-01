import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/core/platform/media/media_store_channel.dart';
import 'package:my_player/core/platform/notification/player_notification_channel.dart';
import 'package:my_player/core/repository/permission_repository.dart';
import 'package:my_player/core/service/audioplayer/player_service.dart';
import 'package:my_player/core/service/audioplayer/player_service.impl.dart';
import 'package:my_player/core/service/notification/player_notification_facade.dart';
import 'package:my_player/core/service/notification/player_notification_service.dart';
import 'package:my_player/core/service/permission_service.dart';
import 'package:my_player/core/usecase/request_audio_permission_use_case.dart';

Future<void> initCore() async {
  //channel
  sl.registerLazySingleton<MediaStoreChannel>(() => MediaStoreChannel());
  sl.registerLazySingleton<PlayerNotificationChannel>(
    () => const PlayerNotificationChannel(),
  );

  //service
  sl.registerLazySingleton<PermissionService>(() => PermissionServiceImpl());
  sl.registerLazySingleton<PlayerService>(() => PlayerServiceImpl());
  sl.registerLazySingleton<PlayerNotificationService>(
    () => PlayerNotificationService(sl()),
  );
  sl.registerLazySingleton(() => PlayerNotificationFacade(sl()));

  //repository
  sl.registerLazySingleton<PermissionRepository>(
    () => PermissionRepositoryImpl(sl()),
  );

  //use case
  sl.registerLazySingleton(() => RequestAudioPermissionUseCase(sl()));
}
