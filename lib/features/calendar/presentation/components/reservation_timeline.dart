import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/calendar_cubit.dart';
import 'reservation_card.dart';
import 'reservation_details/reservation_details_bottom_sheet.dart';

/// The focused day's reservations, chronologically, each row pairing the card
/// with its start/end times in the gutter.
class ReservationTimeline extends StatelessWidget {
  const ReservationTimeline({super.key, required this.reservations});

  final List<ReservationEntity> reservations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (index, reservation) in reservations.indexed) ...[
          if (index > 0) Divider(height: 1, color: context.colors.strokePrimary),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.spacing.s16),
            child: _ReservationTimelineRow(reservation: reservation),
          ),
        ],
      ],
    );
  }
}

class _ReservationTimelineRow extends StatelessWidget {
  const _ReservationTimelineRow({required this.reservation});

  final ReservationEntity reservation;

  /// Width of the time gutter, sized for `12:00 PM`.
  static const double _gutterWidth = 72;

  @override
  Widget build(BuildContext context) {
    final timeStyle = context.typography.book14.secondary(context);

    // The card sizes the row and the gutter stretches to it, so the end time
    // lands on the card's bottom edge the way the design reads a duration.
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: _gutterWidth + context.spacing.s8),
          child: TappableScale(
            onTap: () async {
              final calendar = context.read<CalendarCubit>();
              final changed = await ReservationDetailsBottomSheet.show(context, reservation);
              if (changed == true && !calendar.isClosed) await calendar.refresh();
            },
            borderRadius: BorderRadius.circular(16),
            child: ReservationCard(reservation: reservation),
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
              Text(CalendarDateFormat.time(context, reservation.startsAt), style: timeStyle),
              Text(CalendarDateFormat.time(context, reservation.endsAt), style: timeStyle),
            ],
          ),
        ),
      ],
    );
  }
}
