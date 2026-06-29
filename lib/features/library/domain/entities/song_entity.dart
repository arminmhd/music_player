import 'package:equatable/equatable.dart';

class SongEntity extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String album;
  final String uri;
  final int duration;
  final int size;

  final int albumId;

  const SongEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.uri,
    required this.duration,
    required this.size,
    required this.albumId,
  });

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
