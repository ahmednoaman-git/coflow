import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// `Sunday 1ˢᵗ                    🗓 5 Reservations` — the header above the
/// timeline.
class CalendarDaySummary extends StatelessWidget {
  const CalendarDaySummary({
    super.key,
    required this.day,
    required this.reservationCount,
  });

  final DateTime day;
  final int reservationCount;

  @override
  Widget build(BuildContext context) {
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
            Assets.svgs.calendar.svg(
              width: 20,
              height: 20,
              colorFilter: context.colors.textPrimary.colorFilter,
            ),
            Text(
              context.l10n.calendar_reservationCount(reservationCount),
              style: context.typography.medium16.primary(context),
            ),
          ],
        ),
      ],
    );
  }
}
