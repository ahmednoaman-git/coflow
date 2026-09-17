import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/entities/entities.dart';
import '../session_capacity_bar.dart';
import 'session_details_section.dart';

/// The Customers section.
///
/// The facility decides whether names are public: private slots show only the
/// aggregate bar, visible ones list every position up to capacity with the
/// unfilled ones left blank.
class SessionCustomersSection extends StatelessWidget {
  const SessionCustomersSection({super.key, required this.session, required this.accent});

  final FacilitySessionDetailsEntity session;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SessionDetailsSection(
      title: context.l10n.facilitySchedule_customers,
      child: session.areCustomersVisible
          ? SessionAttendeeList(
              attendees: session.customers,
              totalPositions: session.capacity.total,
            )
          : SessionCapacityBar(capacity: session.capacity, accent: accent),
    );
  }
}

/// The Waitlist section — shown even when customer reservations are private.
class SessionWaitlistSection extends StatelessWidget {
  const SessionWaitlistSection({super.key, required this.waitlist});

  final List<SessionAttendeeEntity> waitlist;

  @override
  Widget build(BuildContext context) {
    return SessionDetailsSection(
      title: context.l10n.facilitySchedule_waitlist,
      child: SessionAttendeeList(attendees: waitlist, totalPositions: waitlist.length),
    );
  }
}

/// Numbered attendee list, two columns once it runs past five rows.
///
/// [totalPositions] pads the list with empty numbered slots, so a half-full
/// session still reads as "3 of 10".
class SessionAttendeeList extends StatelessWidget {
  const SessionAttendeeList({
    super.key,
    required this.attendees,
    required this.totalPositions,
  });

  final List<SessionAttendeeEntity> attendees;
  final int totalPositions;

  static const int _rowsPerColumn = 5;

  @override
  Widget build(BuildContext context) {
    final positions = [
      for (var position = 1; position <= totalPositions; position++)
        attendees.where((attendee) => attendee.position == position).firstOrNull,
    ];

    if (positions.length <= _rowsPerColumn) {
      return _AttendeeColumn(entries: positions.indexed.toList());
    }

    final splitAt = (positions.length / 2).ceil();

    return Row(
      crossAxisAlignment: .start,
      children: [
        Expanded(child: _AttendeeColumn(entries: positions.indexed.take(splitAt).toList())),
        Expanded(child: _AttendeeColumn(entries: positions.indexed.skip(splitAt).toList())),
      ],
    );
  }
}

class _AttendeeColumn extends StatelessWidget {
  const _AttendeeColumn({required this.entries});

  /// Index/attendee pairs — the index is the 0-based position in the list.
  final List<(int, SessionAttendeeEntity?)> entries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s12,
      children: [
        for (final (index, attendee) in entries)
          _AttendeeRow(position: index + 1, attendee: attendee),
      ],
    );
  }
}

class _AttendeeRow extends StatelessWidget {
  const _AttendeeRow({required this.position, required this.attendee});

  final int position;
  final SessionAttendeeEntity? attendee;

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = attendee?.isCurrentUser ?? false;

    return Row(
      spacing: context.spacing.s8,
      children: [
        SizedBox(
          width: 24,
          child: Text(
            '$position.',
            style: context.typography.book14.tertiary(context),
          ),
        ),
        Expanded(
          child: Text(
            attendee?.displayName ?? '',
            style: isCurrentUser
                ? context.typography.bold14.primary(context)
                : context.typography.book14.secondary(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
