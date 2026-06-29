import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/spacing/app_spacing.dart';

abstract final class AppInsets {
  const AppInsets._();

  //screen padding
  static const screen = EdgeInsets.all(AppSpacing.md);

  // horizontal screen padding
  static const horizontal = EdgeInsets.symmetric(horizontal: AppSpacing.md);

  /// Vertical Screen Padding
  static const vertical = EdgeInsets.symmetric(vertical: AppSpacing.md);

  /// Card Padding
  static const card = EdgeInsets.all(AppSpacing.md);

  /// List Item
  static const listItem = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  );

  /// Input Padding
  static const input = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  );
}
