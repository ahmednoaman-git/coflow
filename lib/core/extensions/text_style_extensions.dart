import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/widgets.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle withWeight(FontWeight fontWeight) {
    return copyWith(fontWeight: fontWeight);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Text Colors
  // ─────────────────────────────────────────────────────────────────────────

  TextStyle primary(BuildContext context) {
    return withColor(context.colors.textPrimary);
  }

  TextStyle secondary(BuildContext context) {
    return withColor(context.colors.textSecondary);
  }

  TextStyle tertiary(BuildContext context) {
    return withColor(context.colors.textTertiary);
  }

  TextStyle inverse(BuildContext context) {
    return withColor(context.colors.textWhite);
  }

  TextStyle disabled(BuildContext context) {
    return withColor(context.colors.textDisabled);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Semantic Colors
  // ─────────────────────────────────────────────────────────────────────────

  TextStyle error(BuildContext context) {
    return withColor(context.colors.energyCherryPrimary);
  }

  TextStyle success(BuildContext context) {
    return withColor(context.colors.seaCaribbeanPrimary);
  }

  TextStyle warning(BuildContext context) {
    return withColor(context.colors.earthSunnyGoldPrimary);
  }

  TextStyle info(BuildContext context) {
    return withColor(context.colors.skyBluePrimary);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Brand & Accent Colors
  // ─────────────────────────────────────────────────────────────────────────

  /// Main brand color (Signature Blue)
  TextStyle brand(BuildContext context) {
    return withColor(context.colors.signatureBlue);
  }

  /// Gold accent color (Earth Sunny Gold)
  TextStyle gold(BuildContext context) {
    return withColor(context.colors.earthSunnyGoldPrimary);
  }

  /// Sky Blue accent
  TextStyle skyBlue(BuildContext context) {
    return withColor(context.colors.skyBluePrimary);
  }

  /// Sea Caribbean accent (teal/green)
  TextStyle seaCaribbean(BuildContext context) {
    return withColor(context.colors.seaCaribbeanPrimary);
  }

  /// Cherry accent (red)
  TextStyle cherry(BuildContext context) {
    return withColor(context.colors.energyCherryPrimary);
  }

  /// Ladies Only accent (pink)
  TextStyle ladiesOnly(BuildContext context) {
    return withColor(context.colors.ladiesOnlyPrimary);
  }
}
