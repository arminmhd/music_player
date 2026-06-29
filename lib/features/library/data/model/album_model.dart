import 'package:equatable/equatable.dart';

import '../../domain/entities/album_entity.dart';

class AlbumModel extends Equatable {
  final int id;
  final String name;
  final String artist;
  final int songCount;

  const AlbumModel({
    required this.id,
    required this.name,
    required this.artist,
    required this.songCount,
  });

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      id: map['id'] as int,
      name: map['name'] as String,
      artist: map['artist'] as String,
      songCount: map['songCount'] as int,
    );
  }

  AlbumEntity toEntity() {
    return AlbumEntity(
      id: id,
      name: name,
      artist: artist,
      songCount: songCount,
    );
  }

  @override
  List<Object?> get props => [id, name, artist, songCount];
}
