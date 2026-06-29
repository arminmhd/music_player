import 'package:flutter/material.dart';
import 'package:my_player/core/theme/app_dark_theme.dart';
import 'package:my_player/core/theme/app_light_theme.dart';

abstract final class AppTheme {
  const AppTheme._();

  static ThemeData get light => AppLightTheme.theme;

  static ThemeData get dark => AppDarkTheme.theme;
}
