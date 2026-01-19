import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Base configuration for animated switcher transitions.
sealed class MainAnimatedSwitcherConfig {
  const MainAnimatedSwitcherConfig();

  /// Builds the transition widget for the given animation and child.
  Widget buildTransition(Widget childAnimation, Animation<double> animation);
}

/// Configuration for blur/fade/rotate transition effects.
class BlurFadeRotateTransitionConfig extends MainAnimatedSwitcherConfig {
  const BlurFadeRotateTransitionConfig({
    this.blurSigma = 8,
    this.fadeBegin = 0,
    this.fadeEnd = 1,
    this.rotationTurns = -0.02,
    this.rotationAlignment = Alignment.center,
    this.fadeCurve,
    this.blurCurve,
    this.rotateCurve,
  });

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
  Widget buildTransition(Widget childAnimation, Animation<double> animation) {
    return _BlurFadeRotateTransition(
      animation: animation,
      config: this,
      child: childAnimation,
    );
  }
}

/// Configuration for scale/fade transition effects.
class ScaleFadeTransitionConfig extends MainAnimatedSwitcherConfig {
  const ScaleFadeTransitionConfig({
    this.scaleBegin = 0.0,
    this.scaleEnd = 1.0,
    this.fadeBegin = 0.0,
    this.fadeEnd = 1.0,
    this.scaleAlignment = Alignment.center,
  });

  /// Starting scale value.
  final double scaleBegin;

  /// Ending scale value.
  final double scaleEnd;

  /// Starting opacity for the fade effect.
  final double fadeBegin;

  /// Ending opacity for the fade effect.
  final double fadeEnd;

  /// Alignment point for the scale pivot.
  final Alignment scaleAlignment;

  @override
  Widget buildTransition(Widget childAnimation, Animation<double> animation) {
    return _ScaleFadeTransition(
      animation: animation,
      config: this,
      child: childAnimation,
    );
  }
}

/// A drop-in replacement for [AnimatedSwitcher] that wires in a
/// [flutter_animate](https://pub.dev/packages/flutter_animate) transition.
///
/// Use the default constructor [MainAnimatedSwitcher.blurFadeRotate] for a blur,
/// fade, and subtle rotation effect, or [MainAnimatedSwitcher.scaleFade] for a
/// scale and fade effect.
class MainAnimatedSwitcher extends StatelessWidget {
  /// Creates an animated switcher with the specified transition configuration.
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
    required this.config,
  });

  /// Creates an animated switcher with blur, fade, and rotation effects.
  ///
  /// This is the default transition that mixes a blur, fade, and subtle rotation.
  const MainAnimatedSwitcher.blurFadeRotate({
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
    BlurFadeRotateTransitionConfig blurFadeRotateConfig = const BlurFadeRotateTransitionConfig(),
  }) : config = blurFadeRotateConfig;

  /// Creates an animated switcher with scale and fade effects.
  ///
  /// This transition combines a scale animation with a fade animation for a
  /// smooth zoom-in/out effect.
  const MainAnimatedSwitcher.scaleFade({
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
    ScaleFadeTransitionConfig scaleFadeConfig = const ScaleFadeTransitionConfig(),
  }) : config = scaleFadeConfig;

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
  /// transition based on the factory used will be applied.
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  /// Alignment applied around the internal switcher to mimic
  /// [AnimatedSwitcher.alignment].
  final AlignmentGeometry alignment;

  /// Clip applied around the internal switcher to mimic
  /// [AnimatedSwitcher.clipBehavior].
  final Clip clipBehavior;

  /// Configuration for the transition effect.
  final MainAnimatedSwitcherConfig config;

  @override
  Widget build(BuildContext context) {
    Widget result = AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      layoutBuilder: layoutBuilder,
      transitionBuilder: transitionBuilder ?? config.buildTransition,
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
}

// =============================================================================
// Blur/Fade/Rotate Transition
// =============================================================================

class _BlurFadeRotateTransition extends StatefulWidget {
  const _BlurFadeRotateTransition({
    required this.animation,
    required this.config,
    required this.child,
  });

  final Animation<double> animation;
  final BlurFadeRotateTransitionConfig config;
  final Widget child;

  @override
  State<_BlurFadeRotateTransition> createState() => _BlurFadeRotateTransitionState();
}

class _BlurFadeRotateTransitionState extends State<_BlurFadeRotateTransition> {
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
  void didUpdateWidget(covariant _BlurFadeRotateTransition oldWidget) {
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
    final config = widget.config;
    final effects = <Effect<dynamic>>[
      FadeEffect(
        begin: config.fadeBegin,
        end: config.fadeEnd,
        curve: config.fadeCurve,
      ),
      if (config.blurSigma > 0)
        BlurEffect(
          begin: Offset(config.blurSigma, config.blurSigma),
          end: Offset.zero,
          curve: config.blurCurve,
        ),
      if (config.rotationTurns != 0)
        RotateEffect(
          begin: config.rotationTurns,
          end: 0,
          alignment: config.rotationAlignment,
          curve: config.rotateCurve,
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

// =============================================================================
// Scale/Fade Transition
// =============================================================================

class _ScaleFadeTransition extends StatelessWidget {
  const _ScaleFadeTransition({
    required this.animation,
    required this.config,
    required this.child,
  });

  final Animation<double> animation;
  final ScaleFadeTransitionConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scaleAnimation = Tween<double>(
      begin: config.scaleBegin,
      end: config.scaleEnd,
    ).animate(animation);

    final fadeAnimation = Tween<double>(
      begin: config.fadeBegin,
      end: config.fadeEnd,
    ).animate(animation);

    return ScaleTransition(
      scale: scaleAnimation,
      alignment: config.scaleAlignment,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: child,
      ),
    );
  }
}
