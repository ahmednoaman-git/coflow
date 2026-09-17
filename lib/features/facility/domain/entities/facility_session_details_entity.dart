import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'facility_service_level.dart';
import 'facility_session_entity.dart';

part 'facility_session_details_entity.freezed.dart';

/// One entry in a slot's customers or waitlist list.
@freezed
abstract class SessionAttendeeEntity with _$SessionAttendeeEntity {
  const factory SessionAttendeeEntity({
    /// 1-based position in the list — the queue order for a waitlist.
    required int position,
    required String displayName,

    /// The signed-in customer's own entry, rendered in bold.
    @Default(false) bool isCurrentUser,
  }) = _SessionAttendeeEntity;
}

/// Where a slot takes place.
///
/// A facility can run an activity/course at its own address or at a location
/// picked per service; [isFacilityLocation] decides which heading the section
/// carries.
@freezed
abstract class SessionLocationEntity with _$SessionLocationEntity {
  const factory SessionLocationEntity({
    required String address,
    @Default(true) bool isFacilityLocation,
    String? mapUrl,
  }) = _SessionLocationEntity;
}

/// The purchase a reservation would consume, as shown in the confirmation
/// dialog.
@freezed
abstract class SessionReservationTicketEntity with _$SessionReservationTicketEntity {
  const factory SessionReservationTicketEntity({
    required String name,

    /// Remaining uses on this purchase.
    required int quantity,

    /// Payment is still outstanding on the purchase.
    @Default(false) bool isDue,
    DateTime? purchasedAt,
    int? validForDays,
    @Default(0) int addOnsCount,
  }) = _SessionReservationTicketEntity;
}

/// Everything the slot bottom sheet renders, including the viewer's own
/// standing on the slot.
@freezed
abstract class FacilitySessionDetailsEntity with _$FacilitySessionDetailsEntity {
  const FacilitySessionDetailsEntity._();

  const factory FacilitySessionDetailsEntity({
    required int id,
    required int serviceId,
    required String name,
    required DateTime startsAt,
    required DateTime endsAt,
    required String colorHex,
    FacilityServiceLevel? level,
    @Default(false) bool isLadiesOnly,
    @Default(<String>[]) List<String> instructorNames,
    required FacilitySessionCapacityEntity capacity,

    /// The facility's calendar setting. False hides the names behind an
    /// aggregate capacity bar.
    @Default(false) bool areCustomersVisible,

    /// Empty while [areCustomersVisible] is false.
    @Default(<SessionAttendeeEntity>[]) List<SessionAttendeeEntity> customers,

    /// Always visible, even when customer reservations are private.
    @Default(<SessionAttendeeEntity>[]) List<SessionAttendeeEntity> waitlist,

    SessionLocationEntity? location,
    String? note,

    /// Absolute moment after which cancelling (and leaving the waitlist) is no
    /// longer allowed. The whole waitlist is dropped when it passes.
    DateTime? cancellationDeadline,

    /// Hours-before-start behind [cancellationDeadline], for the policy copy.
    int? cancellationWindowHours,

    @Default(SessionViewerState.none) SessionViewerState viewerState,

    /// Remaining ticket uses the customer holds that are valid for this slot.
    @Default(0) int accessibleTickets,

    /// The purchase a reservation would draw from. Null when [accessibleTickets]
    /// is zero.
    SessionReservationTicketEntity? reservationTicket,
    int? reservationId,
    @Default(false) bool isRecurring,
    @Default(true) bool canReserve,
    @Default(false) bool canJoinWaitlist,
    @Default(true) bool canWithdraw,
  }) = _FacilitySessionDetailsEntity;

  bool get isFull => capacity.isFull;

  /// Whether a reservation or waitlist entry can still be withdrawn.
  bool canWithdrawAt(DateTime now) {
    if (!canWithdraw) return false;
    final deadline = cancellationDeadline;
    return deadline == null || now.isBefore(deadline);
  }
}
