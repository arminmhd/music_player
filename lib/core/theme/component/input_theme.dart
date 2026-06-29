import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';

ThemeData applyInputTheme(ThemeData theme) {
  return theme.copyWith(
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: theme.colorScheme.surfaceContainer,

      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),

      prefixIconColor: theme.colorScheme.onSurfaceVariant,
      suffixIconColor: theme.colorScheme.onSurfaceVariant,

      border: OutlineInputBorder(
        borderRadius: AppRadius.radiusXl,
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.radiusXl,
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.radiusXl,
        borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.radiusXl,
        borderSide: BorderSide(color: theme.colorScheme.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.radiusXl,
        borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
      ),
    ),
  );
}
