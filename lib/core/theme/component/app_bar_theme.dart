import 'package:flutter/material.dart';

ThemeData applyAppBarTheme(ThemeData theme) {
  return theme.copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: theme.colorScheme.surface,
      foregroundColor: theme.colorScheme.onSurface,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: theme.colorScheme.onSurface, size: 24),
      titleTextStyle: theme.textTheme.titleLarge,
    ),
  );
}
