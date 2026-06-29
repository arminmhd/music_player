import 'package:equatable/equatable.dart';

class ArtistEntity extends Equatable {
  final int id;
  final String name;
  final int trackCount;
  final int albumCount;

  const ArtistEntity({
    required this.id,
    required this.name,
    required this.trackCount,
    required this.albumCount,
  });

  @override
  List<Object?> get props => [id, name, trackCount, albumCount];
}
