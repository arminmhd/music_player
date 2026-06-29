import 'package:equatable/equatable.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class SongModel extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String uri;
  final int duration;
  final int size;

  final int albumId;

  const SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.uri,
    required this.duration,
    required this.size,
    required this.albumId,
  });

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'] as int,
      title: map['title'] as String,
      artist: map['artist'] as String,
      album: map['album'] as String,
      uri: map['uri'] as String,
      duration: map['duration'] as int,
      size: map['size'] as int,
      albumId: map['albumId'] as int,
    );
  }

  SongEntity toEntity() {
    return SongEntity(
      id: id,
      title: title,
      artist: artist,
      album: album,
      uri: uri,
      duration: duration,
      size: size,
      albumId: albumId,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    artist,
    album,
    uri,
    duration,
    size,
    albumId,
  ];
}
