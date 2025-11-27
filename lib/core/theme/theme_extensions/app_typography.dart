import 'package:flutter/material.dart';

/// Custom typography extension for the app theme using Circular Std font.
/// Access typography via: `Theme.of(context).extension<AppTypography>()`
/// or use context.typography extension method.
///
/// Naming convention: `weightSize` (e.g., `book14`, `medium16`, `bold18`)
/// This makes it easy to map Figma designs directly to code.
///
/// Weights available:
/// - Book (FontWeight.w400) - Regular weight for body text
/// - Medium (FontWeight.w500) - Medium weight for emphasis
/// - Bold (FontWeight.w700) - Bold weight for headings
@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  // Book (Regular) styles
  final TextStyle book10;
  final TextStyle book11;
  final TextStyle book12;
  final TextStyle book13;
  final TextStyle book14;
  final TextStyle book16;
  final TextStyle book18;
  final TextStyle book20;
  final TextStyle book36;

  // Medium styles
  final TextStyle medium11;
  final TextStyle medium12;
  final TextStyle medium13;
  final TextStyle medium14;
  final TextStyle medium16;
  final TextStyle medium17;
  final TextStyle medium18;
  final TextStyle medium20;
  final TextStyle medium24;

  // Bold styles
  final TextStyle bold13;
  final TextStyle bold14;
  final TextStyle bold16;
  final TextStyle bold18;
  final TextStyle bold20;
  final TextStyle bold22;
  final TextStyle bold24;

  const AppTypography({
    required this.book10,
    required this.book11,
    required this.book12,
    required this.book13,
    required this.book14,
    required this.book16,
    required this.book18,
    required this.book20,
    required this.book36,
    required this.medium11,
    required this.medium12,
    required this.medium13,
    required this.medium14,
    required this.medium16,
    required this.medium17,
    required this.medium18,
    required this.medium20,
    required this.medium24,
    required this.bold13,
    required this.bold14,
    required this.bold16,
    required this.bold18,
    required this.bold20,
    required this.bold22,
    required this.bold24,
  });

  static const _fontFamily = 'CircularStd';

  /// Default typography using Circular Std font
  static const defaultTypography = AppTypography(
    // Book (Regular) styles - w400
    book10: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10,
      height: 1.4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book11: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      height: 1.4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book12: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book13: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13,
      height: 1.4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book14: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book16: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book18: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book20: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      height: 1.4,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    book36: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 36,
      height: 1.2,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),

    // Medium styles - w500
    medium11: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      height: 1.4,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium12: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.4,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium13: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13,
      height: 1.4,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium14: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium16: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium17: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 17,
      height: 1.4,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium18: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium20: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      height: 1.4,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    medium24: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      height: 1.3,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),

    // Bold styles - w700
    bold13: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13,
      height: 1.4,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bold14: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bold16: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bold18: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bold20: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      height: 1.4,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bold22: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      height: 1.3,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bold24: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      height: 1.3,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
  );

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? book10,
    TextStyle? book11,
    TextStyle? book12,
    TextStyle? book13,
    TextStyle? book14,
    TextStyle? book16,
    TextStyle? book18,
    TextStyle? book20,
    TextStyle? book36,
    TextStyle? medium11,
    TextStyle? medium12,
    TextStyle? medium13,
    TextStyle? medium14,
    TextStyle? medium16,
    TextStyle? medium17,
    TextStyle? medium18,
    TextStyle? medium20,
    TextStyle? medium24,
    TextStyle? bold13,
    TextStyle? bold14,
    TextStyle? bold16,
    TextStyle? bold18,
    TextStyle? bold20,
    TextStyle? bold22,
    TextStyle? bold24,
  }) {
    return AppTypography(
      book10: book10 ?? this.book10,
      book11: book11 ?? this.book11,
      book12: book12 ?? this.book12,
      book13: book13 ?? this.book13,
      book14: book14 ?? this.book14,
      book16: book16 ?? this.book16,
      book18: book18 ?? this.book18,
      book20: book20 ?? this.book20,
      book36: book36 ?? this.book36,
      medium11: medium11 ?? this.medium11,
      medium12: medium12 ?? this.medium12,
      medium13: medium13 ?? this.medium13,
      medium14: medium14 ?? this.medium14,
      medium16: medium16 ?? this.medium16,
      medium17: medium17 ?? this.medium17,
      medium18: medium18 ?? this.medium18,
      medium20: medium20 ?? this.medium20,
      medium24: medium24 ?? this.medium24,
      bold13: bold13 ?? this.bold13,
      bold14: bold14 ?? this.bold14,
      bold16: bold16 ?? this.bold16,
      bold18: bold18 ?? this.bold18,
      bold20: bold20 ?? this.bold20,
      bold22: bold22 ?? this.bold22,
      bold24: bold24 ?? this.bold24,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) {
      return this;
    }

    return AppTypography(
      book10: TextStyle.lerp(book10, other.book10, t)!,
      book11: TextStyle.lerp(book11, other.book11, t)!,
      book12: TextStyle.lerp(book12, other.book12, t)!,
      book13: TextStyle.lerp(book13, other.book13, t)!,
      book14: TextStyle.lerp(book14, other.book14, t)!,
      book16: TextStyle.lerp(book16, other.book16, t)!,
      book18: TextStyle.lerp(book18, other.book18, t)!,
      book20: TextStyle.lerp(book20, other.book20, t)!,
      book36: TextStyle.lerp(book36, other.book36, t)!,
      medium11: TextStyle.lerp(medium11, other.medium11, t)!,
      medium12: TextStyle.lerp(medium12, other.medium12, t)!,
      medium13: TextStyle.lerp(medium13, other.medium13, t)!,
      medium14: TextStyle.lerp(medium14, other.medium14, t)!,
      medium16: TextStyle.lerp(medium16, other.medium16, t)!,
      medium17: TextStyle.lerp(medium17, other.medium17, t)!,
      medium18: TextStyle.lerp(medium18, other.medium18, t)!,
      medium20: TextStyle.lerp(medium20, other.medium20, t)!,
      medium24: TextStyle.lerp(medium24, other.medium24, t)!,
      bold13: TextStyle.lerp(bold13, other.bold13, t)!,
      bold14: TextStyle.lerp(bold14, other.bold14, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
      bold20: TextStyle.lerp(bold20, other.bold20, t)!,
      bold22: TextStyle.lerp(bold22, other.bold22, t)!,
      bold24: TextStyle.lerp(bold24, other.bold24, t)!,
    );
  }
}
