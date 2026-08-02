import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../tabs/services/components/service_duration_chip.dart';
import '../tabs/services/components/service_level_pill.dart';

/// Centered row of the level and duration badges shown under a service's
/// title, reused by both the tile and the details screen.
class ServiceLevelPillRow extends StatelessWidget {
  const ServiceLevelPillRow({super.key, this.level, this.durationLabel});

  final FacilityServiceLevel? level;
  final String? durationLabel;

  @override
  Widget build(BuildContext context) {
    if (level == null && durationLabel == null) {
      return const SizedBox.shrink();
    }

    return Wrap(
      alignment: .center,
      spacing: context.spacing.s8,
      runSpacing: context.spacing.s4,
      children: [
        if (level case final level?) ServiceLevelPill(level: level),
        if (durationLabel case final duration?) ServiceDurationChip(label: duration),
      ],
    );
  }
}
