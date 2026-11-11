import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// The Coflow logo drawn as strokes, so its lines can grow into the mark and
/// its parts can move on their own.
///
/// `assets/svgs/logo.svg` is four filled outlines of constant thickness, and
/// each one is redrawn here as a single stroke along its centreline:
///
/// 1. the outer "C", from its top-right tip round the left to the bottom-right,
/// 2. the short arc that closes the C on the right,
/// 3. the inner ring,
/// 4. the leaf inside the ring, hugging its right side.
///
/// All of them travel anticlockwise, so the mark draws as one continuous flow.
///
/// - [progress] runs 0 → 1 over the whole drawing, the strokes staggered
///   across it; 1 is the complete logo.
/// - [outerTurn] rotates the outer pair (C and arc) about their centre, and
///   [innerTurn] the inner pair (ring and leaf) about the ring's, in radians.
/// - [shimmer] sweeps a sheen across the lines, 0 → 1 from the top-left to the
///   bottom-right; `null` for none.
/// - [scale] grows or shrinks the mark about its centre.
class DrawnLogo extends StatelessWidget {
  const DrawnLogo({
    super.key,
    this.progress = 1,
    this.outerTurn = 0,
    this.innerTurn = 0,
    this.shimmer,
    this.scale = 1,
    this.size = 32,
  });

  final double progress;
  final double outerTurn;
  final double innerTurn;
  final double? shimmer;
  final double scale;

  /// Width and height of the square the mark is drawn into, at [scale] 1.
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _DrawnLogoPainter(
        progress: progress,
        outerTurn: outerTurn,
        innerTurn: innerTurn,
        shimmer: shimmer,
        scale: scale,
      ),
    );
  }
}

class _DrawnLogoPainter extends CustomPainter {
  const _DrawnLogoPainter({
    required this.progress,
    required this.outerTurn,
    required this.innerTurn,
    required this.shimmer,
    required this.scale,
  });

  final double progress;
  final double outerTurn;
  final double innerTurn;
  final double? shimmer;
  final double scale;

  @override
  void paint(Canvas canvas, Size size) {
    const viewBox = _LogoStroke.viewBox;
    final centre = size.center(Offset.zero);

    canvas.save();
    canvas
      ..translate(centre.dx, centre.dy)
      ..scale(scale * size.width / viewBox, scale * size.height / viewBox)
      ..translate(-viewBox / 2, -viewBox / 2);

    final shimmer = this.shimmer;
    final shimmering = shimmer != null && shimmer > 0 && shimmer < 1;
    // The sheen is composited onto the lines alone, so it needs them on a
    // layer of their own.
    if (shimmering) canvas.saveLayer(_bounds, Paint());

    for (final stroke in _LogoStroke.all) {
      final turn = stroke.outer ? outerTurn : innerTurn;
      canvas.save();
      if (turn != 0) {
        canvas
          ..translate(stroke.pivot.dx, stroke.pivot.dy)
          ..rotate(turn)
          ..translate(-stroke.pivot.dx, -stroke.pivot.dy);
      }
      stroke.paintUpTo(canvas, stroke.local(progress));
      canvas.restore();
    }

    if (shimmering) {
      _paintSheen(canvas, shimmer);
      canvas.restore();
    }
    canvas.restore();
  }

  /// A soft diagonal band of light, from beyond the top-left corner to beyond
  /// the bottom-right as [t] goes 0 → 1.
  void _paintSheen(Canvas canvas, double t) {
    const viewBox = _LogoStroke.viewBox;
    const direction = Offset(0.8, 0.6); // unit length
    const halfWidth = viewBox * 0.28;
    const travel = viewBox * 0.7 + halfWidth;
    final centre = const Offset(viewBox / 2, viewBox / 2) + direction * (travel * (t * 2 - 1));

    canvas.drawRect(
      _bounds,
      Paint()
        ..blendMode = BlendMode.srcATop
        ..shader = ui.Gradient.linear(
          centre - direction * halfWidth,
          centre + direction * halfWidth,
          [
            _sheen.withValues(alpha: 0),
            _sheen.withValues(alpha: 0.85),
            _sheen.withValues(alpha: 0),
          ],
          const [0, 0.5, 1],
        ),
    );
  }

  /// Room for the rotated strokes, which reach a little past the view box.
  static final _bounds = const Offset(-2, -2) & const Size.square(_LogoStroke.viewBox + 4);

  /// The light of the sheen — part of the mark's artwork, not the theme.
  static const _sheen = Color(0xFFFFFFFF);

  @override
  bool shouldRepaint(_DrawnLogoPainter oldDelegate) =>
      progress != oldDelegate.progress ||
      outerTurn != oldDelegate.outerTurn ||
      innerTurn != oldDelegate.innerTurn ||
      shimmer != oldDelegate.shimmer ||
      scale != oldDelegate.scale;
}

