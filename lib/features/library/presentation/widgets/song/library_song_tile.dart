import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/widgets/app_artwork_widget.dart';
import 'package:my_player/core/widgets/app_list_tile_widget.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class LibrarySongTile extends StatelessWidget {
  final SongEntity song;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;
  const LibrarySongTile({
    super.key,
    required this.song,
    this.onTap,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTileWidget(
      leading: AppArtworkWidget(albumId: song.albumId),

      title: AppTextWidget(data: song.title),

      subtitle: AppTextWidget(data: song.artist),

      trailing: AppIcons.more,
      onTap: onTap,
    );
  }
}
