import 'package:equatable/equatable.dart';
import 'package:my_player/features/library/domain/entities/album_entity.dart';
import 'package:my_player/features/library/domain/entities/artist_entity.dart';
import 'package:my_player/features/library/domain/entities/folder_entity.dart';
import 'package:my_player/features/library/domain/entities/genre_entity.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/library/domain/enum/library_status.dart';
import 'package:my_player/features/library/domain/enum/library_tab.dart';

class LibraryState extends Equatable {
  final LibraryStatus status;

  final LibraryTab selectedTab;

  final List<SongEntity> songs;
  final List<AlbumEntity> albums;
  final List<GenreEntity> genres;
  final List<ArtistEntity> artists;
  final List<FolderEntity> folders;

  final Set<LibraryTab> loadedTabs;

  final String? message;

  const LibraryState({
    required this.status,
    required this.songs,
    this.message,
    required this.selectedTab,
    required this.albums,
    required this.genres,
    required this.artists,
    required this.folders,
    required this.loadedTabs,
  });

  factory LibraryState.initial() {
    return LibraryState(
      status: LibraryStatus.initial,
      songs: [],
      albums: [],
      genres: [],
      artists: [],
      folders: [],
      selectedTab: LibraryTab.songs,
      loadedTabs: {},
    );
  }

  LibraryState copyWith({
    LibraryStatus? status,

    List<SongEntity>? songs,
    List<AlbumEntity>? albums,
    List<ArtistEntity>? artists,
    List<FolderEntity>? folders,
    List<GenreEntity>? genres,

    LibraryTab? selectedTab,

    Set<LibraryTab>? loadedTabs,

    String? message,
  }) {
    return LibraryState(
      status: status ?? this.status,
      songs: songs ?? this.songs,
      message: message ?? this.message,
      selectedTab: selectedTab ?? this.selectedTab,
      albums: albums ?? this.albums,
      artists: artists ?? this.artists,
      folders: folders ?? this.folders,
      genres: genres ?? this.genres,

      loadedTabs: loadedTabs ?? this.loadedTabs,
    );
  }

  @override
  List<Object?> get props => [
    status,
    selectedTab,

    songs,
    albums,
    artists,
    folders,
    genres,

    loadedTabs,

    message,
  ];
}
