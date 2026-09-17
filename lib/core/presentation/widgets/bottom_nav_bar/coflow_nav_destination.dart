import 'package:flutter/widgets.dart';

/// One slot in [CoflowBottomNavBar].
sealed class CoflowNavDestination {
  const CoflowNavDestination({required this.label});

  /// Localized caption shown under the icon.
  final String label;
}

/// A destination represented by an icon glyph.
class CoflowNavIconDestination extends CoflowNavDestination {
  const CoflowNavIconDestination({required super.label, required this.icon});

  final IconData icon;
}

/// A destination represented by the user's avatar, falling back to [fallback]
/// while the image is missing or still loading.
class CoflowNavAvatarDestination extends CoflowNavDestination {
  const CoflowNavAvatarDestination({
    required super.label,
    required this.imageUrl,
    required this.fallback,
  });

  final String? imageUrl;
  final IconData fallback;
}

/// The centre destination: the app mark on a floating disc rather than an icon
/// over a caption. It belongs in the middle slot of the bar's destination
/// list, and its [label] is carried for screen readers only.
class CoflowNavLogoDestination extends CoflowNavDestination {
  const CoflowNavLogoDestination({required super.label});
}
