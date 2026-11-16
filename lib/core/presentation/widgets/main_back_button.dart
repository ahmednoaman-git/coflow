import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// The app's back control: a chevron in a standard-size [CircularButton],
/// pointing toward the start edge (so it flips in RTL).
///
/// The chevron is centred by eye rather than by its box. Solar's glyph is
/// centred numerically, but it's a tall, narrow `<` whose weight sits on its
/// open side: measured, the triangle it outlines has its centroid 5% of the
/// icon's size behind the box's centre. The glyph is moved forward by that much
/// — the same correction a play triangle gets — so it reads as centred in the
/// circle instead of drifting toward its open side.
///
/// Pops the current route unless [onPressed] says otherwise. Styled per
/// surface through [backgroundColor] and [iconColor], e.g. transparent with a
/// white chevron on a coloured bar, or a translucent dark disc over a photo.
class MainBackButton extends StatelessWidget {
  const MainBackButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  /// Callback when the button is pressed.
  ///
  /// If null, defaults to popping the current route using `Navigator.maybePop`.
  final VoidCallback? onPressed;

  /// Optional override for the button background color.
  final Color? backgroundColor;

  /// Optional override for the icon color.
  final Color? iconColor;

  static const double iconSize = 24;

  /// How far the chevron moves toward its point, as a fraction of [iconSize].
  static const double _opticalShift = 0.05;

  @override
  Widget build(BuildContext context) {
    final isRTL = context.isRTL;
    const shift = iconSize * _opticalShift;

    return CircularButton(
      icon: isRTL ? SolarIconsOutline.altArrowRight : SolarIconsOutline.altArrowLeft,
      iconSize: iconSize,
      iconOffset: Offset(isRTL ? shift : -shift, 0),
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
