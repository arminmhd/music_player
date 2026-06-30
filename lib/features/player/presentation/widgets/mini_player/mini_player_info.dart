import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/entities/song_entity.dart';

class MiniPlayerInfo extends StatelessWidget {
  final SongEntity song;

  const MiniPlayerInfo({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              data: song.title,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium,
            ),

            SizedBox(height: 2.h),

            AppTextWidget(
              data: song.artist,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
