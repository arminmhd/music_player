import 'package:flutter/material.dart';
import 'package:my_player/features/library/domain/entities/album_entity.dart';
import 'package:my_player/features/library/presentation/widgets/album/album_tile.dart';

class AlbumList extends StatelessWidget {
  final List<AlbumEntity> albums;
  const AlbumList({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    if (albums.isEmpty) {
      return Center(child: Text('No Albums Found'));
    }

    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) {
        return AlbumTile(album: albums[index]);
      },
    );
  }
}
