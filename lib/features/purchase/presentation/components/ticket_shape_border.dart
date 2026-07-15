import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A rounded-superellipse card outline with two semicircular notches cut into
/// its left and right edges at [notchCenterY] (measured from the shape's top).
///
/// Because the notches are part of the shape itself, the fill, the [side]
/// stroke and any [ShapeDecoration.shadows] all follow the notched outline:
/// the notches read as transparent "bites" out of the ticket, with the shadow
/// wrapping their curves — instead of being opaque circles painted on top.
///
/// When [notchCenterY] is null the outline is a plain rounded superellipse
/// (used for the first frame, before the tear line has been measured).
class TicketShapeBorder extends OutlinedBorder {
  const TicketShapeBorder({
    super.side = BorderSide.none,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.notchRadius = 16,
    this.notchCenterY,
  });

  final BorderRadius borderRadius;
  final double notchRadius;
  final double? notchCenterY;

  Path _basePath(Rect rect, {required double notchInset}) {
    final base = RoundedSuperellipseBorder(borderRadius: borderRadius).getOuterPath(rect);

    final cy = notchCenterY;
    if (cy == null) return base;

    final radius = math.max(0.0, notchRadius - notchInset);
    final center = rect.top + cy;
    final leftNotch = Path()
      ..addOval(Rect.fromCircle(center: Offset(rect.left, center), radius: radius));
    final rightNotch = Path()
      ..addOval(Rect.fromCircle(center: Offset(rect.right, center), radius: radius));

    return Path.combine(
      PathOperation.difference,
      Path.combine(PathOperation.difference, base, leftNotch),
      rightNotch,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => _basePath(rect, notchInset: 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      _basePath(rect.deflate(side.width), notchInset: side.width);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none || side.width == 0) return;

    final outer = getOuterPath(rect, textDirection: textDirection);
    // Draw the stroke at double width and clip to the outline so only the inner
    // half remains — an inside-aligned stroke that hugs the notch curves.
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = side.color
      ..strokeWidth = side.width * 2;

    canvas.save();
    canvas.clipPath(outer);
    canvas.drawPath(outer, paint);
    canvas.restore();
  }

  @override
  TicketShapeBorder copyWith({
    BorderSide? side,
    BorderRadius? borderRadius,
    double? notchRadius,
    double? notchCenterY,
  }) {
    return TicketShapeBorder(
      side: side ?? this.side,
      borderRadius: borderRadius ?? this.borderRadius,
      notchRadius: notchRadius ?? this.notchRadius,
      notchCenterY: notchCenterY ?? this.notchCenterY,
    );
  }

  @override
  ShapeBorder scale(double t) => TicketShapeBorder(
    side: side.scale(t),
    borderRadius: borderRadius * t,
    notchRadius: notchRadius * t,
    notchCenterY: notchCenterY == null ? null : notchCenterY! * t,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TicketShapeBorder &&
        other.side == side &&
        other.borderRadius == borderRadius &&
        other.notchRadius == notchRadius &&
        other.notchCenterY == notchCenterY;
  }

  @override
  int get hashCode => Object.hash(side, borderRadius, notchRadius, notchCenterY);
}