/// One line of the mark, in the SVG's 21×21 coordinate space.
class _LogoStroke {
  _LogoStroke({
    required this.path,
    Path? closedPath,
    required this.outer,
    required double gradientFrom,
    required double gradientTo,
    required List<Color> colors,
    required this.begin,
    required this.end,
  }) : closedPath = closedPath ?? path,
       metric = path.computeMetrics().first,
       paint = Paint()
         ..style = PaintingStyle.stroke
         ..strokeWidth = strokeWidth
         ..strokeCap = StrokeCap.butt
         // Gives the leaf its pointed tips, as in the artwork.
         ..strokeJoin = StrokeJoin.miter
         // The artwork's gradients all run left to right in user space.
         ..shader = ui.Gradient.linear(
           Offset(gradientFrom, _centre.dy),
           Offset(gradientTo, _centre.dy),
           colors,
         );

  /// The path the line grows along.
  final Path path;

  /// What is painted once the line is complete. Differs from [path] for the
  /// closed shapes, so the joint where a line meets its own start is seamless.
  final Path closedPath;

  /// Whether this line belongs to the outer pair, which turns as one; the
  /// inner pair turns about the ring's centre.
  final bool outer;

  final ui.PathMetric metric;
  final Paint paint;

  /// Where this line starts and finishes growing, as a fraction of the whole
  /// drawing.
  final double begin;
  final double end;

  Offset get pivot => outer ? _centre : _ringCentre;

  /// Maps a progress through the whole drawing to one along this line.
  double local(double t) =>
      Curves.easeInOut.transform(((t - begin) / (end - begin)).clamp(0.0, 1.0));

  void paintUpTo(Canvas canvas, double t) {
    if (t <= 0) return;
    if (t >= 1) {
      canvas.drawPath(closedPath, paint);
      return;
    }
    canvas.drawPath(metric.extractPath(0, t * metric.length), paint);
  }

  static const double viewBox = 21;

  /// Thickness of every outline in the artwork.
  static const double strokeWidth = 1.584;

  // Brand artwork colours, copied from the logo SVG — part of the mark, not
  // the theme.
  static const _warm = [Color(0xFFDA302B), Color(0xFFFD9E11)];
  static const _cool = [Color(0xFF2FDAC1), Color(0xFF2F9AE8)];

  /// Centre and centreline radius of the outer C and its closing arc.
  static const _centre = Offset(10.5, 10.5);
  static const _outerRadius = 9.2081;

  /// Centre and centreline radius of the inner ring.
  static const _ringCentre = Offset(10.6167, 10.4978);
  static const _ringRadius = 5.3337;

  static double _degrees(double degrees) => degrees * math.pi / 180;

  static final List<_LogoStroke> all = [
    // The C: from its top-right tip, anticlockwise round to the bottom-right.
    _LogoStroke(
      path: Path()
        ..addArc(
          Rect.fromCircle(center: _centre, radius: _outerRadius),
          _degrees(-43.1),
          -_degrees(360 - 43.1 - 41.8),
        ),
      outer: true,
      gradientFrom: 0.5,
      gradientTo: 17.99,
      colors: _warm,
      begin: 0,
      end: 0.55,
    ),
    // The closing arc, carrying on anticlockwise from the bottom.
    _LogoStroke(
      path: Path()
        ..addArc(
          Rect.fromCircle(center: _centre, radius: _outerRadius),
          _degrees(29),
          -_degrees(29 + 30.06),
        ),
      outer: true,
      gradientFrom: 17.73,
      gradientTo: 20.5,
      colors: _warm,
      begin: 0.45,
      end: 0.65,
    ),
    // The ring, two half-turns so it stays one open line to grow along.
    _LogoStroke(
      path: Path()
        ..addArc(
          Rect.fromCircle(center: _ringCentre, radius: _ringRadius),
          _degrees(-45),
          -math.pi,
        )
        ..arcTo(
          Rect.fromCircle(center: _ringCentre, radius: _ringRadius),
          _degrees(-45) - math.pi,
          -math.pi,
          false,
        ),
      closedPath: Path()..addOval(Rect.fromCircle(center: _ringCentre, radius: _ringRadius)),
      outer: false,
      gradientFrom: 4.49,
      gradientTo: 16.74,
      colors: _cool,
      begin: 0.25,
      end: 0.8,
    ),
    // The leaf: from the middle of its left side, down, round and back up.
    // Its control points average the artwork's outer and inner outlines.
    _LogoStroke(
      path: Path()
        ..moveTo(12.6627, 10.4955)
        ..cubicTo(12.6627, 11.7631, 13.5751, 12.9895, 14.5748, 13.9667)
        ..cubicTo(15.4290, 13.0590, 15.9517, 11.8320, 15.9517, 10.4955)
        ..cubicTo(15.9517, 9.1592, 15.4290, 7.9321, 14.5748, 7.0245)
        ..cubicTo(13.5751, 8.0016, 12.6627, 9.2281, 12.6627, 10.4955)
        ..close(),
      outer: false,
      gradientFrom: 11.87,
      gradientTo: 16.74,
      colors: _cool,
      begin: 0.6,
      end: 1,
    ),
  ];
}
