import 'dart:ui' as ui;

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// How a bone stands out from what's behind it.
enum SkeletonTone {
  /// For bones on a card or the screen background — the usual case.
  base,

  /// A step stronger, for bones drawn on top of a [base] bone, such as the
  /// logo and caption over a placeholder cover image.
  strong,
}

/// A rounded-rectangle bone, for images, covers, icons and blocks.
///
/// Leave [width] or [height] null to fill that axis of the incoming
/// constraints.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    this.width,
    this.height,
    this.radius = 8,
    this.tone = SkeletonTone.base,
  });

  final double? width;
  final double? height;
  final double radius;
  final SkeletonTone tone;

  @override
  Widget build(BuildContext context) => _Bone(
    width: width,
    height: height,
    tone: tone,
    shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(radius)),
  );
}

/// A round bone, for avatars and logos.
class SkeletonCircle extends StatelessWidget {
  const SkeletonCircle({super.key, required this.size, this.tone = SkeletonTone.base});

  final double size;
  final SkeletonTone tone;

  @override
  Widget build(BuildContext context) =>
      _Bone(width: size, height: size, tone: tone, shape: const CircleBorder());
}

/// Stands in for [lines] lines of text set in [style].
///
/// Each line takes exactly the height the real text would, measured from
/// [style] and the ambient text scale, with a bar the size of the glyphs in
/// it — so the text lands where its bones were.
///
/// Size a line with a fixed [width], or a [widthFactor] of the space it gets;
/// the last of several lines is shortened to [lastLineWidthFactor] of that.
class SkeletonText extends StatelessWidget {
  const SkeletonText({
    super.key,
    required this.style,
    this.width,
    this.widthFactor = 1,
    this.lines = 1,
    this.lastLineWidthFactor = 0.6,
    this.alignment = AlignmentDirectional.centerStart,
    this.tone = SkeletonTone.base,
  }) : assert(lines > 0);

  final TextStyle style;
  final double? width;
  final double widthFactor;
  final int lines;
  final double lastLineWidthFactor;
  final AlignmentGeometry alignment;
  final SkeletonTone tone;

  /// Height of one line of [style] as laid out here.
  static double lineHeightOf(BuildContext context, TextStyle style) {
    final painter = TextPainter(
      text: TextSpan(text: 'Hg', style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: 1,
    )..layout();
    final height = painter.height;
    painter.dispose();
    return height;
  }

  @override
  Widget build(BuildContext context) {
    final lineHeight = lineHeightOf(context, style);
    // About the height of the lowercase-to-cap glyphs, not the line box.
    final barHeight = MediaQuery.textScalerOf(context).scale(style.fontSize ?? 14) * 0.7;

    Widget line(double factor) {
      final bar = _Bone(height: barHeight, tone: tone, shape: const StadiumBorder());
      return SizedBox(
        height: lineHeight,
        child: Align(
          alignment: alignment,
          child: width != null
              ? SizedBox(width: width! * factor, child: bar)
              : FractionallySizedBox(widthFactor: widthFactor * factor, child: bar),
        ),
      );
    }

    if (lines == 1) return line(1);
    return Column(
      mainAxisSize: .min,
      children: [
        for (var index = 0; index < lines; index++)
          line(index == lines - 1 ? lastLineWidthFactor : 1),
      ],
    );
  }
}

/// A pill-shaped bone the size of a chip whose label is [labelWidth] wide in
/// [style], with [padding] around it — tags, filters, badges.
class SkeletonChip extends StatelessWidget {
  const SkeletonChip({
    super.key,
    required this.style,
    required this.labelWidth,
    required this.padding,
    this.tone = SkeletonTone.base,
  });

  final TextStyle style;
  final double labelWidth;
  final EdgeInsets padding;
  final SkeletonTone tone;

  @override
  Widget build(BuildContext context) => _Bone(
    width: labelWidth + padding.horizontal,
    height: SkeletonText.lineHeightOf(context, style) + padding.vertical,
    tone: tone,
    shape: const StadiumBorder(),
  );
}

class _Bone extends LeafRenderObjectWidget {
  const _Bone({this.width, this.height, required this.tone, required this.shape});

