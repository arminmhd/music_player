import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';

ThemeData applyListTileTheme(ThemeData theme) {
  return theme.copyWith(
    listTileTheme: ListTileThemeData(
      dense: false,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),

      shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),

      iconColor: theme.colorScheme.onSurfaceVariant,
      textColor: theme.colorScheme.onSurface,
      titleTextStyle: theme.textTheme.titleMedium,
      subtitleTextStyle: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    ),
  );
}
