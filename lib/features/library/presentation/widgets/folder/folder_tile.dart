import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/widgets/app_list_tile_widget.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/folder_entity.dart';

class FolderTile extends StatelessWidget {
  final FolderEntity folder;
  const FolderTile({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return AppListTileWidget(
      leading: AppIcons.musicNote,

      title: AppTextWidget(data: folder.name),

      subtitle: AppTextWidget(data: '${folder.songCount} Songs'),
    );
  }
}
