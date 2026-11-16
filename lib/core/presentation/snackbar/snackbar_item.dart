import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solar_icons/solar_icons.dart';

part 'snackbar_item.freezed.dart';

/// The kind of feedback a snackbar carries; drives its icon and accent colors.
enum SnackbarType {
  success,
  error,
  info,
  warning
  ;

  IconData get icon => switch (this) {
    SnackbarType.success => SolarIconsOutline.checkCircle,
    SnackbarType.error => SolarIconsOutline.dangerCircle,
    SnackbarType.info => SolarIconsOutline.infoCircle,
    SnackbarType.warning => SolarIconsOutline.dangerTriangle,
  };

  /// Strong tone, used for the icon.
  Color accent(AppColors colors) => switch (this) {
    SnackbarType.success => colors.seaCaribbeanPrimary,
    SnackbarType.error => colors.energyCherryPrimary,
    SnackbarType.info => colors.skyBluePrimary,
    SnackbarType.warning => colors.earthSunnyGoldPrimary,
  };

  /// Soft tone, used for the icon's badge.
  Color tint(AppColors colors) => switch (this) {
    SnackbarType.success => colors.seaCaribbeanSecondary,
    SnackbarType.error => colors.energyCherrySecondary,
    SnackbarType.info => colors.skyBlueSecondary,
    SnackbarType.warning => colors.earthSunnyGoldSecondary,
  };
}

/// One snackbar in the queue. [id] is unique per cubit, so a stale auto-dismiss
/// timer can never dismiss a newer snackbar that happens to share its message.
@freezed
abstract class SnackbarItem with _$SnackbarItem {
  const factory SnackbarItem({
    required int id,
    required String message,
    required SnackbarType type,
    required Duration duration,
  }) = _SnackbarItem;
}
