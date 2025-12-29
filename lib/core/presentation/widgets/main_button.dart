import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A custom button widget with iOS-like rounded corners and smooth animations.
///
/// This widget provides a consistent button design across the application
/// with support for loading states, disabled states, and leading/trailing icons.
///
/// Example:
/// ```dart
/// MainButton(
///   text: 'Log In',
///   onPressed: () => login(),
/// )
/// ```
class MainButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final bool effectiveDisabled = isDisabled || isLoading;
    final effectiveHeight = height ?? 45.0;

    // Determine colors based on state
    Color backgroundColor;
    Color contentColor;

    if (effectiveDisabled) {
      backgroundColor =
          this.backgroundColor?.withValues(alpha: 0.5) ??
          context.colors.backgroundGreyTwo;
      contentColor =
          textColor?.withValues(alpha: 0.5) ?? context.colors.textDisabled;
    } else {
      backgroundColor = this.backgroundColor ?? context.colors.signatureBlue;
      contentColor = textColor ?? context.colors.textWhite;
    }

    return SizedBox(
      height: effectiveHeight,
      width: width,
      child: TappableScale(
        onTap: effectiveDisabled ? null : onPressed,
        isDisabled: effectiveDisabled,
        scaleEnd: 0.98,
        animationDuration: const Duration(milliseconds: 150),
        borderRadius: BorderRadius.circular(12.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: ShapeDecoration(
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: backgroundColor,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(contentColor),
                        strokeWidth: 2.0,
                      ),
                    )
                  : Row(
                      mainAxisSize: .min,
                      mainAxisAlignment: .center,
                      spacing: context.spacing.s8,
                      children: [
                        if (leadingIcon != null)
                          Icon(leadingIcon!, color: contentColor, size: 16),
                        Text(
                          text,
                          style: context.typography.medium14.withColor(
                            contentColor,
                          ),
                        ),
                        if (trailingIcon != null)
                          Icon(trailingIcon!, color: contentColor, size: 16),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
