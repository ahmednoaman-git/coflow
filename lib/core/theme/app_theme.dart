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
        primary: colors.signatureBlue,
        onPrimary: colors.textWhite,
        surface: colors.backgroundWhite,
        surfaceTint: Colors.transparent,
        onSurface: colors.textPrimary,
      ),
      splashFactory: NoSplash.splashFactory,
      dividerColor: const Color(0xFFE0E0E0),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE0E0E0),
        thickness: 1,
        space: 0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.backgroundWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.backgroundWhite,
        surfaceTintColor: Colors.transparent,
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
        primary: colors.signatureBlue,
        onPrimary: colors.textWhite,
        surface: colors.backgroundWhite,
        surfaceTint: Colors.transparent,
        onSurface: colors.textPrimary,
      ),
      splashFactory: NoSplash.splashFactory,
      dividerColor: const Color(0xFF404040),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF404040),
        thickness: 1,
        space: 0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.backgroundWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.backgroundWhite,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
