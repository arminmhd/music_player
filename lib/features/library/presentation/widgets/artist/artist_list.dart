import 'package:flutter/material.dart';
import 'package:my_player/features/library/domain/entities/artist_entity.dart';
import 'package:my_player/features/library/presentation/widgets/artist/artist_tile.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key, required this.artists});

  final List<ArtistEntity> artists;

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty) {
      return const Center(child: Text('No artists found'));
    }

    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (_, index) {
        return ArtistTile(artist: artists[index]);
      },
    );
  }
}
