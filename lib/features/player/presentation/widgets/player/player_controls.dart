import 'package:flutter/material.dart' hide RepeatMode;
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';
import 'package:my_player/core/design_system/sizes/app_sizes.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import '../../enum/repeate_enum.dart';

class PlayerControls extends StatelessWidget {
  final bool isPlaying;
  final bool isShuffleEnabled;
  final RepeatMode repeatMode;

  final VoidCallback? onShufflePressed;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onPlayPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onRepeatPressed;

  const PlayerControls({
    super.key,
    required this.isPlaying,
    required this.isShuffleEnabled,
    required this.repeatMode,
    this.onShufflePressed,
    this.onPreviousPressed,
    this.onPlayPressed,
    this.onNextPressed,
    this.onRepeatPressed,
  });

  IconData _repeatIcon() {
    switch (repeatMode) {
      case RepeatMode.off:
      case RepeatMode.all:
        return Icons.repeat;

      case RepeatMode.one:
        return Icons.repeat_one;
    }
  }

  Color _repeatColor(BuildContext context) {
    return repeatMode == RepeatMode.off
        ? context.colors.onSurface
        : context.colors.primary;
  }

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

          // PLAY / PAUSE
          Container(
            decoration: BoxDecoration(
              color: context.colors.secondary,
              borderRadius: AppRadius.radiusFull,
            ),
            child: IconButton(
              onPressed: onPlayPressed,
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
            icon: Icon(_repeatIcon()),
            color: _repeatColor(context),
            iconSize: AppSizes.iconSm,
          ),
        ],
      ),
    );
  }
}
