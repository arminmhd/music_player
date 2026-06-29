import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  final int id;
  final String name;
  final String artist;
  final int songCount;

  const AlbumEntity({
    required this.id,
    required this.name,
    required this.artist,
    required this.songCount,
  });

  @override
  List<Object?> get props => [id, name, artist, songCount];
}
