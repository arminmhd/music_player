import 'package:flutter/material.dart';

ThemeData applyDividerTheme(ThemeData theme) {
  return theme.copyWith(
    dividerTheme: DividerThemeData(
      color: theme.colorScheme.outlineVariant,
      thickness: 1,
      space: 1,
    ),
  );
}
