import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// CoFlow logo widget displaying the app's SVG logo.
///
/// Provides a simple API to customize size and fit.
class Logo extends StatelessWidget {
  /// Creates a logo with the specified [size].
  ///
  /// Defaults to 40x40 if no size is provided.
  const Logo({super.key, this.size = 40, this.fit = BoxFit.contain});

  /// The size (width and height) of the logo.
  final double size;

  /// How the logo should be inscribed into the available space.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Assets.svgs.logo.svg(width: size, height: size, fit: fit);
  }
}
