import 'package:flutter/material.dart';
import 'package:coflow_users_v2/core/core.dart';

/// A reusable logo widget for the InoPeople application.
///
/// This widget displays the InoPeople logo SVG with support for Hero animations.
/// Use the [heroTag] parameter to enable hero animations between screens.
///
/// Example:
/// ```dart
/// InoPeopleLogo(
///   heroTag: 'logo',
/// )
/// ```
class InoPeopleLogo extends StatelessWidget {
  /// The hero tag for hero animations.
  /// If provided, the logo will be wrapped in a [Hero] widget.
  final String? heroTag;

  /// The width of the logo.
  final double? width;

  /// The height of the logo.
  final double? height;

  /// Optional color filter to apply to the logo.
  /// If null, uses the theme's primary text color.
  final ColorFilter? colorFilter;

  const InoPeopleLogo({
    super.key,
    this.heroTag,
    this.width,
    this.height,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    final logo = Assets.svgs.logo.svg(
      width: width,
      height: height,
      colorFilter: colorFilter ?? context.colors.textPrimary.colorFilter,
    );

    if (heroTag != null) {
      return Hero(tag: heroTag!, child: logo);
    }

    return logo;
  }
}
