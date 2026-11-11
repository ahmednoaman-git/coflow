import 'package:flutter/material.dart';

/// Outline of [CoflowBottomNavBar]'s panel: a flat top edge with a bowl dipped
/// into its centre for the floating home button.
///
/// The bowl is the Figma "Nav Bar" component's own path (two cubics per side),
/// taken at the component's native 360-wide scale. The design file's right
/// half carries a small drawing kink, so both halves mirror its clean left
/// half.
///
/// The flat edge sits on `rect.top` and the bowl cuts [notchDepth] down from
/// it, centred on `rect.center.dx`. Below the top edge it is a plain rectangle.
@immutable
class CoflowNavBarShape extends ShapeBorder {
  const CoflowNavBarShape({this.side = BorderSide.none});

  /// Stroked along the top edge only — the sides and bottom run off-screen.
  /// It is the bar's separation in dark mode, where shadows are off.
  final BorderSide side;

  /// How far the bottom of the bowl sits below the flat edge.
  static const double notchDepth = 36.942;

  /// Distance from the centre to where the bowl leaves the flat edge.
  static const double notchHalfWidth = 55.453;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(top: side.strokeInset);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => getOuterPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path()..moveTo(rect.left, rect.bottom);
    _addTopEdge(path, rect);
    return path
      ..lineTo(rect.right, rect.bottom)
      ..close();
  }

  /// Traces the top edge left to right, starting with a line to its top-left
  /// corner.
  static void _addTopEdge(Path path, Rect rect) {
    final cx = rect.center.dx;
    final top = rect.top;

    // Points of the left half, as offsets from (centre, flat edge). The right
    // half runs through the same points mirrored, in reverse order.
    Offset l(double dx, double dy) => Offset(cx + dx, top + dy);
    Offset r(double dx, double dy) => Offset(cx - dx, top + dy);

    void cubic(Offset c1, Offset c2, Offset end) =>
        path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, end.dx, end.dy);

    path
      ..lineTo(rect.left, top)
      ..lineTo(cx - notchHalfWidth, top);
    // Shoulder rolling off the flat edge, then the bowl to its lowest point.
    cubic(l(-45.927, 0), l(-37.462, 5.650), l(-34.422, 14.039));
    cubic(l(-29.600, 27.351), l(-16.011, notchDepth), l(0, notchDepth));
    // Back up the mirrored side.
    cubic(r(-16.011, notchDepth), r(-29.600, 27.351), r(-34.422, 14.039));
    cubic(r(-37.462, 5.650), r(-45.927, 0), r(-notchHalfWidth, 0));
    path.lineTo(rect.right, top);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none || side.width == 0) return;
    final edge = Path()..moveTo(rect.left, rect.top + side.strokeInset);
    _addTopEdge(
      edge,
      Rect.fromLTRB(rect.left, rect.top + side.strokeInset, rect.right, rect.bottom),
    );
    canvas.drawPath(edge, side.toPaint());
  }

  @override
  ShapeBorder scale(double t) => CoflowNavBarShape(side: side.scale(t));

  @override
  bool operator ==(Object other) => other is CoflowNavBarShape && other.side == side;

  @override
  int get hashCode => side.hashCode;
}
