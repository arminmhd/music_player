import 'package:my_player/app/di/injection_container.dart';
import 'package:my_player/features/library/data/datasources/library_local_data_source.dart';
import 'package:my_player/features/library/data/datasources/library_local_data_source_impl.dart';
import 'package:my_player/features/library/data/library_repository_impl.dart';
import 'package:my_player/features/library/domain/library_repository.dart';
import 'package:my_player/features/library/domain/usecases/get_local_album_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_artist_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_folder_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_genre_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_song_use_case.dart';
import 'package:my_player/features/library/presentation/bloc/library_bloc.dart';

Future<void> initLibraryDependencies() async {
  //data source
  sl.registerLazySingleton<LibraryLocalDataSource>(
    () => LibraryLocalDataSourceImpl(sl()),
  );

  //Repository
  sl.registerLazySingleton<LibraryRepository>(
    () => LibraryRepositoryImpl(sl()),
  );

  //useCase
  sl.registerLazySingleton(() => GetLocalAlbumUseCase(sl()));
  sl.registerLazySingleton(() => GetLocalGenreUseCase(sl()));
  sl.registerLazySingleton(() => GetLocalFolderUseCase(sl()));
  sl.registerLazySingleton(() => GetLocalArtistUseCase(sl()));
  sl.registerLazySingleton(() => GetLocalSongUseCase(sl()));

  //bloc
  sl.registerFactory(
    () => LibraryBloc(
      getLocalSongUseCase: sl(),
      getAlbumsUseCase: sl(),
      getArtistsUseCase: sl(),
      getFoldersUseCase: sl(),
      getGenresUseCase: sl(),
      requestAudioPermissionUseCase: sl(),
    ),
  );
}
