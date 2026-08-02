import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';

/// The level badge (e.g. "INTERMEDIATE") shown on service tiles and details.
class ServiceLevelPill extends StatelessWidget {
  const ServiceLevelPill({super.key, required this.level});

  final FacilityServiceLevel level;

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
        color: color.withValues(alpha: 0.12),
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: context.typography.medium11.withColor(color),
      ),
    );
  }
}
