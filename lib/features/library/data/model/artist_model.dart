import 'package:my_player/features/library/domain/entities/artist_entity.dart';

class ArtistModel {
  final int id;
  final String name;
  final int trackCount;
  final int albumCount;

  const ArtistModel({
    required this.id,
    required this.name,
    required this.trackCount,
    required this.albumCount,
  });

  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      id: map['id'],
      name: map['name'],
      trackCount: map['trackCount'],
      albumCount: map['albumCount'],
    );
  }

  ArtistEntity toEntity() {
    return ArtistEntity(
      id: id,
      name: name,
      trackCount: trackCount,
      albumCount: albumCount,
    );
  }
}
