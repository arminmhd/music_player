import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icon_sizes.dart';

ThemeData applyNavigationBarTheme(ThemeData theme) {
  return theme.copyWith(
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: theme.colorScheme.surface,
      indicatorColor: theme.colorScheme.primary.withValues(alpha: 0.12),

      elevation: 0,

      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: theme.colorScheme.primary,
            size: AppIconSizes.md,
          );
        }
        return IconThemeData(
          color: theme.colorScheme.onSurfaceVariant,
          size: AppIconSizes.md,
        );
      }),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.primary,
          );
        }

        return theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        );
      }),
    ),
  );
}
