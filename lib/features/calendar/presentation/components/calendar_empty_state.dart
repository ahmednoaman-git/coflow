import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Shown when the focused day has no reservations — reachable by stepping into
/// a week with nothing booked.
class CalendarEmptyState extends StatelessWidget {
  const CalendarEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.s32),
      child: Center(
        child: Text(
          context.l10n.calendar_noReservations,
          style: context.typography.book14.secondary(context),
          textAlign: .center,
        ),
      ),
    );
  }
}
