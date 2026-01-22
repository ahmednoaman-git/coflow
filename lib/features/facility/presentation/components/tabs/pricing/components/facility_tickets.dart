import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

import 'ticket_tile.dart';

class FacilityTickets extends StatelessWidget {
  const FacilityTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<FacilityDetailsCubit, FacilityDetailsState, List<FacilityTicketEntity>>(
      requestManagerGetter: (cubit) => cubit.ticketsManager,
      loadingBuilder: (context) => Padding(
        padding: EdgeInsets.all(context.spacing.s32),
        child: const Center(child: CircularProgressIndicator()),
      ),
      successBuilder: (context, tickets) {
        if (tickets.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(context.spacing.s32),
            child: Text(
              context.l10n.facilityDetails_noTickets,
              style: context.typography.medium14.tertiary(context),
              textAlign: .center,
            ),
          );
        }
        return FacilityTicketsList(tickets: tickets);
      },
      onRetry: (cubit) => cubit.refreshTickets(),
    );
  }
}

class FacilityTicketsList extends StatelessWidget {
  const FacilityTicketsList({super.key, required this.tickets});

  final List<FacilityTicketEntity> tickets;

  static const double ticketHeight = 104.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ticketWidth = constraints.maxWidth.clamp(200, 480).toDouble();

        return Column(
          spacing: context.spacing.s16,
          children: [
            for (final ticket in tickets)
              TicketTile(ticket: ticket, size: Size(ticketWidth, ticketHeight)),
          ],
        );
      },
    );
  }
}
