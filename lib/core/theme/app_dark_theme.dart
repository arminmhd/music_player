import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/typography/app_typography.dart';
import 'package:my_player/core/theme/app_color_scheme.dart';
import 'package:my_player/core/theme/component/app_bar_theme.dart';
import 'package:my_player/core/theme/component/bottom_sheet_theme.dart';
import 'package:my_player/core/theme/component/card_theme.dart';
import 'package:my_player/core/theme/component/dialog_theme.dart';
import 'package:my_player/core/theme/component/divider_theme.dart';
import 'package:my_player/core/theme/component/icon_button_theme.dart';
import 'package:my_player/core/theme/component/input_theme.dart';
import 'package:my_player/core/theme/component/list_tile_theme.dart';
import 'package:my_player/core/theme/component/navigation_bar_theme.dart';
import 'package:my_player/core/theme/component/slider_theme.dart';

abstract final class AppDarkTheme {
  const AppDarkTheme._();

  static ThemeData get theme {
    ThemeData theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: AppColorScheme.dark,
      scaffoldBackgroundColor: AppColorScheme.dark.surface,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColorScheme.dark.onSurface,
        displayColor: AppColorScheme.dark.onSurface,
      ),
    );

    theme = applyAppBarTheme(theme);
    theme = applyIconButtonTheme(theme);
    theme = applyDividerTheme(theme);
    theme = applyCardTheme(theme);
    theme = applyInputTheme(theme);
    theme = applyListTileTheme(theme);
    theme = applyNavigationBarTheme(theme);
    theme = applySliderTheme(theme);
    theme = applyBottomSheetTheme(theme);
    theme = applyDialogTheme(theme);

    return theme;
  }
}
