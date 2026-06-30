import 'package:flutter/material.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/player/presentation/pages/player_view.dart';

class PlayerPage extends StatelessWidget {
  final List<SongEntity> queue;
  final int initialIndex;
  const PlayerPage({
    super.key,
    required this.queue,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return PlayerView(queue: queue, initialIndex: initialIndex);
  }
}
