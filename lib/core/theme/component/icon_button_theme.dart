import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';

ThemeData applyIconButtonTheme(ThemeData theme) {
  return theme.copyWith(
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(theme.colorScheme.onSurface),
        iconSize: const WidgetStatePropertyAll(24),
        padding: WidgetStatePropertyAll(AppInsets.card),
      ),
    ),
  );
}
