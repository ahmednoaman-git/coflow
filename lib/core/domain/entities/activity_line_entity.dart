import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_line_entity.freezed.dart';

/// Core activity line entity used throughout the app.
///
/// Represents one of the four activity categories: Sky, Sea, Earth, Energy.
/// IDs are static and non-changing.
@freezed
abstract class ActivityLineEntity with _$ActivityLineEntity {
  const ActivityLineEntity._();

  const factory ActivityLineEntity({
    required int id,
  }) = _ActivityLineEntity;

  /// Static activity line instances.
  static const sky = ActivityLineEntity(id: 1);
  static const sea = ActivityLineEntity(id: 2);
  static const earth = ActivityLineEntity(id: 3);
  static const energy = ActivityLineEntity(id: 4);

  static const all = [sky, sea, earth, energy];

  /// Gets an activity line by its ID.
  static ActivityLineEntity fromId(int id) => all.firstWhere((e) => e.id == id, orElse: () => sky);

  /// Gets localized name for this activity line.
  String getName(AppLocalizations l10n) => switch (id) {
    1 => l10n.activityLineSky,
    2 => l10n.activityLineSea,
    3 => l10n.activityLineEarth,
    4 => l10n.activityLineEnergy,
    _ => '',
  };

  /// Gets non-localized key name (for API/internal use).
  String get key => switch (id) {
    1 => 'sky',
    2 => 'sea',
    3 => 'earth',
    4 => 'energy',
    _ => '',
  };

  /// Gets theme colors (primary, secondary) for this activity line.
  (Color, Color) getColors(BuildContext context) => switch (id) {
    1 => (context.colors.skyBluePrimary, context.colors.skyBlueSecondary),
    2 => (context.colors.seaCaribbeanPrimary, context.colors.seaCaribbeanSecondary),
    3 => (context.colors.earthSunnyGoldPrimary, context.colors.earthSunnyGoldSecondary),
    4 => (context.colors.energyCherryPrimary, context.colors.energyCherrySecondary),
    _ => (context.colors.signatureBlue, context.colors.signatureBlueSecondary),
  };

  /// Gets the SVG icon path for this activity line.
  String get iconPath => switch (id) {
    1 => Assets.svgs.sky.path,
    2 => Assets.svgs.sea.path,
    3 => Assets.svgs.earth.path,
    4 => Assets.svgs.energy.path,
    _ => Assets.svgs.sky.path,
  };
}
