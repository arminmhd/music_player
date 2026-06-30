import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';

class MiniPlayerControls extends StatelessWidget {
  final bool isPlaying;

  final VoidCallback onPreviousPressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onNextPressed;

  const MiniPlayerControls({
    super.key,
    required this.isPlaying,
    required this.onPreviousPressed,
    required this.onPlayPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPreviousPressed,
          icon: AppIcons.previous,
          iconSize: 22.sp,
        ),

        IconButton(
          onPressed: onPlayPressed,
          icon: isPlaying ? AppIcons.pause : AppIcons.play,
          iconSize: 30.sp,
        ),

        IconButton(
          onPressed: onNextPressed,
          icon: AppIcons.next,
          iconSize: 22.sp,
        ),
      ],
    );
  }
}
