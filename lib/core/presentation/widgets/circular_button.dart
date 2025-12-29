import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A circular icon-only button with press animations and loading state support.
///
/// Designed to complement [MainButton] while providing a more compact action
/// area for icon-based interactions such as FAB alternatives or contextual
/// actions.
class CircularButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final effectiveDisabled = isDisabled || isLoading;
    final effectiveSize = size ?? context.spacing.s48 - context.spacing.s4;

    Color backgroundColor;
    Color iconColor;

    if (effectiveDisabled) {
      backgroundColor =
          this.backgroundColor?.withValues(alpha: 0.5) ??
          context.colors.backgroundGreyTwo;
      iconColor =
          this.iconColor?.withValues(alpha: 0.5) ?? context.colors.textDisabled;
    } else {
      backgroundColor = this.backgroundColor ?? context.colors.backgroundGrey;
      iconColor = this.iconColor ?? context.colors.textPrimary;
    }

    return SizedBox(
      height: effectiveSize,
      width: effectiveSize,
      child: TappableScale(
        onTap: effectiveDisabled ? null : onPressed,
        isDisabled: effectiveDisabled,
        scaleEnd: 0.95,
        animationDuration: const Duration(milliseconds: 150),
        borderRadius: BorderRadius.circular(effectiveSize / 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: backgroundColor,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                    ),
                  )
                : Icon(icon, color: iconColor, size: iconSize),
          ),
        ),
      ),
    );
  }
}
