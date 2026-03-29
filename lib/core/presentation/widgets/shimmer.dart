import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A highly reusable shimmer loading placeholder.
///
/// Wraps a [child] with a repeating shimmer animation using `flutter_animate`.
///
/// ### Basic usage
/// ```dart
/// Shimmer(
///   child: Container(
///     width: 200,
///     height: 48,
///     decoration: ShapeDecoration(
///       color: context.colors.backgroundGrey,
///       shape: RoundedSuperellipseBorder(
///         borderRadius: BorderRadius.circular(8),
///       ),
///     ),
///   ),
/// )
/// ```
///
/// ### ShimmerBox — a convenience widget
/// ```dart
/// ShimmerBox(width: 120, height: 16, borderRadius: 4)
/// ```
///
/// ### Composing detailed shimmer placeholders
/// Use a [Stack] of [ShimmerBox] widgets with [Shimmer] applied at the
/// top-level container to get a single unified shimmer sweep:
/// ```dart
/// Shimmer(
///   child: Stack(
///     children: [
///       // base container
///       ShimmerBox(width: 300, height: 100, borderRadius: 12),
///       // darker detail placeholders
///       Positioned(left: 16, top: 16, child: ShimmerBox.dark(width: 80, height: 12)),
///       Positioned(left: 16, top: 36, child: ShimmerBox.dark(width: 140, height: 10)),
///     ],
///   ),
/// )
/// ```
class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1200),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onComplete: (controller) {
        controller.reset();
        controller.forward();
      },
      effects: [
        ShimmerEffect(
          duration: duration,
          color: context.colors.backgroundGrey.withValues(alpha: 0.7),
        ),
      ],
      child: child,
    );
  }
}

/// A pre-styled shimmer placeholder box.
///
/// Use [ShimmerBox] for the base container shape, and [ShimmerBox.dark]
/// for darker detail placeholders (text lines, icons) layered on top.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.color,
  });

  /// Creates a darker placeholder for detail elements (text, icons).
  const ShimmerBox.dark({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 4.0,
  }) : color = const Color(0x18000000);

  final double? width;
  final double? height;
  final double borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color ?? context.colors.backgroundGreyTwo,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
