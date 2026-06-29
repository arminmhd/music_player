import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';

ThemeData applyDialogTheme(ThemeData theme) {
  return theme.copyWith(
    dialogTheme: DialogThemeData(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,

      shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusXl),

      titleTextStyle: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      ),

      contentTextStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    ),
  );
}
