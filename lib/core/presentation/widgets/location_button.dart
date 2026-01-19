import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// A button that displays the currently selected location and opens
/// a bottom sheet for location selection when tapped.
///
/// This widget is designed to be used in app bars or headers,
/// displaying location info in a compact, tappable format.
class LocationButton extends StatelessWidget {
  const LocationButton({
    super.key,
    required this.selection,
    required this.isLoading,
    required this.onTap,
    this.country = 'Egypt',
    this.textColor,
    this.iconColor,
    this.backgroundColor,
  });

  /// The currently selected location.
  final SelectedLocation selection;

  /// Whether the locations are being loaded.
  final bool isLoading;

  /// Callback when the button is tapped.
  final VoidCallback? onTap;

  /// The country name to display when no location is selected.
  final String country;

  /// Text color override.
  final Color? textColor;

  /// Icon color override.
  final Color? iconColor;

  /// Background color override.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor = textColor ?? Colors.white;
    final effectiveIconColor = iconColor ?? Colors.white;
    final effectiveBgColor =
        backgroundColor ?? context.colors.signatureBlue.withValues(alpha: 0.3);

    final displayText = selection.isEmpty
        ? context.l10n.allLocation(country)
        : selection.displayName;

    return TappableScale(
      onTap: isLoading ? null : onTap,
      isDisabled: isLoading,
      scaleEnd: 0.96,
      borderRadius: BorderRadius.circular(15),
      backgroundColor: effectiveBgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s12,
          vertical: context.spacing.s8,
        ),
        child: Row(
          mainAxisSize: .min,
          spacing: context.spacing.s8,
          children: [
            Icon(
              SolarIconsOutline.mapPoint,
              size: 18,
              color: effectiveIconColor,
            ),
            if (isLoading)
              SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveIconColor),
                ),
              )
            else
              Text(
                displayText,
                style: context.typography.book14.copyWith(
                  color: effectiveTextColor,
                ),
              ),
            Icon(
              SolarIconsOutline.altArrowDown,
              size: 14,
              color: effectiveIconColor,
            ),
          ],
        ),
      ),
    );
  }
}
