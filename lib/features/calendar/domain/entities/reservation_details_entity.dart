import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_details_entity.freezed.dart';

/// Everything the reservation sheet renders.
///
/// A reservation *is* a facility slot the user holds a place on, so the slot
/// half reuses the facility feature's [FacilitySessionDetailsEntity] rather
/// than restating it — location, customers, waitlist, note, cancellation
/// deadline and the viewer's standing all mean the same thing here.
///
/// What the Calendar adds is the facility itself: the sheet leads with it,
/// because unlike the facility's own Schedule tab this timeline spans
/// facilities.
@freezed
abstract class ReservationDetailsEntity with _$ReservationDetailsEntity {
  const ReservationDetailsEntity._();

  const factory ReservationDetailsEntity({
    required int facilityId,
    required String facilityName,
    required FacilitySessionDetailsEntity slot,
    String? facilityLogoUrl,
    CollapsedFacilityEntity? facility,
  }) = _ReservationDetailsEntity;

  /// Whether the place can still be given up — the withdraw CTA disables once
  /// the facility's cancellation window has closed.
  bool canWithdrawAt(DateTime now) => slot.canWithdrawAt(now);
}
