import 'dart:ui';

import 'package:flutter/material.dart';

/// Custom spacing extension for the app theme.
/// Multiplications of 4 based grid system.
/// Access spacing via: Theme.of(context).extension<AppSpacing>()
/// or use context.spacing extension method
@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  /// 4px spacing
  final double s4;

  /// 8px spacing
  final double s8;

  /// 12px spacing
  final double s12;

  /// 16px spacing
  final double s16;

  /// 24px spacing
  final double s24;

  /// 32px spacing
  final double s32;

  /// 48px spacing
  final double s48;

  /// 64px spacing
  final double s64;

  /// 96px spacing
  final double s96;

  /// 128px spacing
  final double s128;

  const AppSpacing({
    required this.s4,
    required this.s8,
    required this.s12,
    required this.s16,
    required this.s24,
    required this.s32,
    required this.s48,
    required this.s64,
    required this.s96,
    required this.s128,
  });

  /// Default spacing values based on 4px grid system
  static const defaultSpacing = AppSpacing(
    s4: 4.0,
    s8: 8.0,
    s12: 12.0,
    s16: 16.0,
    s24: 24.0,
    s32: 32.0,
    s48: 48.0,
    s64: 64.0,
    s96: 96.0,
    s128: 128.0,
  );

  @override
  ThemeExtension<AppSpacing> copyWith({
    double? s4,
    double? s8,
    double? s12,
    double? s16,
    double? s24,
    double? s32,
    double? s48,
    double? s64,
    double? s96,
    double? s128,
  }) {
    return AppSpacing(
      s4: s4 ?? this.s4,
      s8: s8 ?? this.s8,
      s12: s12 ?? this.s12,
      s16: s16 ?? this.s16,
      s24: s24 ?? this.s24,
      s32: s32 ?? this.s32,
      s48: s48 ?? this.s48,
      s64: s64 ?? this.s64,
      s96: s96 ?? this.s96,
      s128: s128 ?? this.s128,
    );
  }

  @override
  ThemeExtension<AppSpacing> lerp(
    covariant ThemeExtension<AppSpacing>? other,
    double t,
  ) {
    if (other is! AppSpacing) {
      return this;
    }

    return AppSpacing(
      s4: lerpDouble(s4, other.s4, t)!,
      s8: lerpDouble(s8, other.s8, t)!,
      s12: lerpDouble(s12, other.s12, t)!,
      s16: lerpDouble(s16, other.s16, t)!,
      s24: lerpDouble(s24, other.s24, t)!,
      s32: lerpDouble(s32, other.s32, t)!,
      s48: lerpDouble(s48, other.s48, t)!,
      s64: lerpDouble(s64, other.s64, t)!,
      s96: lerpDouble(s96, other.s96, t)!,
      s128: lerpDouble(s128, other.s128, t)!,
    );
  }
}
