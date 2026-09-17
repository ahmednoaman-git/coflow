import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../models/models.dart';
import 'facility_schedule_mapper.dart';

abstract final class FacilitySessionDetailsMapper {
  static FacilitySessionDetailsEntity toEntity(FacilitySessionDetailsModel model) {
    return FacilitySessionDetailsEntity(
      id: model.id,
      serviceId: model.serviceId,
      name: model.name,
      startsAt: model.startsAt,
      endsAt: model.endsAt,
      colorHex: model.color?.isNotEmpty ?? false
          ? model.color!
          : FacilityScheduleMapper.fallbackColorHex,
      level: model.level == null
          ? null
          : FacilityServiceLevel.custom(
              name: model.level!.name,
              colorHex: model.level!.color ?? '',
            ),
      isLadiesOnly: model.ladiesOnly ?? false,
      instructorNames: model.instructors
          .map((instructor) => '${instructor.firstName} ${instructor.lastName}'.trim())
          .toList(growable: false),
      capacity: FacilitySessionCapacityEntity(
        booked: model.capacity.booked,
        total: model.capacity.total,
        waitlistCount: model.capacity.waitlist ?? 0,
      ),
      areCustomersVisible: model.customersVisible ?? false,
      customers: model.customers.map(_toAttendee).toList(growable: false),
      waitlist: model.waitlist.map(_toAttendee).toList(growable: false),
      location: _toLocation(model.location),
      note: model.note,
      cancellationDeadline: model.cancellationDeadline,
      cancellationWindowHours: model.cancellationWindowHours,
      viewerState: _toViewerState(model.viewerState),
      accessibleTickets: model.accessibleTickets ?? 0,
      reservationTicket: _toReservationTicket(model.reservationTicket),
      reservationId: model.reservationId,
      isRecurring: model.isRecurring,
      canReserve: model.canReserve,
      canJoinWaitlist: model.canJoinWaitlist,
      canWithdraw: model.canWithdraw,
    );
  }

  static SessionAttendeeEntity _toAttendee(SessionAttendeeModel model) {
    return SessionAttendeeEntity(
      position: model.position,
      displayName: model.name,
      isCurrentUser: model.isCurrentUser ?? false,
    );
  }

  static SessionLocationEntity? _toLocation(SessionLocationModel? model) {
    if (model == null) return null;
    return SessionLocationEntity(
      address: model.address,
      isFacilityLocation: model.isFacilityLocation ?? true,
      mapUrl: model.mapUrl,
    );
  }

  /// An unknown or missing state means the customer has no standing on the
  /// slot — never assume a reservation the backend did not confirm.
  static SessionViewerState _toViewerState(String? value) => switch (value?.toLowerCase()) {
    'reserved' => SessionViewerState.reserved,
    'waitlisted' => SessionViewerState.waitlisted,
    _ => SessionViewerState.none,
  };

  static SessionReservationTicketEntity? _toReservationTicket(
    SessionReservationTicketModel? model,
  ) {
    if (model == null) return null;
    return SessionReservationTicketEntity(
      name: model.name,
      quantity: model.quantity,
      isDue: model.due ?? false,
      purchasedAt: model.purchasedAt,
      validForDays: model.validForDays,
      addOnsCount: model.addOns ?? 0,
    );
  }
}
