import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A circular icon-only button with press animations and loading state support.
///
/// Designed to complement [MainButton] while providing a more compact action
/// area for icon-based interactions such as FAB alternatives or contextual
/// actions.
class CircularButton extends StatefulWidget {
  const CircularButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
    this.iconSize = 20,
    this.isDisabled = false,
    this.isLoading = false,
    this.backgroundColor,
    this.iconColor,
  });

  /// Icon displayed at the center of the button.
  final IconData icon;

  /// Callback executed when the button is pressed.
  final VoidCallback? onPressed;

  /// Optional diameter override for the button.
  final double? size;

  /// Icon size when rendered inside the button.
  final double iconSize;

  /// Disables the button and applies disabled styles when true.
  final bool isDisabled;

  /// Shows a loading indicator and prevents interaction when true.
  final bool isLoading;

  /// Optional override for the button background color.
  final Color? backgroundColor;

  /// Optional override for the icon (or loader) color.
  final Color? iconColor;

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.reverse();
    }
  }

  void _handleTapCancel() {
    if (!widget.isDisabled && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDisabled = widget.isDisabled || widget.isLoading;
    final effectiveSize =
        widget.size ?? context.spacing.s48 - context.spacing.s4;

    Color backgroundColor;
    Color iconColor;

    if (effectiveDisabled) {
      backgroundColor =
          widget.backgroundColor?.withValues(alpha: 0.5) ??
          context.colors.backgroundGreyTwo;
      iconColor =
          widget.iconColor?.withValues(alpha: 0.5) ??
          context.colors.textDisabled;
    } else {
      backgroundColor = widget.backgroundColor ?? context.colors.backgroundGrey;
      iconColor = widget.iconColor ?? context.colors.textPrimary;
    }

    const shape = CircleBorder();

    return SizedBox(
      height: effectiveSize,
      width: effectiveSize,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: ShapeDecoration(shape: shape, color: backgroundColor),
          child: Material(
            color: Colors.transparent,
            shape: shape,
            child: InkWell(
              customBorder: shape,
              onTap: effectiveDisabled ? null : widget.onPressed,
              onTapDown: effectiveDisabled ? null : _handleTapDown,
              onTapUp: effectiveDisabled ? null : _handleTapUp,
              onTapCancel: effectiveDisabled ? null : _handleTapCancel,
              child: Center(
                child: widget.isLoading
                    ? SizedBox(
                        width: widget.iconSize,
                        height: widget.iconSize,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                        ),
                      )
                    : Icon(
                        widget.icon,
                        color: iconColor,
                        size: widget.iconSize,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
