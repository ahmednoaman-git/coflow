// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_session_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitySessionDetailsModel _$FacilitySessionDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilitySessionDetailsModel',
  json,
  ($checkedConvert) {
    final val = FacilitySessionDetailsModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      serviceId: $checkedConvert('service_id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert('ends_at', (v) => DateTime.parse(v as String)),
      capacity: $checkedConvert(
        'capacity',
        (v) => FacilitySessionCapacityModel.fromJson(v as Map<String, dynamic>),
      ),
      color: $checkedConvert('color', (v) => v as String?),
      ladiesOnly: $checkedConvert('ladies_only', (v) => v as bool?),
      level: $checkedConvert(
        'level',
        (v) => v == null
            ? null
            : FacilityServiceLevelModel.fromJson(v as Map<String, dynamic>),
      ),
      instructors: $checkedConvert(
        'instructors',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => FacilitySessionInstructorModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      ),
      customersVisible: $checkedConvert('customers_visible', (v) => v as bool?),
      customers: $checkedConvert(
        'customers',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      SessionAttendeeModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      waitlist: $checkedConvert(
        'waitlist',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      SessionAttendeeModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      location: $checkedConvert(
        'location',
        (v) => v == null
            ? null
            : SessionLocationModel.fromJson(v as Map<String, dynamic>),
      ),
      note: $checkedConvert('note', (v) => v as String?),
      cancellationDeadline: $checkedConvert(
        'cancellation_deadline',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      cancellationWindowHours: $checkedConvert(
        'cancellation_window_hours',
        (v) => (v as num?)?.toInt(),
      ),
      viewerState: $checkedConvert('viewer_state', (v) => v as String?),
      accessibleTickets: $checkedConvert(
        'accessible_tickets',
        (v) => (v as num?)?.toInt(),
      ),
      reservationTicket: $checkedConvert(
        'reservation_ticket',
        (v) => v == null
            ? null
            : SessionReservationTicketModel.fromJson(v as Map<String, dynamic>),
      ),
      reservationId: $checkedConvert(
        'reservation_id',
        (v) => (v as num?)?.toInt(),
      ),
      isRecurring: $checkedConvert('is_recurring', (v) => v as bool? ?? false),
      canReserve: $checkedConvert('can_reserve', (v) => v as bool? ?? true),
      canJoinWaitlist: $checkedConvert(
        'can_join_waitlist',
        (v) => v as bool? ?? false,
      ),
      canWithdraw: $checkedConvert('can_withdraw', (v) => v as bool? ?? true),
    );
    return val;
  },
  fieldKeyMap: const {
    'serviceId': 'service_id',
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'ladiesOnly': 'ladies_only',
    'customersVisible': 'customers_visible',
    'cancellationDeadline': 'cancellation_deadline',
    'cancellationWindowHours': 'cancellation_window_hours',
    'viewerState': 'viewer_state',
    'accessibleTickets': 'accessible_tickets',
    'reservationTicket': 'reservation_ticket',
    'reservationId': 'reservation_id',
    'isRecurring': 'is_recurring',
    'canReserve': 'can_reserve',
    'canJoinWaitlist': 'can_join_waitlist',
    'canWithdraw': 'can_withdraw',
  },
);

Map<String, dynamic> _$FacilitySessionDetailsModelToJson(
  FacilitySessionDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'service_id': instance.serviceId,
  'name': instance.name,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'capacity': instance.capacity,
  'color': instance.color,
  'ladies_only': instance.ladiesOnly,
  'level': instance.level,
  'instructors': instance.instructors,
  'customers_visible': instance.customersVisible,
  'customers': instance.customers,
  'waitlist': instance.waitlist,
  'location': instance.location,
  'note': instance.note,
  'cancellation_deadline': instance.cancellationDeadline?.toIso8601String(),
  'cancellation_window_hours': instance.cancellationWindowHours,
  'viewer_state': instance.viewerState,
  'accessible_tickets': instance.accessibleTickets,
  'reservation_ticket': instance.reservationTicket,
  'reservation_id': instance.reservationId,
  'is_recurring': instance.isRecurring,
  'can_reserve': instance.canReserve,
  'can_join_waitlist': instance.canJoinWaitlist,
  'can_withdraw': instance.canWithdraw,
};

SessionAttendeeModel _$SessionAttendeeModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SessionAttendeeModel',
  json,
  ($checkedConvert) {
    final val = SessionAttendeeModel(
      position: $checkedConvert('position', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      isCurrentUser: $checkedConvert('is_current_user', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {'isCurrentUser': 'is_current_user'},
);

Map<String, dynamic> _$SessionAttendeeModelToJson(
  SessionAttendeeModel instance,
) => <String, dynamic>{
  'position': instance.position,
  'name': instance.name,
  'is_current_user': instance.isCurrentUser,
};

SessionLocationModel _$SessionLocationModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SessionLocationModel',
  json,
  ($checkedConvert) {
    final val = SessionLocationModel(
      address: $checkedConvert('address', (v) => v as String),
      isFacilityLocation: $checkedConvert(
        'is_facility_location',
        (v) => v as bool?,
      ),
      mapUrl: $checkedConvert('map_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'isFacilityLocation': 'is_facility_location',
    'mapUrl': 'map_url',
  },
);

Map<String, dynamic> _$SessionLocationModelToJson(
  SessionLocationModel instance,
) => <String, dynamic>{
  'address': instance.address,
  'is_facility_location': instance.isFacilityLocation,
  'map_url': instance.mapUrl,
};

SessionReservationTicketModel _$SessionReservationTicketModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SessionReservationTicketModel',
  json,
  ($checkedConvert) {
    final val = SessionReservationTicketModel(
      name: $checkedConvert('name', (v) => v as String),
      quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      due: $checkedConvert('due', (v) => v as bool?),
      purchasedAt: $checkedConvert(
        'purchased_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      validForDays: $checkedConvert(
        'valid_for_days',
        (v) => (v as num?)?.toInt(),
      ),
      addOns: $checkedConvert('add_ons', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'purchasedAt': 'purchased_at',
    'validForDays': 'valid_for_days',
    'addOns': 'add_ons',
  },
);

Map<String, dynamic> _$SessionReservationTicketModelToJson(
  SessionReservationTicketModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'quantity': instance.quantity,
  'due': instance.due,
  'purchased_at': instance.purchasedAt?.toIso8601String(),
  'valid_for_days': instance.validForDays,
  'add_ons': instance.addOns,
};
