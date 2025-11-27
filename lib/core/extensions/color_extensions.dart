import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
