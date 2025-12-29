import 'package:flutter/material.dart';

/// A widget that provides a consistent tappable behavior with scale animation
/// and ink splash effects using superellipse borders.
///
/// This widget encapsulates the common pattern used across buttons, checkboxes,
/// and other tappable elements in the app. It handles:
/// - Scale animation on press
/// - Material ink splash effects
/// - Disabled state handling
/// - Superellipse border shape
///
/// Example:
/// ```dart
/// TappableScale(
///   onTap: () => doSomething(),
///   scaleEnd: 0.96,
///   borderRadius: BorderRadius.circular(12),
///   child: Container(
///     padding: EdgeInsets.all(16),
///     child: Text('Tap me'),
///   ),
/// )
/// ```
class TappableScale extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// Callback when the widget is tapped.
  /// If null, the widget will be treated as disabled.
  final VoidCallback? onTap;

  /// Whether the widget is disabled.
  /// When true, tap events are ignored and the scale animation is disabled.
  final bool isDisabled;

  /// The scale value when pressed (1.0 = no scale, 0.9 = 90% size).
  /// Defaults to 0.96.
  final double scaleEnd;

  /// The duration of the scale animation.
  /// Defaults to 100ms.
  final Duration animationDuration;

  /// The curve used for the scale animation.
  /// Defaults to [Curves.easeInOut].
  final Curve animationCurve;

  /// The border radius for the superellipse shape.
  /// Defaults to 8.0.
  final BorderRadius borderRadius;

  /// Optional border side for the shape.
  final BorderSide? borderSide;

  /// Background color for the Material widget.
  /// Defaults to transparent.
  final Color? backgroundColor;

  /// The splash color for the ink effect.
  /// If null, uses the default theme splash color.
  final Color? splashColor;

  /// The highlight color for the ink effect.
  /// If null, uses the default theme highlight color.
  final Color? highlightColor;

  const TappableScale({
    super.key,
    required this.child,
    this.onTap,
    this.isDisabled = false,
    this.scaleEnd = 0.96,
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.easeInOut,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderSide,
    this.backgroundColor,
    this.splashColor,
    this.highlightColor,
  });

  @override
  State<TappableScale> createState() => _TappableScaleState();
}

class _TappableScaleState extends State<TappableScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  bool get _effectiveDisabled => widget.isDisabled || widget.onTap == null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleEnd).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurve),
    );
  }

  @override
  void didUpdateWidget(covariant TappableScale oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scaleEnd != widget.scaleEnd ||
        oldWidget.animationCurve != widget.animationCurve) {
      _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleEnd).animate(
        CurvedAnimation(parent: _controller, curve: widget.animationCurve),
      );
    }
    if (oldWidget.animationDuration != widget.animationDuration) {
      _controller.duration = widget.animationDuration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!_effectiveDisabled) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!_effectiveDisabled) {
      _controller.reverse();
    }
  }

  void _handleTapCancel() {
    if (!_effectiveDisabled) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final shape = RoundedSuperellipseBorder(
      borderRadius: widget.borderRadius,
      side: widget.borderSide ?? BorderSide.none,
    );

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        color: widget.backgroundColor ?? Colors.transparent,
        shape: shape,
        child: InkWell(
          customBorder: shape,
          onTap: _effectiveDisabled ? null : widget.onTap,
          onTapDown: _effectiveDisabled ? null : _handleTapDown,
          onTapUp: _effectiveDisabled ? null : _handleTapUp,
          onTapCancel: _effectiveDisabled ? null : _handleTapCancel,
          splashColor: widget.splashColor,
          highlightColor: widget.highlightColor,
          child: widget.child,
        ),
      ),
    );
  }
}
