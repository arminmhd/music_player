import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/design_system/spacing/app_spacing.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class PlayerInfo extends StatelessWidget {
  final SongEntity song;
  const PlayerInfo({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: AppInsets.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    data: song.title,
                    maxLines: 1,
                    style: context.textTheme.titleMedium,
                  ),

                  AppSpacing.sm.verticalSpace,

                  AppTextWidget(data: song.artist, maxLines: 1),
                ],
              ),
            ),
          ),

          IconButton(onPressed: () {}, icon: AppIcons.favorite),
        ],
      ),
    );
  }
}
