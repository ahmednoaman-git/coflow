import 'package:coflow_users_v2/core/presentation/widgets/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// A reusable back button widget using [CircularButton] with a back arrow icon.
///
/// Typically used in app bars or navigation contexts to provide a consistent
/// back navigation experience throughout the app.
class MainBackButton extends StatelessWidget {
  const MainBackButton({
    super.key,
    this.onPressed,
    this.size,
    this.iconSize = 18,
    this.backgroundColor,
    this.iconColor,
  });

  /// Callback when the button is pressed.
  ///
  /// If null, defaults to popping the current route using `Navigator.maybePop`.
  final VoidCallback? onPressed;

  /// Optional diameter override for the button.
  final double? size;

  /// Icon size when rendered inside the button.
  final double iconSize;

  /// Optional override for the button background color.
  final Color? backgroundColor;

  /// Optional override for the icon color.
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      icon: LucideIcons.arrowLeft,
      size: size,
      iconSize: iconSize,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
