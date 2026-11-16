import 'package:flutter/material.dart';

/// Custom shadow extension for the app theme.
/// Shadows use the shadowColor from AppColors, which is visible in light mode
/// and transparent in dark mode (where borders are used instead).
/// Access shadows via: Theme.of(context).extension<AppShadows>()
/// or use context.shadows extension method
///
/// The scale follows the Figma file, whose shadows are soft and wide: a
/// low-opacity single layer with a large blur, rather than tight stacked
/// layers. [xs] and [sm] are taken straight from the design; the steps above
/// them carry the same recipe further for surfaces that float higher.
@immutable
class AppShadows extends ThemeExtension<AppShadows> {
  /// Barely there — a faint halo and a soft drop. Figma's account stat cards
  /// ("Card Vertical").
  final List<BoxShadow> xs;

  /// The card shadow — cards, chips and tiles resting on the background.
  /// Figma's activity-line chips and facility list cards.
  final List<BoxShadow> sm;

  /// A card lifted a little more — feature cards such as business and ticket
  /// cards.
  final List<BoxShadow> md;

  /// Floating surfaces — the nav bar's home disc, overlays.
  final List<BoxShadow> lg;

  /// Raised panels — dialogs, popovers.
  final List<BoxShadow> xl;

  /// The highest elevation in the app.
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

    BoxShadow soft(double alpha, double y, double blur, {double spread = 0}) => BoxShadow(
      color: shadowColor.withValues(alpha: alpha),
      offset: Offset(0, y),
      blurRadius: blur,
      spreadRadius: spread,
    );

    return AppShadows(
      // Figma "Card Vertical": a 2% drop under a 5% halo.
      xs: [soft(0.02, 3, 15, spread: -1.5), soft(0.05, 0, 3.75)],
      // Figma cards and chips: one wide 10% drop.
      sm: [soft(0.10, 6.5, 18)],
      md: [soft(0.10, 10, 28, spread: -2)],
      lg: [soft(0.12, 14, 40, spread: -4)],
      xl: [soft(0.13, 20, 56, spread: -6)],
      xxl: [soft(0.15, 28, 72, spread: -8)],
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
