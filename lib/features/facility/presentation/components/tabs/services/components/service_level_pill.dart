import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';

/// The level badge (e.g. "INTERMEDIATE") shown on service tiles and details.
class ServiceLevelPill extends StatelessWidget {
  const ServiceLevelPill({super.key, required this.level, this.isFilled = false});

  final FacilityServiceLevel level;

  /// Opaque light shade of the level colour with white text, instead of the
  /// default pale translucent tint.
  ///
  /// Used on the session card, whose surface is already a much paler shade of
  /// the same accent — a translucent pill there would disappear into it.
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (level) {
      FacilityServiceLevelCustom(:final name, :final colorHex) => (
        name.toUpperCase(),
        colorHex.toColorOrNull() ?? context.colors.textTertiary,
      ),
      FacilityServiceLevelAll() => (
        context.l10n.facilityDetails_allLevels.toUpperCase(),
        context.colors.skyBluePrimary,
      ),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        color: isFilled ? color.levelBadgeSurface : color.withValues(alpha: 0.12),
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: context.typography.medium11.withColor(
          isFilled ? context.colors.textWhite : color,
        ),
      ),
    );
  }
}
