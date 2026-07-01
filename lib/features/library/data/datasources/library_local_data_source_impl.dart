import 'package:my_player/core/platform/media/media_store_channel.dart';
import 'package:my_player/features/library/data/datasources/library_local_data_source.dart';
import 'package:my_player/features/library/data/model/album_model.dart';
import 'package:my_player/features/library/data/model/artist_model.dart';
import 'package:my_player/features/library/data/model/folder_model.dart';
import 'package:my_player/features/library/data/model/genre_model.dart';
import 'package:my_player/features/library/data/model/song_model.dart';

class LibraryLocalDataSourceImpl implements LibraryLocalDataSource {
  final MediaStoreChannel mediaStoreChannel;

  const LibraryLocalDataSourceImpl(this.mediaStoreChannel);

  @override
  Future<List<SongModel>> getSongs() async {
    final result = await mediaStoreChannel.getSongs();

    return result
        .map((e) => SongModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<List<AlbumModel>> getAlbums() async {
    final result = await mediaStoreChannel.getAlbums();

    return result
        .map((e) => AlbumModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<List<ArtistModel>> getArtists() async {
    final result = await mediaStoreChannel.getArtists();

    return result
        .map((e) => ArtistModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<List<FolderModel>> getFolders() async {
    final result = await mediaStoreChannel.getFolders();

    return result
        .map((e) => FolderModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await mediaStoreChannel.getGenres();

    return result
        .map((e) => GenreModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }
}
