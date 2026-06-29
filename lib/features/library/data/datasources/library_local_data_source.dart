import 'package:my_player/features/library/data/model/album_model.dart';
import 'package:my_player/features/library/data/model/artist_model.dart';
import 'package:my_player/features/library/data/model/folder_model.dart';
import 'package:my_player/features/library/data/model/genre_model.dart';
import 'package:my_player/features/library/data/model/song_model.dart';

abstract interface class LibraryLocalDataSource {
  Future<List<SongModel>> getSongs();

  Future<List<AlbumModel>> getAlbums();

  Future<List<ArtistModel>> getArtists();

  Future<List<FolderModel>> getFolders();

  Future<List<GenreModel>> getGenres();
}
