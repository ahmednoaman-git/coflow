import 'package:flutter/material.dart';

import 'theme_extensions/app_colors.dart';
import 'theme_extensions/app_shadows.dart';
import 'theme_extensions/app_spacing.dart';
import 'theme_extensions/app_typography.dart';

/// Application theme configuration
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get light {
    final colors = AppColors.light;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'CircularStd',
      extensions: [
        colors,
        AppTypography.defaultTypography,
        AppSpacing.defaultSpacing,
        AppShadows.fromColor(AppColors.light.shadowColor),
      ],
      scaffoldBackgroundColor: colors.backgroundWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.signatureBlue,
        brightness: Brightness.light,
        onSurface: colors.textPrimary,
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get dark {
    final colors = AppColors.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'CircularStd',
      extensions: [
        colors,
        AppTypography.defaultTypography,
        AppSpacing.defaultSpacing,
        AppShadows.fromColor(AppColors.dark.shadowColor),
      ],
      scaffoldBackgroundColor: colors.backgroundWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.signatureBlue,
        brightness: Brightness.dark,
        onSurface: colors.textPrimary,
      ),
    );
  }
}
