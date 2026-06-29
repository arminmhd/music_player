import 'package:my_player/features/library/data/datasources/library_local_data_source.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/library/domain/library_repository.dart';

import 'package:my_player/features/library/domain/entities/album_entity.dart';
import 'package:my_player/features/library/domain/entities/artist_entity.dart';
import 'package:my_player/features/library/domain/entities/folder_entity.dart';
import 'package:my_player/features/library/domain/entities/genre_entity.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final LibraryLocalDataSource localDataSource;

  const LibraryRepositoryImpl(this.localDataSource);

  @override
  Future<List<SongEntity>> getSongs() async {
    final result = await localDataSource.getSongs();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<AlbumEntity>> getAlbums() async {
    final result = await localDataSource.getAlbums();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ArtistEntity>> getArtists() async {
    final result = await localDataSource.getArtists();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<FolderEntity>> getFolders() async {
    final result = await localDataSource.getFolders();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<GenreEntity>> getGenres() async {
    final result = await localDataSource.getGenres();
    return result.map((e) => e.toEntity()).toList();
  }
}
