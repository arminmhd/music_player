import 'package:flutter/widgets.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';
import 'package:my_player/features/library/presentation/widgets/song/library_song_tile.dart';

class LibrarySongList extends StatelessWidget {
  final List<SongEntity> songs;
  final ValueChanged<SongEntity>? onSongTap;
  final ValueChanged<SongEntity>? onMorePressed;
  const LibrarySongList({
    super.key,
    required this.songs,
    this.onSongTap,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    if (songs.isEmpty) {
      return Center(child: AppTextWidget(data: 'No Songs Found'));
    }

    return Container(
      margin: AppInsets.card,
      decoration: BoxDecoration(
        borderRadius: AppRadius.radiusSm,
        color: context.colors.surfaceContainer.withValues(alpha: .3),
      ),
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];

          return LibrarySongTile(
            song: song,
            onTap: () => onSongTap?.call(song),
            onMoreTap: () => onMorePressed?.call(song),
          );
        },
      ),
    );
  }
}
