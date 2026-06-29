import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/widgets/app_list_tile_widget.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/album_entity.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({super.key, required this.album, this.onTap});

  final AlbumEntity album;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppListTileWidget(
      leading: AppIcons.musicNote,

      title: AppTextWidget(data: album.name),

      subtitle: AppTextWidget(
        data: '${album.artist} • ${album.songCount} Songs',
      ),

      onTap: onTap,
    );
  }
}
