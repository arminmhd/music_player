import 'package:flutter/material.dart';
import 'package:my_player/features/library/domain/entities/genre_entity.dart';
import 'package:my_player/features/library/presentation/widgets/genre/genre_tile.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key, required this.genres});

  final List<GenreEntity> genres;

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) {
      return const Center(child: Text('No genres found'));
    }

    return ListView.builder(
      itemCount: genres.length,
      itemBuilder: (_, index) {
        return GenreTile(genre: genres[index]);
      },
    );
  }
}
