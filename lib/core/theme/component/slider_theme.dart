import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';

ThemeData applySliderTheme(ThemeData theme) {
  return theme.copyWith(
    sliderTheme: SliderThemeData(
      trackHeight: 4,

      activeTrackColor: theme.colorScheme.primary,
      inactiveTrackColor: theme.colorScheme.surfaceContainerHighest,

      thumbColor: theme.colorScheme.primary,

      overlayColor: theme.colorScheme.primary.withValues(alpha: 0.12),

      thumbShape: const RoundSliderOverlayShape(overlayRadius: AppRadius.lg),

      trackShape: const RoundedRectSliderTrackShape(),

      valueIndicatorColor: theme.colorScheme.primary,

      valueIndicatorTextStyle: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onPrimary,
      ),
    ),
  );
}
