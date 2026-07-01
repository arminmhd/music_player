import 'dart:typed_data';

import 'package:my_player/core/platform/media/media_store_channel.dart';

class ArtworkCache {
  ArtworkCache._();

  static final Map<int, Uint8List?> _cache = {};

  static Future<Uint8List?> get(int albumId) async {
    if (_cache.containsKey(albumId)) {
      return _cache[albumId];
    }

    final result = await MediaStoreChannel.getArtwork(albumId);

    _cache[albumId] = result;

    return result;
  }

  static void clear() {
    _cache.clear();
  }
}
