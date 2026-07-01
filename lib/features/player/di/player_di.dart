import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/features/player/data/repository/player_repository_impl.dart';
import 'package:my_player/features/player/domain/repository/player_repository.dart';
import 'package:my_player/features/player/domain/usecase/initialize_player_use_case.dart';
import 'package:my_player/features/player/domain/usecase/load_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/pause_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/play_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/seek_song_use_case.dart';
import 'package:my_player/features/player/domain/usecase/toggle_shuffle_use_case.dart';
import 'package:my_player/features/player/presentation/bloc/player_bloc.dart';

Future<void> initPlayerDependencies() async {
  // repo
  sl.registerLazySingleton<PlayerRepository>(() => PlayerRepositoryImpl(sl()));

  //use case
  sl.registerLazySingleton(() => InitializePlayerUseCase(sl()));
  sl.registerLazySingleton(() => LoadSongUseCase(sl()));
  sl.registerLazySingleton(() => PlaySongUseCase(sl()));
  sl.registerLazySingleton(() => PauseSongUseCase(sl()));
  sl.registerLazySingleton(() => SeekSongUseCase(sl()));
  sl.registerLazySingleton(() => ToggleShuffleUseCase(sl()));

  //bloc
  sl.registerFactory(
    () => PlayerBloc(
      initializePlayer: sl(),
      loadSong: sl(),
      pauseSong: sl(),
      playSong: sl(),
      repository: sl(),
      seekSong: sl(),
      toggleShuffle: sl(),
    ),
  );
}
