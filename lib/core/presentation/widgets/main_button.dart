import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A custom button widget with iOS-like rounded corners and smooth animations.
///
/// This widget provides a consistent button design across the application
/// with support for loading states, disabled states, and leading/trailing icons.
///
/// Example:
/// ```dart
/// EzButton(
///   text: 'Log In',
///   onPressed: () => login(),
/// )
/// ```
class MainButton extends StatefulWidget {
  /// The text to display on the button
  final String text;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Optional leading icon
  final IconData? leadingIcon;

  /// Optional trailing icon
  final IconData? trailingIcon;

  /// Button height (defaults to 40px to match text field)
  final double? height;

  /// Button width (defaults to expand to available width)
  final double? width;

  /// Background color override (uses theme color by default)
  final Color? backgroundColor;

  /// Text color override (uses theme color by default)
  final Color? textColor;

  const MainButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
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
    final bool effectiveDisabled = widget.isDisabled || widget.isLoading;
    final effectiveHeight = widget.height ?? 45.0;

    // Determine colors based on state
    Color backgroundColor;
    Color contentColor;

    if (effectiveDisabled) {
      backgroundColor =
          widget.backgroundColor?.withValues(alpha: 0.5) ??
          context.colors.backgroundGreyTwo;
      contentColor =
          widget.textColor?.withValues(alpha: 0.5) ??
          context.colors.textDisabled;
    } else {
      backgroundColor = widget.backgroundColor ?? context.colors.signatureBlue;
      contentColor = widget.textColor ?? context.colors.textWhite;
    }

    final shape = RoundedSuperellipseBorder(
      borderRadius: BorderRadius.circular(12.0),
    );

    return ScaleTransition(
      scale: _scaleAnimation,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: effectiveHeight,
        width: widget.width,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
                child: widget.isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            contentColor,
                          ),
                          strokeWidth: 2.0,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: context.spacing.s8,
                        children: [
                          if (widget.leadingIcon != null)
                            Icon(
                              widget.leadingIcon!,
                              color: contentColor,
                              size: 16,
                            ),

                          Text(
                            widget.text,
                            style: context.typography.medium14.withColor(
                              contentColor,
                            ),
                          ),
                          if (widget.trailingIcon != null)
                            Icon(
                              widget.trailingIcon!,
                              color: contentColor,
                              size: 16,
                            ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
