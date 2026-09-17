import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/enums/enums.dart';

/// Shown when the selected day has no sessions.
class ScheduleEmptyState extends StatelessWidget {
  const ScheduleEmptyState({super.key, required this.type});

  final FacilityServiceType type;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final message = switch (type) {
      FacilityServiceType.flow => l10n.facilitySchedule_noFlows,
      FacilityServiceType.activity => l10n.facilitySchedule_noActivities,
      FacilityServiceType.course => l10n.facilitySchedule_noCourses,
    };

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.s32),
      child: Center(
        child: Text(
          message,
          style: context.typography.book14.secondary(context),
          textAlign: .center,
        ),
      ),
    );
  }
}
