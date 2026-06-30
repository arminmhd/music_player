import 'package:my_player/features/library/domain/entities/song_entity.dart';

class PlayerRouteArgs {
  final List<SongEntity> queue;
  final int initialIndex;

  const PlayerRouteArgs({required this.queue, required this.initialIndex});
}
