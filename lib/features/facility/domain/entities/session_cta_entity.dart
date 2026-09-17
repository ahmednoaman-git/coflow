import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'facility_session_details_entity.dart';

part 'session_cta_entity.freezed.dart';

/// The single action a slot offers the customer.
///
/// [resolve] is the one place the CTA rules live — see section 3.6 of
/// `schedule_feature_plan.md`. Keeping the table here instead of in widget
/// conditionals means product changes land in one tested function.
@freezed
sealed class SessionCtaEntity with _$SessionCtaEntity {
  const SessionCtaEntity._();

  const factory SessionCtaEntity.unavailable() = SessionUnavailableCta;

  /// The facility cannot take reservations in-app; point the user at it.
  const factory SessionCtaEntity.contactFacility({required String facilityName}) =
      SessionContactFacilityCta;

  /// A spot is free and the customer holds a usable ticket.
  const factory SessionCtaEntity.reserve({required int accessibleTickets}) = SessionReserveCta;

  /// Nothing to reserve with — divert to the purchase flow.
  const factory SessionCtaEntity.purchaseTickets({required int accessibleTickets}) =
      SessionPurchaseTicketsCta;

  /// Slot is full but the customer holds a ticket. Fires immediately, without
  /// a confirmation step and without deducting the ticket.
  const factory SessionCtaEntity.joinWaitlist() = SessionJoinWaitlistCta;

  /// Holds a reservation. Disabled once the cancellation deadline passes.
  const factory SessionCtaEntity.cancelReservation({required bool isEnabled}) =
      SessionCancelReservationCta;

  /// Queued for a spot. Disabled once the cancellation deadline passes.
  const factory SessionCtaEntity.leaveWaitlist({required bool isEnabled}) = SessionLeaveWaitlistCta;

  /// Resolves the CTA for [session].
  ///
  /// Order matters: the facility's ability to take reservations at all comes
  /// first, then whatever the customer already holds on this slot, and only
  /// then the free/full split.
  static SessionCtaEntity resolve({
    required FacilitySessionDetailsEntity session,
    required String facilityName,
    required bool isFacilityPremiumActive,
    required DateTime now,
  }) {
    if (!isFacilityPremiumActive || session.isRecurring) {
      return SessionCtaEntity.contactFacility(facilityName: facilityName);
    }

    final canWithdraw = session.canWithdrawAt(now);

    if (session.viewerState == SessionViewerState.none &&
        (!session.startsAt.isAfter(now) ||
            !session.canReserve ||
            (session.isFull && session.accessibleTickets >= 1 && !session.canJoinWaitlist))) {
      return const SessionCtaEntity.unavailable();
    }

    return switch (session.viewerState) {
      SessionViewerState.reserved => SessionCtaEntity.cancelReservation(isEnabled: canWithdraw),
      SessionViewerState.waitlisted => SessionCtaEntity.leaveWaitlist(isEnabled: canWithdraw),
      SessionViewerState.none => switch ((session.isFull, session.accessibleTickets >= 1)) {
        // Reserving and queueing both need a usable ticket; without one the
        // only way forward is buying, full or not.
        (false, true) => SessionCtaEntity.reserve(accessibleTickets: session.accessibleTickets),
        (true, true) => const SessionCtaEntity.joinWaitlist(),
        (_, false) => SessionCtaEntity.purchaseTickets(
          accessibleTickets: session.accessibleTickets,
        ),
      },
    };
  }
}
