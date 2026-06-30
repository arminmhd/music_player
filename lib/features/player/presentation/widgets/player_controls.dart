import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';
import 'package:my_player/core/design_system/sizes/app_sizes.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';

class PlayerControls extends StatelessWidget {
  final bool isPlaying;
  final bool isShuffleEnabled;
  final bool isRepeatEnabled;

  final VoidCallback? onShufflePressed;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onPlayPressed;
  final VoidCallback? onPausePressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onRepeatPressed;

  const PlayerControls({
    super.key,
    required this.isPlaying,
    required this.isShuffleEnabled,
    required this.isRepeatEnabled,
    this.onShufflePressed,
    this.onPreviousPressed,
    this.onPlayPressed,
    this.onPausePressed,
    this.onNextPressed,
    this.onRepeatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SHUFFLE
          IconButton(
            onPressed: onShufflePressed,
            icon: AppIcons.shuffle,
            color: isShuffleEnabled
                ? context.colors.primary
                : context.colors.onSurface,
            iconSize: AppSizes.iconSm,
          ),

          // PREVIOUS
          IconButton(
            onPressed: onPreviousPressed,
            icon: AppIcons.previous,
            iconSize: AppSizes.iconXl + 5,
          ),

          // PLAY / PAUSE (MAIN)
          Container(
            decoration: BoxDecoration(
              color: context.colors.secondary,
              borderRadius: AppRadius.radiusFull,
            ),
            child: IconButton(
              onPressed: isPlaying ? onPausePressed : onPlayPressed,
              icon: isPlaying ? AppIcons.pause : AppIcons.play,
              iconSize: AppSizes.iconXl + 5,
            ),
          ),

          // NEXT
          IconButton(
            onPressed: onNextPressed,
            icon: AppIcons.next,
            iconSize: AppSizes.iconXl + 5,
          ),

          // REPEAT
          IconButton(
            onPressed: onRepeatPressed,
            icon: AppIcons.repeat,
            color: isShuffleEnabled
                ? context.colors.primary
                : context.colors.onSurface,
            iconSize: AppSizes.iconSm,
          ),
        ],
      ),
    );
  }
}