  final double? width;
  final double? height;
  final SkeletonTone tone;
  final ShapeBorder shape;

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderBone(
    width: width,
    height: height,
    shape: shape,
    colors: _boneColors(context, tone),
    sweep: Skeleton.maybeOf(context),
    screenWidth: MediaQuery.sizeOf(context).width,
    textDirection: Directionality.of(context),
  );

  @override
  void updateRenderObject(BuildContext context, _RenderBone renderObject) => renderObject
    ..width = width
    ..height = height
    ..shape = shape
    ..colors = _boneColors(context, tone)
    ..sweep = Skeleton.maybeOf(context)
    ..screenWidth = MediaQuery.sizeOf(context).width
    ..textDirection = Directionality.of(context);
}

typedef _BoneColors = ({Color fill, Color highlight});

_BoneColors _boneColors(BuildContext context, SkeletonTone tone) {
  final colors = context.colors;
  final base = colors.backgroundGreyTwo;
  final fill = switch (tone) {
    .base => base,
    // Nudged towards the text colour: darker on light, lighter on dark.
    .strong => Color.alphaBlend(colors.textPrimary.withValues(alpha: 0.07), base),
  };
  // The band reads against the fill whichever way the theme runs.
  return (fill: fill, highlight: Color.lerp(fill, colors.backgroundWhite, 0.6)!);
}

class _RenderBone extends RenderBox {
  _RenderBone({
    double? width,
    double? height,
    required ShapeBorder shape,
    required _BoneColors colors,
    required Animation<double>? sweep,
    required double screenWidth,
    required TextDirection textDirection,
  }) : _width = width,
       _height = height,
       _shape = shape,
       _colors = colors,
       _sweep = sweep,
       _screenWidth = screenWidth,
       _textDirection = textDirection;

  double? _width;
  set width(double? value) {
    if (value == _width) return;
    _width = value;
    markNeedsLayout();
  }

  double? _height;
  set height(double? value) {
    if (value == _height) return;
    _height = value;
    markNeedsLayout();
  }

  ShapeBorder _shape;
  set shape(ShapeBorder value) {
    if (value == _shape) return;
    _shape = value;
    markNeedsPaint();
  }

  _BoneColors _colors;
  set colors(_BoneColors value) {
    if (value == _colors) return;
    _colors = value;
    markNeedsPaint();
  }

  Animation<double>? _sweep;
  set sweep(Animation<double>? value) {
    if (value == _sweep) return;
    if (attached) _sweep?.removeListener(markNeedsPaint);
    _sweep = value;
    if (attached) _sweep?.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  double _screenWidth;
  set screenWidth(double value) {
    if (value == _screenWidth) return;
    _screenWidth = value;
    markNeedsPaint();
  }

  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (value == _textDirection) return;
    _textDirection = value;
    markNeedsPaint();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _sweep?.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _sweep?.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    double resolve(double? wanted, double max) => wanted ?? (max.isFinite ? max : 0);
    return constraints.constrain(
      Size(resolve(_width, constraints.maxWidth), resolve(_height, constraints.maxHeight)),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (size.isEmpty) return;
    final paint = Paint()..color = _colors.fill;

    if (_sweep case final sweep?) {
      // The band runs across the whole screen, not this bone, so every bone
      // is lit by the same band as it passes.
      const band = 120.0;
      final progress = _textDirection == .rtl ? 1 - sweep.value : sweep.value;
      final centre = ui.lerpDouble(-band, _screenWidth + band, progress)!;
      // Screen coordinates to this layer's.
      final shift = offset - localToGlobal(Offset.zero);
      const tilt = Offset(0, band * 0.35);
      paint.shader = ui.Gradient.linear(
        Offset(centre - band, 0) - tilt + shift,
        Offset(centre + band, 0) + tilt + shift,
        [_colors.fill, _colors.highlight, _colors.fill],
        const [0, 0.5, 1],
      );
    }

    context.canvas.drawPath(_shape.getOuterPath(offset & size), paint);
  }

  @override
  double computeMinIntrinsicWidth(double height) => _width ?? 0;
  @override
  double computeMaxIntrinsicWidth(double height) => _width ?? 0;
  @override
  double computeMinIntrinsicHeight(double width) => _height ?? 0;
  @override
  double computeMaxIntrinsicHeight(double width) => _height ?? 0;

  @override
  bool hitTestSelf(Offset position) => false;
}
