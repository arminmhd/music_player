import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/design_system/spacing/app_spacing.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';

class LibraryAppBar extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onMoreTap;

  const LibraryAppBar({super.key, this.onSearchTap, this.onMoreTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.horizontal,
      child: Row(
        children: [
          Expanded(
            child: AppTextWidget(
              data: 'Library',
              style: context.textTheme.headlineMedium,
            ),
          ),

          IconButton(onPressed: onSearchTap, icon: AppIcons.search),

          AppSpacing.xxs.horizontalSpace,

          IconButton(onPressed: onMoreTap, icon: AppIcons.more),
        ],
      ),
    );
  }
}
