import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A drop-in replacement for [AnimatedSwitcher] that wires in a
/// [flutter_animate](https://pub.dev/packages/flutter_animate) transition.
///
/// By default it mixes a blur, fade, and subtle rotation. The effect can be
/// tuned via the provided configuration parameters, while the rest of the API
/// mirrors `AnimatedSwitcher` so existing usages can migrate easily.
class MainAnimatedSwitcher extends StatelessWidget {
  const MainAnimatedSwitcher({
    super.key,
    this.child,
    this.duration = const Duration(milliseconds: 250),
    this.reverseDuration,
    this.switchInCurve = Curves.easeOutCubic,
    this.switchOutCurve = Curves.easeInCubic,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    this.transitionBuilder,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.hardEdge,
    this.blurSigma = 8,
    this.fadeBegin = 0,
    this.fadeEnd = 1,
    this.rotationTurns = -0.02,
    this.rotationAlignment = Alignment.center,
    this.fadeCurve,
    this.blurCurve,
    this.rotateCurve,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// See [AnimatedSwitcher.duration].
  final Duration duration;

  /// See [AnimatedSwitcher.reverseDuration].
  final Duration? reverseDuration;

  /// See [AnimatedSwitcher.switchInCurve].
  final Curve switchInCurve;

  /// See [AnimatedSwitcher.switchOutCurve].
  final Curve switchOutCurve;

  /// See [AnimatedSwitcher.layoutBuilder].
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  /// Optional override for the switch animation builder. When omitted, the
  /// custom blur/fade/rotate mix will be used.
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  /// Alignment applied around the internal switcher to mimic
  /// [AnimatedSwitcher.alignment].
  final AlignmentGeometry alignment;

  /// Clip applied around the internal switcher to mimic
  /// [AnimatedSwitcher.clipBehavior].
  final Clip clipBehavior;

  /// Amount of blur (sigma) to animate from/to.
  final double blurSigma;

  /// Starting opacity for the fade effect.
  final double fadeBegin;

  /// Ending opacity for the fade effect.
  final double fadeEnd;

  /// Starting rotation in turns (1.0 == full revolution).
  final double rotationTurns;

  /// Alignment point for the rotation pivot.
  final Alignment rotationAlignment;

  /// Optional curve override for the fade effect.
  final Curve? fadeCurve;

  /// Optional curve override for the blur effect.
  final Curve? blurCurve;

  /// Optional curve override for the rotate effect.
  final Curve? rotateCurve;

  @override
  Widget build(BuildContext context) {
    Widget result = AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      layoutBuilder: layoutBuilder,
      transitionBuilder: transitionBuilder ?? _defaultTransitionBuilder,
      child: child,
    );

    result = Align(
      alignment: alignment,
      child: result,
    );

    if (clipBehavior != Clip.none) {
      result = ClipRect(
        clipBehavior: clipBehavior,
        child: result,
      );
    }

    return result;
  }

  Widget _defaultTransitionBuilder(Widget child, Animation<double> animation) {
    return _MainAnimateSwitcherTransition(
      animation: animation,
      blurSigma: blurSigma,
      fadeBegin: fadeBegin,
      fadeEnd: fadeEnd,
      rotationTurns: rotationTurns,
      rotationAlignment: rotationAlignment,
      fadeCurve: fadeCurve,
      blurCurve: blurCurve,
      rotateCurve: rotateCurve,
      child: child,
    );
  }
}

class _MainAnimateSwitcherTransition extends StatefulWidget {
  const _MainAnimateSwitcherTransition({
    required this.animation,
    required this.child,
    required this.blurSigma,
    required this.fadeBegin,
    required this.fadeEnd,
    required this.rotationTurns,
    required this.rotationAlignment,
    required this.fadeCurve,
    required this.blurCurve,
    required this.rotateCurve,
  });

  final Animation<double> animation;
  final Widget child;
  final double blurSigma;
  final double fadeBegin;
  final double fadeEnd;
  final double rotationTurns;
  final Alignment rotationAlignment;
  final Curve? fadeCurve;
  final Curve? blurCurve;
  final Curve? rotateCurve;

  @override
  State<_MainAnimateSwitcherTransition> createState() => _MainAnimateSwitcherTransitionState();
}

class _MainAnimateSwitcherTransitionState extends State<_MainAnimateSwitcherTransition> {
  late final ValueAdapter _adapter;
  late final VoidCallback _animationListener;

  @override
  void initState() {
    super.initState();
    _adapter = ValueAdapter(widget.animation.value, animated: false);
    _animationListener = () {
      _adapter.value = widget.animation.value.clamp(0, 1).toDouble();
    };
    widget.animation.addListener(_animationListener);
  }

  @override
  void didUpdateWidget(covariant _MainAnimateSwitcherTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animation != widget.animation) {
      oldWidget.animation.removeListener(_animationListener);
      _adapter.value = widget.animation.value.clamp(0, 1).toDouble();
      widget.animation.addListener(_animationListener);
    }
  }

  @override
  void dispose() {
    widget.animation.removeListener(_animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effects = <Effect<dynamic>>[
      FadeEffect(
        begin: widget.fadeBegin,
        end: widget.fadeEnd,
        curve: widget.fadeCurve,
      ),
      if (widget.blurSigma > 0)
        BlurEffect(
          begin: Offset(widget.blurSigma, widget.blurSigma),
          end: Offset.zero,
          curve: widget.blurCurve,
        ),
      if (widget.rotationTurns != 0)
        RotateEffect(
          begin: widget.rotationTurns,
          end: 0,
          alignment: widget.rotationAlignment,
          curve: widget.rotateCurve,
        ),
    ];

    return Animate(
      adapter: _adapter,
      autoPlay: false,
      effects: effects,
      child: widget.child,
    );
  }
}
