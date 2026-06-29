import 'package:my_player/features/library/domain/entities/album_entity.dart';
import 'package:my_player/features/library/domain/entities/artist_entity.dart';
import 'package:my_player/features/library/domain/entities/folder_entity.dart';
import 'package:my_player/features/library/domain/entities/genre_entity.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

abstract interface class LibraryRepository {
  Future<List<SongEntity>> getSongs();

  Future<List<AlbumEntity>> getAlbums();

  Future<List<ArtistEntity>> getArtists();

  Future<List<FolderEntity>> getFolders();

  Future<List<GenreEntity>> getGenres();
}
