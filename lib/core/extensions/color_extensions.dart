import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
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
