import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';

ThemeData applyBottomSheetTheme(ThemeData theme) {
  return theme.copyWith(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.xxl),
        ),
      ),

      clipBehavior: Clip.antiAlias,

      showDragHandle: true,
      dragHandleColor: theme.colorScheme.onSurfaceVariant,
      dragHandleSize: Size(40, 4),
    ),
  );
}
