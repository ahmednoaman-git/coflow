import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';
import 'session_card.dart';
import 'session_details/session_details_bottom_sheet.dart';

/// The selected day's sessions, chronologically, each row pairing the card
/// with its start/end times in the gutter.
class SessionTimeline extends StatelessWidget {
  const SessionTimeline({
    super.key,
    required this.sessions,
    required this.showsCapacity,
  });

  final List<FacilitySessionEntity> sessions;
  final bool showsCapacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (index, session) in sessions.indexed) ...[
          if (index > 0) Divider(height: 1, color: context.colors.strokePrimary),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.spacing.s16),
            child: _SessionTimelineRow(session: session, showsCapacity: showsCapacity),
          ),
        ],
      ],
    );
  }
}

class _SessionTimelineRow extends StatelessWidget {
  const _SessionTimelineRow({required this.session, required this.showsCapacity});

  final FacilitySessionEntity session;
  final bool showsCapacity;

  /// Width of the time gutter, sized for `12:00 PM`.
  static const double _gutterWidth = 72;

  @override
  Widget build(BuildContext context) {
    final timeStyle = context.typography.book14.secondary(context);

    // The card sizes the row and the gutter stretches to it, so the end time
    // lands on the card's bottom edge the way the design reads a duration.
    // Done with a Stack rather than IntrinsicHeight so the card's subtree
    // stays free to use LayoutBuilder.
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: _gutterWidth + context.spacing.s8),
          child: TappableScale(
            onTap: () => SessionDetailsBottomSheet.show(context, session),
            borderRadius: BorderRadius.circular(16),
            child: SessionCard(session: session, showsCapacity: showsCapacity),
          ),
        ),
        PositionedDirectional(
          start: 0,
          top: 0,
          bottom: 0,
          width: _gutterWidth,
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(CalendarDateFormat.time(context, session.startsAt), style: timeStyle),
              Text(CalendarDateFormat.time(context, session.endsAt), style: timeStyle),
            ],
          ),
        ),
      ],
    );
  }
}
