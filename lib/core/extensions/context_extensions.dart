import 'package:flutter/material.dart';

import '../theme/theme_extensions/app_colors.dart';
import '../theme/theme_extensions/app_shadows.dart';
import '../theme/theme_extensions/app_spacing.dart';
import '../theme/theme_extensions/app_typography.dart';

/// Extension methods on BuildContext for easy access to theme resources
extension ThemeExtensions on BuildContext {
  /// Access custom color palette
  /// Example: context.colors.signatureBlue
  AppColors get colors {
    return Theme.of(this).extension<AppColors>()!;
  }

  /// Access custom typography
  /// Example: context.typography.medium16
  AppTypography get typography {
    return Theme.of(this).extension<AppTypography>()!;
  }

  /// Access custom spacing
  /// Example: context.spacing.spacing4
  AppSpacing get spacing {
    return Theme.of(this).extension<AppSpacing>()!;
  }

  /// Access custom shadows
  /// Example: context.shadows.md
  AppShadows get shadows {
    return Theme.of(this).extension<AppShadows>()!;
  }

  /// Access theme data
  ThemeData get theme => Theme.of(this);

  /// Check if current theme is dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  void showInfoSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: typography.medium14),
        backgroundColor: colors.skyBluePrimary,
      ),
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: typography.medium14),
        backgroundColor: colors.energyCherryPrimary,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: typography.medium14),
        backgroundColor: colors.seaCaribbeanPrimary,
      ),
    );
  }

  void showWarningSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: typography.medium14),
        backgroundColor: colors.earthSunnyGoldPrimary,
      ),
    );
  }
}
