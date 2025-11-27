import 'package:flutter/material.dart';

/// Custom color palette extension for the app theme.
/// Access colors via: `Theme.of(context).extension<AppColors>()`
/// or use `context.colors` extension method.
///
/// Color Categories:
/// - Main: Brand colors (Signature Blue)
/// - Text: Typography colors
/// - Identity: Feature/accent colors (Sky Blue, Sea Caribbean, Gold, Cherry, Ladies Only)
/// - Background: Surface colors
/// - Stroke: Border colors
@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─────────────────────────────────────────────────────────────────────────
  // Main
  // ─────────────────────────────────────────────────────────────────────────
  final Color signatureBlue;
  final Color signatureBlueSecondary;

  // ─────────────────────────────────────────────────────────────────────────
  // Text
  // ─────────────────────────────────────────────────────────────────────────
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textWhite;

  // ─────────────────────────────────────────────────────────────────────────
  // Identity - Sky Blue
  // ─────────────────────────────────────────────────────────────────────────
  final Color skyBluePrimary;
  final Color skyBlueSecondary;

  // ─────────────────────────────────────────────────────────────────────────
  // Identity - Sea Caribbean Water
  // ─────────────────────────────────────────────────────────────────────────
  final Color seaCaribbeanPrimary;
  final Color seaCaribbeanSecondary;

  // ─────────────────────────────────────────────────────────────────────────
  // Identity - Earth Sunny Gold
  // ─────────────────────────────────────────────────────────────────────────
  final Color earthSunnyGoldPrimary;
  final Color earthSunnyGoldSecondary;

  // ─────────────────────────────────────────────────────────────────────────
  // Identity - Energy Light Cherry
  // ─────────────────────────────────────────────────────────────────────────
  final Color energyCherryPrimary;
  final Color energyCherrySecondary;

  // ─────────────────────────────────────────────────────────────────────────
  // Identity - Ladies Only
  // ─────────────────────────────────────────────────────────────────────────
  final Color ladiesOnlyPrimary;
  final Color ladiesOnlySecondary;

  // ─────────────────────────────────────────────────────────────────────────
  // Background
  // ─────────────────────────────────────────────────────────────────────────
  final Color backgroundOne;
  final Color backgroundTwo;
  final Color backgroundGrey;
  final Color backgroundGreyTwo;
  final Color backgroundWhite;

  // ─────────────────────────────────────────────────────────────────────────
  // Stroke
  // ─────────────────────────────────────────────────────────────────────────
  final Color strokePrimary;
  final Color strokeSecondary;
  final Color strokeRed;
  final Color strokeBlue;
  final Color strokeGreen;
  final Color strokeOrange;

  // ─────────────────────────────────────────────────────────────────────────
  // System (for shadows and dark mode border fallback)
  // ─────────────────────────────────────────────────────────────────────────
  /// Color used for shadows - visible in light mode, transparent in dark mode
  final Color shadowColor;

  /// Transparent in light mode (uses shadows), visible border in dark mode (replaces shadows)
  final Color borderShadowSwitch;

  const AppColors({
    required this.signatureBlue,
    required this.signatureBlueSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textWhite,
    required this.skyBluePrimary,
    required this.skyBlueSecondary,
    required this.seaCaribbeanPrimary,
    required this.seaCaribbeanSecondary,
    required this.earthSunnyGoldPrimary,
    required this.earthSunnyGoldSecondary,
    required this.energyCherryPrimary,
    required this.energyCherrySecondary,
    required this.ladiesOnlyPrimary,
    required this.ladiesOnlySecondary,
    required this.backgroundOne,
    required this.backgroundTwo,
    required this.backgroundGrey,
    required this.backgroundGreyTwo,
    required this.backgroundWhite,
    required this.strokePrimary,
    required this.strokeSecondary,
    required this.strokeRed,
    required this.strokeBlue,
    required this.strokeGreen,
    required this.strokeOrange,
    required this.shadowColor,
    required this.borderShadowSwitch,
  });

  /// Light theme color palette
  static const light = AppColors(
    // Main
    signatureBlue: Color(0xFF181935),
    signatureBlueSecondary: Color(0xFFD6D7EF),

    // Text
    textPrimary: Color(0xFF19182A),
    textSecondary: Color(0xFF434253),
    textTertiary: Color(0xFF6E6E81),
    textDisabled: Color(0xFFAFB0C1),
    textWhite: Color(0xFFFFFFFF),

    // Identity - Sky Blue
    skyBluePrimary: Color(0xFF2F9BE8),
    skyBlueSecondary: Color(0xFFE2EFF8),

    // Identity - Sea Caribbean Water
    seaCaribbeanPrimary: Color(0xFF2FDAC2),
    seaCaribbeanSecondary: Color(0xFFE2F8EB),

    // Identity - Earth Sunny Gold
    earthSunnyGoldPrimary: Color(0xFFFE9E12),
    earthSunnyGoldSecondary: Color(0xFFFFF0E1),

    // Identity - Energy Light Cherry
    energyCherryPrimary: Color(0xFFDA302B),
    energyCherrySecondary: Color(0xFFFCE2E2),

    // Identity - Ladies Only
    ladiesOnlyPrimary: Color(0xFFF91C96),
    ladiesOnlySecondary: Color(0xFFFFEAF1),

    // Background
    backgroundOne: Color(0xFFF7F7F7),
    backgroundTwo: Color(0xFFFAFAFA),
    backgroundGrey: Color(0xFFF5F5F6),
    backgroundGreyTwo: Color(0xFFE9E9EB),
    backgroundWhite: Color(0xFFFFFFFF),

    // Stroke
    strokePrimary: Color(0xFFF0F0F0),
    strokeSecondary: Color(0xFFE4E4E4),
    strokeRed: Color(0xFFF8BFBE),
    strokeBlue: Color(0xFFBFDBE9),
    strokeGreen: Color(0xFFC7F1E7),
    strokeOrange: Color(0xFFFFE4BE),

    // System
    shadowColor: Color(0xFF19182A),
    borderShadowSwitch: Color(0x00000000),
  );

  /// Dark theme color palette
  static const dark = AppColors(
    // Main (inverted for dark mode)
    signatureBlue: Color(0xFFD6D7EF),
    signatureBlueSecondary: Color(0xFF181935),

    // Text (adjusted for dark mode readability)
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFD1D5DB),
    textTertiary: Color(0xFF9CA3AF),
    textDisabled: Color(0xFF6B7280),
    textWhite: Color(0xFFFFFFFF),

    // Identity - Sky Blue (brightened for dark mode)
    skyBluePrimary: Color(0xFF5BB5F0),
    skyBlueSecondary: Color(0xFF1C2738),

    // Identity - Sea Caribbean Water (brightened for dark mode)
    seaCaribbeanPrimary: Color(0xFF5BE8D4),
    seaCaribbeanSecondary: Color(0xFF1C3830),

    // Identity - Earth Sunny Gold (brightened for dark mode)
    earthSunnyGoldPrimary: Color(0xFFFFB84D),
    earthSunnyGoldSecondary: Color(0xFF3D2F1C),

    // Identity - Energy Light Cherry (brightened for dark mode)
    energyCherryPrimary: Color(0xFFEF5350),
    energyCherrySecondary: Color(0xFF3B1C1C),

    // Identity - Ladies Only (brightened for dark mode)
    ladiesOnlyPrimary: Color(0xFFFF4DB2),
    ladiesOnlySecondary: Color(0xFF3D1C2E),

    // Background (dark surfaces)
    backgroundOne: Color(0xFF1A1A1A),
    backgroundTwo: Color(0xFF2A2A2A),
    backgroundGrey: Color(0xFF3A3A3A),
    backgroundGreyTwo: Color(0xFF4A4A4A),
    backgroundWhite: Color(0xFF1A1A1A),

    // Stroke (darker for dark mode)
    strokePrimary: Color(0xFF404040),
    strokeSecondary: Color(0xFF525252),
    strokeRed: Color(0xFF5C2A29),
    strokeBlue: Color(0xFF2A4A5C),
    strokeGreen: Color(0xFF2A5C4A),
    strokeOrange: Color(0xFF5C4A2A),

    // System
    shadowColor: Color(0x00000000),
    borderShadowSwitch: Color(0xFF404040),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? signatureBlue,
    Color? signatureBlueSecondary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textWhite,
    Color? skyBluePrimary,
    Color? skyBlueSecondary,
    Color? seaCaribbeanPrimary,
    Color? seaCaribbeanSecondary,
    Color? earthSunnyGoldPrimary,
    Color? earthSunnyGoldSecondary,
    Color? energyCherryPrimary,
    Color? energyCherrySecondary,
    Color? ladiesOnlyPrimary,
    Color? ladiesOnlySecondary,
    Color? backgroundOne,
    Color? backgroundTwo,
    Color? backgroundGrey,
    Color? backgroundGreyTwo,
    Color? backgroundWhite,
    Color? strokePrimary,
    Color? strokeSecondary,
    Color? strokeRed,
    Color? strokeBlue,
    Color? strokeGreen,
    Color? strokeOrange,
    Color? shadowColor,
    Color? borderShadowSwitch,
  }) {
    return AppColors(
      signatureBlue: signatureBlue ?? this.signatureBlue,
      signatureBlueSecondary:
          signatureBlueSecondary ?? this.signatureBlueSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textWhite: textWhite ?? this.textWhite,
      skyBluePrimary: skyBluePrimary ?? this.skyBluePrimary,
      skyBlueSecondary: skyBlueSecondary ?? this.skyBlueSecondary,
      seaCaribbeanPrimary: seaCaribbeanPrimary ?? this.seaCaribbeanPrimary,
      seaCaribbeanSecondary:
          seaCaribbeanSecondary ?? this.seaCaribbeanSecondary,
      earthSunnyGoldPrimary:
          earthSunnyGoldPrimary ?? this.earthSunnyGoldPrimary,
      earthSunnyGoldSecondary:
          earthSunnyGoldSecondary ?? this.earthSunnyGoldSecondary,
      energyCherryPrimary: energyCherryPrimary ?? this.energyCherryPrimary,
      energyCherrySecondary:
          energyCherrySecondary ?? this.energyCherrySecondary,
      ladiesOnlyPrimary: ladiesOnlyPrimary ?? this.ladiesOnlyPrimary,
      ladiesOnlySecondary: ladiesOnlySecondary ?? this.ladiesOnlySecondary,
      backgroundOne: backgroundOne ?? this.backgroundOne,
      backgroundTwo: backgroundTwo ?? this.backgroundTwo,
      backgroundGrey: backgroundGrey ?? this.backgroundGrey,
      backgroundGreyTwo: backgroundGreyTwo ?? this.backgroundGreyTwo,
      backgroundWhite: backgroundWhite ?? this.backgroundWhite,
      strokePrimary: strokePrimary ?? this.strokePrimary,
      strokeSecondary: strokeSecondary ?? this.strokeSecondary,
      strokeRed: strokeRed ?? this.strokeRed,
      strokeBlue: strokeBlue ?? this.strokeBlue,
      strokeGreen: strokeGreen ?? this.strokeGreen,
      strokeOrange: strokeOrange ?? this.strokeOrange,
      shadowColor: shadowColor ?? this.shadowColor,
      borderShadowSwitch: borderShadowSwitch ?? this.borderShadowSwitch,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      signatureBlue: Color.lerp(signatureBlue, other.signatureBlue, t)!,
      signatureBlueSecondary: Color.lerp(
        signatureBlueSecondary,
        other.signatureBlueSecondary,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textWhite: Color.lerp(textWhite, other.textWhite, t)!,
      skyBluePrimary: Color.lerp(skyBluePrimary, other.skyBluePrimary, t)!,
      skyBlueSecondary: Color.lerp(
        skyBlueSecondary,
        other.skyBlueSecondary,
        t,
      )!,
      seaCaribbeanPrimary: Color.lerp(
        seaCaribbeanPrimary,
        other.seaCaribbeanPrimary,
        t,
      )!,
      seaCaribbeanSecondary: Color.lerp(
        seaCaribbeanSecondary,
        other.seaCaribbeanSecondary,
        t,
      )!,
      earthSunnyGoldPrimary: Color.lerp(
        earthSunnyGoldPrimary,
        other.earthSunnyGoldPrimary,
        t,
      )!,
      earthSunnyGoldSecondary: Color.lerp(
        earthSunnyGoldSecondary,
        other.earthSunnyGoldSecondary,
        t,
      )!,
      energyCherryPrimary: Color.lerp(
        energyCherryPrimary,
        other.energyCherryPrimary,
        t,
      )!,
      energyCherrySecondary: Color.lerp(
        energyCherrySecondary,
        other.energyCherrySecondary,
        t,
      )!,
      ladiesOnlyPrimary: Color.lerp(
        ladiesOnlyPrimary,
        other.ladiesOnlyPrimary,
        t,
      )!,
      ladiesOnlySecondary: Color.lerp(
        ladiesOnlySecondary,
        other.ladiesOnlySecondary,
        t,
      )!,
      backgroundOne: Color.lerp(backgroundOne, other.backgroundOne, t)!,
      backgroundTwo: Color.lerp(backgroundTwo, other.backgroundTwo, t)!,
      backgroundGrey: Color.lerp(backgroundGrey, other.backgroundGrey, t)!,
      backgroundGreyTwo: Color.lerp(
        backgroundGreyTwo,
        other.backgroundGreyTwo,
        t,
      )!,
      backgroundWhite: Color.lerp(backgroundWhite, other.backgroundWhite, t)!,
      strokePrimary: Color.lerp(strokePrimary, other.strokePrimary, t)!,
      strokeSecondary: Color.lerp(strokeSecondary, other.strokeSecondary, t)!,
      strokeRed: Color.lerp(strokeRed, other.strokeRed, t)!,
      strokeBlue: Color.lerp(strokeBlue, other.strokeBlue, t)!,
      strokeGreen: Color.lerp(strokeGreen, other.strokeGreen, t)!,
      strokeOrange: Color.lerp(strokeOrange, other.strokeOrange, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      borderShadowSwitch: Color.lerp(
        borderShadowSwitch,
        other.borderShadowSwitch,
        t,
      )!,
    );
  }
}
