import 'package:flutter/material.dart';

/// Custom shadow extension for the app theme.
/// Shadows use the shadowColor from AppColors, which is visible in light mode
/// and transparent in dark mode (where borders are used instead).
/// Access shadows via: Theme.of(context).extension<AppShadows>()
/// or use context.shadows extension method
@immutable
class AppShadows extends ThemeExtension<AppShadows> {
  /// Extra small shadow - subtle elevation (1dp)
  final List<BoxShadow> xs;

  /// Small shadow - slight elevation (2dp)
  final List<BoxShadow> sm;

  /// Medium shadow - moderate elevation (4dp)
  final List<BoxShadow> md;

  /// Large shadow - prominent elevation (8dp)
  final List<BoxShadow> lg;

  /// Extra large shadow - high elevation (12dp)
  final List<BoxShadow> xl;

  /// 2X large shadow - very high elevation (16dp)
  final List<BoxShadow> xxl;

  const AppShadows({
    this.xs = const [],
    this.sm = const [],
    this.md = const [],
    this.lg = const [],
    this.xl = const [],
    this.xxl = const [],
  });

  /// Create default shadows using the provided shadow color
  factory AppShadows.fromColor(Color shadowColor) {
    if (shadowColor == Colors.transparent) {
      // No shadows if shadow color is fully transparent
      return const AppShadows();
    }

    return AppShadows(
      // XS - 1dp elevation
      xs: [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.05),
          offset: const Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ],

      // SM - 2dp elevation
      sm: [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.1),
          offset: const Offset(0, 1),
          blurRadius: 3,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.06),
          offset: const Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ],

      // MD - 4dp elevation
      md: [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.1),
          offset: const Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -1,
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.06),
          offset: const Offset(0, 2),
          blurRadius: 4,
          spreadRadius: -1,
        ),
      ],

      // LG - 8dp elevation
      lg: [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.1),
          offset: const Offset(0, 10),
          blurRadius: 15,
          spreadRadius: -3,
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.05),
          offset: const Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -2,
        ),
      ],

      // XL - 12dp elevation
      xl: [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.1),
          offset: const Offset(0, 20),
          blurRadius: 25,
          spreadRadius: -5,
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.04),
          offset: const Offset(0, 10),
          blurRadius: 10,
          spreadRadius: -5,
        ),
      ],

      // XXL - 16dp elevation
      xxl: [
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.12),
          offset: const Offset(0, 25),
          blurRadius: 50,
          spreadRadius: -12,
        ),
        BoxShadow(
          color: shadowColor.withValues(alpha: 0.08),
          offset: const Offset(0, 12),
          blurRadius: 24,
          spreadRadius: -8,
        ),
      ],
    );
  }

  @override
  ThemeExtension<AppShadows> copyWith({
    List<BoxShadow>? xs,
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
    List<BoxShadow>? xl,
    List<BoxShadow>? xxl,
  }) {
    return AppShadows(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  ThemeExtension<AppShadows> lerp(
    covariant ThemeExtension<AppShadows>? other,
    double t,
  ) {
    if (other is! AppShadows) {
      return this;
    }

    return AppShadows(
      xs: _lerpShadowList(xs, other.xs, t),
      sm: _lerpShadowList(sm, other.sm, t),
      md: _lerpShadowList(md, other.md, t),
      lg: _lerpShadowList(lg, other.lg, t),
      xl: _lerpShadowList(xl, other.xl, t),
      xxl: _lerpShadowList(xxl, other.xxl, t),
    );
  }

  /// Lerp between two lists of box shadows
  List<BoxShadow> _lerpShadowList(
    List<BoxShadow> a,
    List<BoxShadow> b,
    double t,
  ) {
    final length = a.length > b.length ? a.length : b.length;
    return List.generate(length, (index) {
      final shadowA = index < a.length ? a[index] : null;
      final shadowB = index < b.length ? b[index] : null;
      return BoxShadow.lerp(shadowA, shadowB, t) ?? const BoxShadow();
    });
  }
}
