import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/widgets/app_list_tile_widget.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/artist_entity.dart';

class ArtistTile extends StatelessWidget {
  final ArtistEntity artist;
  const ArtistTile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return AppListTileWidget(
      leading: AppIcons.musicNote,

      title: AppTextWidget(data: artist.name),

      subtitle: AppTextWidget(data: '${artist.albumCount} Songs'),
    );
  }
}
