import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/colors/app_colors.dart';

abstract final class AppColorScheme {
  const AppColorScheme._();

  static final light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: AppColors.white,

    secondary: AppColors.secondary,
    onSecondary: AppColors.white,

    error: AppColors.error,
    onError: AppColors.white,

    surface: AppColors.white,
    onSurface: AppColors.grey900,

    surfaceContainer: AppColors.grey100,
    surfaceContainerHighest: AppColors.grey200,

    outline: AppColors.grey300,
    outlineVariant: AppColors.grey200,

    inverseSurface: AppColors.grey900,
    onInverseSurface: AppColors.white,

    onSurfaceVariant: AppColors.grey600,

    shadow: Colors.black26,
    scrim: Colors.black54,

    tertiary: AppColors.info,
    onTertiary: AppColors.white,
  );

  static const dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primary,
    onPrimary: AppColors.white,

    secondary: AppColors.secondary,
    onSecondary: AppColors.white,

    error: AppColors.error,
    onError: AppColors.white,

    surface: AppColors.black,
    onSurface: AppColors.white,

    surfaceContainer: AppColors.grey800,
    surfaceContainerHighest: AppColors.grey700,

    outline: AppColors.grey700,
    outlineVariant: AppColors.grey600,

    inverseSurface: AppColors.white,
    onInverseSurface: AppColors.grey900,

    onSurfaceVariant: AppColors.grey300,

    inversePrimary: AppColors.primary,

    shadow: Colors.black54,
    scrim: Colors.black87,

    tertiary: AppColors.info,
    onTertiary: AppColors.white,
  );
}
