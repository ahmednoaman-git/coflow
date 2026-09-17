import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);

  /// A pale, opaque surface of the same hue — for tinting a card with an
  /// accent the API chose.
  ///
  /// Derived from lightness rather than an alpha overlay so the result does
  /// not shift with whatever sits behind it. Saturation is capped so vivid
  /// accents come back as a soft tint instead of neon.
  Color tintedSurface({double lightness = 0.92, double maxSaturation = 0.85}) {
    final hsl = HSLColor.fromColor(this);

    return hsl
        .withSaturation(min(hsl.saturation, maxSaturation))
        .withLightness(lightness)
        .toColor();
  }

  /// Surface for a level badge sitting on a session or reservation card.
  ///
  /// A light shade of the accent rather than the accent itself, so the badge
  /// stays distinct from the card's much paler surface (lightness 0.92) while
  /// carrying white text. Cards only — elsewhere the badge is the pale
  /// translucent tint on a white background.
  Color get levelBadgeSurface => tintedSurface(lightness: 0.6);

  /// Whether dark text reads better than light text on this colour.
  ///
  /// Compares the WCAG contrast ratio of black against white on this
  /// background, so mid-tones resolve on measured contrast rather than a
  /// guess.
  bool get prefersDarkForeground {
    final luminance = computeLuminance();
    final contrastWithDark = (luminance + 0.05) / 0.05;
    final contrastWithLight = 1.05 / (luminance + 0.05);

    return contrastWithDark >= contrastWithLight;
  }
}

extension HexColorParsing on String {
  /// Parses a hex color string (`'#fe9e12'`, `'fe9e12'`, or 8-digit ARGB).
  /// Returns `null` when the string is not a valid hex color.
  Color? toColorOrNull() {
    var hex = trim();
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    if (hex.length != 8) {
      return null;
    }

    final value = int.tryParse(hex, radix: 16);
    if (value == null) {
      return null;
    }

    return Color(value);
  }
}
