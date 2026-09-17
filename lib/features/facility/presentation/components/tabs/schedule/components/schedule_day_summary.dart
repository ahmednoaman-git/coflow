import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../domain/enums/enums.dart';
import '../../../facility_data_provider.dart';

/// `Sunday 1ˢᵗ                    ▲ 5 Flows` — the header above the timeline.
class ScheduleDaySummary extends StatelessWidget {
  const ScheduleDaySummary({
    super.key,
    required this.day,
    required this.type,
    required this.sessionCount,
  });

  final DateTime day;
  final FacilityServiceType type;
  final int sessionCount;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final l10n = context.l10n;

    final countLabel = switch (type) {
      FacilityServiceType.flow => l10n.facilitySchedule_flowCount(sessionCount),
      FacilityServiceType.activity => l10n.facilitySchedule_activityCount(sessionCount),
      FacilityServiceType.course => l10n.facilitySchedule_courseCount(sessionCount),
    };

    return Row(
      children: [
        Expanded(
          child: CalendarDateLabel(
            prefix: CalendarDateFormat.weekdayName(context, day),
            day: day,
            style: context.typography.bold16.primary(context),
          ),
        ),
        Row(
          spacing: context.spacing.s8,
          children: [
            SvgPicture.asset(
              facilityData.facility.activityLine.iconPath,
              width: 20,
              height: 20,
              colorFilter: facilityData.activityLineColor.colorFilter,
            ),
            Text(countLabel, style: context.typography.medium16.primary(context)),
          ],
        ),
      ],
    );
  }
}
