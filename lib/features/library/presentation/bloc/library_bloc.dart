import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/core/usecase/request_audio_permission_use_case.dart';
import 'package:my_player/features/library/domain/enum/library_status.dart';
import 'package:my_player/features/library/domain/enum/library_tab.dart';
import 'package:my_player/features/library/domain/usecases/get_local_album_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_artist_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_folder_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_genre_use_case.dart';
import 'package:my_player/features/library/domain/usecases/get_local_song_use_case.dart';
import 'package:my_player/features/library/presentation/bloc/library_event.dart';
import 'package:my_player/features/library/presentation/bloc/library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final GetLocalSongUseCase getLocalSongUseCase;
  final GetLocalAlbumUseCase getAlbumsUseCase;
  final GetLocalArtistUseCase getArtistsUseCase;
  final GetLocalFolderUseCase getFoldersUseCase;
  final GetLocalGenreUseCase getGenresUseCase;
  final RequestAudioPermissionUseCase requestAudioPermissionUseCase;

  LibraryBloc({
    required this.getLocalSongUseCase,
    required this.getAlbumsUseCase,
    required this.getArtistsUseCase,
    required this.getFoldersUseCase,
    required this.getGenresUseCase,
    required this.requestAudioPermissionUseCase,
  }) : super(LibraryState.initial()) {
    on<LoadLibraryEvent>(_onLoadLibrary);

    on<ChangeLibraryTabEvent>(_onChangeTab);

    on<LoadSongsEvent>(_onLoadSongs);
    on<LoadAlbumsEvent>(_onLoadAlbums);
    on<LoadArtistsEvent>(_onLoadArtists);
    on<LoadFoldersEvent>(_onLoadFolders);
    on<LoadGenresEvent>(_onLoadGenres);
  }

  Future<void> _onLoadLibrary(
    LoadLibraryEvent event,
    Emitter<LibraryState> emit,
  ) async {
    emit(state.copyWith(status: LibraryStatus.loading));

    try {
      final granted = await requestAudioPermissionUseCase();

      if (!granted) {
        emit(
          state.copyWith(
            status: LibraryStatus.error,
            message: 'Audio permission denied',
          ),
        );
        return;
      }

      final songs = await getLocalSongUseCase();

      emit(
        state.copyWith(
          status: LibraryStatus.loaded,
          songs: songs,
          loadedTabs: {...state.loadedTabs, LibraryTab.songs},
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LibraryStatus.error, message: e.toString()));
    }
  }

  Future<void> _onChangeTab(
    ChangeLibraryTabEvent event,
    Emitter<LibraryState> emit,
  ) async {
    emit(state.copyWith(selectedTab: event.tab));

    if (state.loadedTabs.contains(event.tab)) return;

    switch (event.tab) {
      case LibraryTab.songs:
        add(const LoadSongsEvent());

      case LibraryTab.albums:
        add(const LoadAlbumsEvent());

      case LibraryTab.artists:
        add(const LoadArtistsEvent());

      case LibraryTab.folders:
        add(const LoadFoldersEvent());

      case LibraryTab.genres:
        add(const LoadGenresEvent());
    }
  }

  Future<void> _onLoadSongs(
    LoadSongsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    try {
      final songs = await getLocalSongUseCase();

      emit(
        state.copyWith(
          songs: songs,
          loadedTabs: {...state.loadedTabs, LibraryTab.songs},
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LibraryStatus.error, message: e.toString()));
    }
  }

  Future<void> _onLoadAlbums(
    LoadAlbumsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    try {
      final albums = await getAlbumsUseCase();

      emit(
        state.copyWith(
          albums: albums,
          loadedTabs: {...state.loadedTabs, LibraryTab.albums},
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LibraryStatus.error, message: e.toString()));
    }
  }

  Future<void> _onLoadArtists(
    LoadArtistsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    try {
      final artists = await getArtistsUseCase();

      emit(
        state.copyWith(
          artists: artists,
          loadedTabs: {...state.loadedTabs, LibraryTab.artists},
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LibraryStatus.error, message: e.toString()));
    }
  }

  Future<void> _onLoadFolders(
    LoadFoldersEvent event,
    Emitter<LibraryState> emit,
  ) async {
    try {
      final folders = await getFoldersUseCase();

      emit(
        state.copyWith(
          folders: folders,
          loadedTabs: {...state.loadedTabs, LibraryTab.folders},
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LibraryStatus.error, message: e.toString()));
    }
  }

  Future<void> _onLoadGenres(
    LoadGenresEvent event,
    Emitter<LibraryState> emit,
  ) async {
    try {
      final genres = await getGenresUseCase();

      emit(
        state.copyWith(
          genres: genres,
          loadedTabs: {...state.loadedTabs, LibraryTab.genres},
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: LibraryStatus.error, message: e.toString()));
    }
  }
}
