import 'package:flutter/services.dart';

class MediaStoreChannel {
  const MediaStoreChannel();

  static const MethodChannel _channel = MethodChannel(
    'com.example.my_player/media_store',
  );

  Future<List<dynamic>> getSongs() async {
    final songs = await _channel.invokeMethod<List<dynamic>>('getSongs');
    return songs ?? [];
  }

  Future<List<dynamic>> getAlbums() async {
    final albums = await _channel.invokeMethod<List<dynamic>>('getAlbums');
    return albums ?? [];
  }

  Future<List<dynamic>> getArtists() async {
    final artists = await _channel.invokeMethod<List<dynamic>>('getArtists');
    return artists ?? [];
  }

  Future<List<dynamic>> getFolders() async {
    final folders = await _channel.invokeMethod<List<dynamic>>('getFolders');
    return folders ?? [];
  }

  Future<List<dynamic>> getGenres() async {
    final genres = await _channel.invokeMethod<List<dynamic>>('getGenres');
    return genres ?? [];
  }

  static Future<Uint8List?> getArtwork(int albumId) async {
    final result = await _channel.invokeMethod<Uint8List>('getArtwork', {
      'albumId': albumId,
    });

    return result;
  }
}
