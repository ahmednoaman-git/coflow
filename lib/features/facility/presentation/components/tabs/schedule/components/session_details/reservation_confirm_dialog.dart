import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../facility_data_provider.dart';

/// Confirmation step between `Reserve Now` and the reservation itself.
///
/// Shows the purchase the reservation will draw from and the facility's
/// cancellation policy. Returns true when the customer confirms.
///
/// TODO(product): when several purchases are eligible this will need a picker
/// — open question 2. Today the API names the one that would be consumed.
class ReservationConfirmDialog extends StatelessWidget {
  const ReservationConfirmDialog({
    super.key,
    required this.session,
    required this.accent,
  });

  final FacilitySessionDetailsEntity session;
  final Color accent;

  static Future<bool?> show(
    BuildContext context, {
    required FacilitySessionDetailsEntity session,
    required Color accent,
  }) {
    final facilityData = FacilityDataProvider.of(context);

    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => FacilityDataProvider.fromFacilityDataProvider(
        facilityDataProvider: facilityData,
        child: ReservationConfirmDialog(session: session, accent: accent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final facility = FacilityDataProvider.of(context).facility;
    final ticket = session.reservationTicket;

    return Dialog(
      insetPadding: EdgeInsets.all(context.spacing.s24),
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          crossAxisAlignment: .start,
          spacing: context.spacing.s16,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${l10n.facilitySchedule_confirmLabel} ',
                    style: context.typography.bold20.withColor(accent),
                  ),
                  TextSpan(
                    text: l10n.facilitySchedule_reservationLabel,
                    style: context.typography.bold20.primary(context),
                  ),
                ],
              ),
            ),
            Text(
              l10n.facilitySchedule_confirmReservationSubtitle,
              style: context.typography.book14.secondary(context),
            ),
            _ReservationTicketCard(session: session, ticket: ticket),
            if (session.cancellationWindowHours != null) ...[
            Text(
              l10n.facilitySchedule_cancellationPolicy,
              style: context.typography.bold16.primary(context),
            ),
            Text(
              l10n.facilitySchedule_cancellationPolicyBody(
                facility.name,
                session.cancellationWindowHours ?? 0,
              ),
              style: context.typography.book14.secondary(context),
            ),
            ],
            MainButton(
              text: l10n.facilitySchedule_reserveNowCta(session.accessibleTickets),
              backgroundColor: accent,
              textColor: accent.prefersDarkForeground
                  ? context.colors.textPrimary
                  : context.colors.textWhite,
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ),
    );
  }
}

/// The slot + the purchase that pays for it, on the shared notched ticket card.
class _ReservationTicketCard extends StatelessWidget {
  const _ReservationTicketCard({required this.session, required this.ticket});

  final FacilitySessionDetailsEntity session;
  final SessionReservationTicketEntity? ticket;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TicketCard(
      topChildren: [
        Padding(
          padding: EdgeInsets.all(context.spacing.s16),
          child: Center(
            child: Text(
              session.name.toUpperCase(),
              style: context.typography.bold16.primary(context),
              textAlign: .center,
            ),
          ),
        ),
      ],
      bottomChildren: [
        Padding(
          padding: EdgeInsets.all(context.spacing.s16),
          child: Column(
            crossAxisAlignment: .start,
            spacing: context.spacing.s12,
            children: [
              _LabelledValue(
                label: l10n.facilitySchedule_dateLabel,
                value: _fullDate(context, session.startsAt),
              ),
              _LabelledValue(
                label: l10n.facilitySchedule_timeLabel,
                value:
                    '${CalendarDateFormat.time(context, session.startsAt)}'
                    ' - ${CalendarDateFormat.time(context, session.endsAt)}',
              ),
              if (ticket != null) ...[
                Text(
                  l10n.facilitySchedule_ticketLabel,
                  style: context.typography.book13.tertiary(context),
                ),
                _TicketRow(ticket: ticket!),
              ],
            ],
          ),
        ),
      ],
    );
  }

  String _fullDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat('EEEE, MMMM d, y', locale).format(date);
  }
}

class _LabelledValue extends StatelessWidget {
  const _LabelledValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s4,
      children: [
        Text(label, style: context.typography.book13.tertiary(context)),
        Text(value, style: context.typography.bold14.primary(context)),
      ],
    );
  }
}

class _TicketRow extends StatelessWidget {
  const _TicketRow({required this.ticket});

  final SessionReservationTicketEntity ticket;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(context.spacing.s12),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: Row(
        spacing: context.spacing.s12,
        children: [
          Text(
            '${ticket.quantity}x',
            style: context.typography.bold16.warning(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.spacing.s8,
              children: [
                Row(
                  spacing: context.spacing.s8,
                  children: [
                    Expanded(
                      child: Text(
                        ticket.name,
                        style: context.typography.bold14.primary(context),
                      ),
                    ),
                    if (ticket.isDue) const _DuePill(),
                  ],
                ),
                Row(
                  spacing: context.spacing.s8,
                  children: [
                    if (ticket.validForDays case final days?)
                      Expanded(
                        child: Text(
                          l10n.facilitySchedule_ticketValidFor(days),
                          style: context.typography.book13.tertiary(context),
                        ),
                      ),
                    if (ticket.addOnsCount > 0)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spacing.s8,
                          vertical: context.spacing.s4,
                        ),
                        decoration: ShapeDecoration(
                          color: context.colors.backgroundGrey,
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          l10n.facilitySchedule_ticketAddOns(ticket.addOnsCount),
                          style: context.typography.medium12.secondary(context),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DuePill extends StatelessWidget {
  const _DuePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        color: context.colors.energyCherrySecondary,
        shape: const StadiumBorder(),
      ),
      child: Text(
        context.l10n.facilitySchedule_ticketDue,
        style: context.typography.medium11.error(context),
      ),
    );
  }
}
