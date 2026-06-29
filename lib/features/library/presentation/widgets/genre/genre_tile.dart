import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/widgets/app_list_tile_widget.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/genre_entity.dart';

class GenreTile extends StatelessWidget {
  final GenreEntity genre;
  const GenreTile({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return AppListTileWidget(
      leading: AppIcons.musicNote,

      title: AppTextWidget(data: genre.name),

      subtitle: AppTextWidget(data: '${genre.name} Songs'),
    );
  }
}
