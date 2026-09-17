import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Silhouette of the bottom navigation bar: a square-edged panel whose top edge
/// dips into a U-shaped notch for the centred CTA button.
///
/// The notch is a circular arc of [notchRadius] centred [notchRise] *above* the
/// top edge, so a circular button laid out concentric with that centre keeps an
/// even ring of clearance all the way round. Two convex fillet arcs of
/// [filletRadius] blend the notch back into the flat edge; their centres are
/// solved for so every arc meets its neighbour at an exact tangent and the
/// outline reads as one continuous curve.
///
/// The whole outline stays inside the rect — the flat edge sits on `rect.top`
/// and the notch cuts down from it. The button overhangs the panel, so the bar
/// reserves that headroom in its own layout.
@immutable
class NotchedBarShape extends ShapeBorder {
  const NotchedBarShape({
    required this.notchRadius,
    required this.notchRise,
    required this.filletRadius,
    this.side = BorderSide.none,
  }) : assert(notchRise >= 0, 'A notch centred below the edge would undercut the panel.'),
       assert(notchRise <= notchRadius, 'A notch riding above its own radius never cuts the edge.');

  /// Radius of the circle the notch is an arc of.
  final double notchRadius;

  /// How far the notch's centre sits above the flat part of the top edge.
  ///
  /// The notch therefore cuts `notchRadius - notchRise` into the panel: at 0 it
  /// is a full half circle, and raising it makes the cut shallower and wider.
  final double notchRise;

  /// Radius of the convex arcs blending the notch back into the flat edge.
  final double filletRadius;

  /// Outline stroked along the silhouette. Shadows go transparent in dark mode,
  /// so the bar relies on this to stay separated from the content behind it.
  final BorderSide side;

  /// Half the horizontal span the notch and its fillets occupy, measured from
  /// the centre to where the edge goes flat again.
  double get halfSpan {
    final gap = notchRadius + filletRadius;
    final rise = filletRadius + notchRise;
    return math.sqrt(math.max(gap * gap - rise * rise, 0));
  }

  /// How far the deepest point of the notch sits below the flat top edge.
  double get notchDepth => notchRadius - notchRise;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.strokeInset);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // Centre of the notch's circle, lifted out of the panel so only the lower
    // cap of it bites into the edge.
    final centre = Offset(rect.center.dx, rect.top - notchRise);
    final gap = notchRadius + filletRadius;

    // Fillet centres hang `filletRadius` below the flat edge — which makes each
    // fillet tangent to it — and are externally tangent to the notch, which
    // pins them to a single horizontal offset.
    final leftFillet = Offset(centre.dx - halfSpan, rect.top + filletRadius);
    final rightFillet = Offset(centre.dx + halfSpan, rect.top + filletRadius);

    // Where each fillet touches the notch: along the line joining the centres.
    final leftTouch = leftFillet + (centre - leftFillet) * (filletRadius / gap);
    final rightTouch = rightFillet + (centre - rightFillet) * (filletRadius / gap);

    // Straight up from a fillet's centre — where it meets the flat edge.
    const flatTouchFromFillet = -math.pi / 2;

    return Path()
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top)
      ..lineTo(leftFillet.dx, rect.top)
      // Convex lead-in: the edge rolls off the flat top and turns downward.
      ..arcTo(
        Rect.fromCircle(center: leftFillet, radius: filletRadius),
        flatTouchFromFillet,
        _positiveSweep(_angle(leftFillet, leftTouch) - flatTouchFromFillet),
        false,
      )
      // The notch itself, swept the other way round through its lowest point.
      ..arcTo(
        Rect.fromCircle(center: centre, radius: notchRadius),
        _angle(centre, leftTouch),
        _negativeSweep(_angle(centre, rightTouch) - _angle(centre, leftTouch)),
        false,
      )
      // Mirror of the lead-in, settling back onto the flat top.
      ..arcTo(
        Rect.fromCircle(center: rightFillet, radius: filletRadius),
        _angle(rightFillet, rightTouch),
        _positiveSweep(flatTouchFromFillet - _angle(rightFillet, rightTouch)),
        false,
      )
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom)
      ..close();
  }

  static double _angle(Offset from, Offset to) => math.atan2(to.dy - from.dy, to.dx - from.dx);

  /// Endpoint angles come from `atan2`, so a sweep between two of them can come
  /// back wound the wrong way. These pick the winding that keeps the outline
  /// travelling left to right: convex where the fillets are, concave over the
  /// notch.
  static double _positiveSweep(double sweep) => sweep <= 0 ? sweep + 2 * math.pi : sweep;

  static double _negativeSweep(double sweep) => sweep >= 0 ? sweep - 2 * math.pi : sweep;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none || side.width == 0) return;
    canvas.drawPath(
      getOuterPath(rect.deflate(side.strokeInset), textDirection: textDirection),
      side.toPaint(),
    );
  }

  @override
  ShapeBorder scale(double t) => NotchedBarShape(
    notchRadius: notchRadius * t,
    notchRise: notchRise * t,
    filletRadius: filletRadius * t,
    side: side.scale(t),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotchedBarShape &&
          other.notchRadius == notchRadius &&
          other.notchRise == notchRise &&
          other.filletRadius == filletRadius &&
          other.side == side;

  @override
  int get hashCode => Object.hash(notchRadius, notchRise, filletRadius, side);
}
