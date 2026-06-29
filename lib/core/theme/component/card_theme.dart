import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';

ThemeData applyCardTheme(ThemeData theme) {
  return theme.copyWith(
    cardTheme: CardThemeData(
      elevation: 0,
      color: theme.colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
    ),
  );
}
