import 'package:json_annotation/json_annotation.dart';

import 'facility_service_model.dart';
import 'facility_session_model.dart';

part 'facility_session_details_model.g.dart';

/// Response model for a single scheduled slot.
///
/// TODO(backend): shape is provisional — served by
/// `FacilitySessionDetailsStubDataSource` until the real endpoint ships. See
/// section 4 of `schedule_feature_plan.md`.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitySessionDetailsModel {
  const FacilitySessionDetailsModel({
    required this.id,
    required this.serviceId,
    required this.name,
    required this.startsAt,
    required this.endsAt,
    required this.capacity,
    this.color,
    this.ladiesOnly,
    this.level,
    this.instructors = const <FacilitySessionInstructorModel>[],
    this.customersVisible,
    this.customers = const <SessionAttendeeModel>[],
    this.waitlist = const <SessionAttendeeModel>[],
    this.location,
    this.note,
    this.cancellationDeadline,
    this.cancellationWindowHours,
    this.viewerState,
    this.accessibleTickets,
    this.reservationTicket,
    this.reservationId,
    this.isRecurring = false,
    this.canReserve = true,
    this.canJoinWaitlist = false,
    this.canWithdraw = true,
  });

  final int id;
  final int serviceId;
  final String name;
  final DateTime startsAt;
  final DateTime endsAt;
  final FacilitySessionCapacityModel capacity;

  final String? color;
  final bool? ladiesOnly;
  final FacilityServiceLevelModel? level;

  @JsonKey(defaultValue: <FacilitySessionInstructorModel>[])
  final List<FacilitySessionInstructorModel> instructors;

  /// The facility's calendar setting for showing customer names.
  final bool? customersVisible;

  @JsonKey(defaultValue: <SessionAttendeeModel>[])
  final List<SessionAttendeeModel> customers;

  @JsonKey(defaultValue: <SessionAttendeeModel>[])
  final List<SessionAttendeeModel> waitlist;

  final SessionLocationModel? location;
  final String? note;

  final DateTime? cancellationDeadline;
  final int? cancellationWindowHours;

  /// `none` | `reserved` | `waitlisted`.
  final String? viewerState;

  final int? accessibleTickets;
  final SessionReservationTicketModel? reservationTicket;
  final int? reservationId;
  final bool isRecurring;
  final bool canReserve;
  final bool canJoinWaitlist;
  final bool canWithdraw;

  factory FacilitySessionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitySessionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySessionDetailsModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SessionAttendeeModel {
  const SessionAttendeeModel({
    required this.position,
    required this.name,
    this.isCurrentUser,
  });

  final int position;
  final String name;
  final bool? isCurrentUser;

  factory SessionAttendeeModel.fromJson(Map<String, dynamic> json) =>
      _$SessionAttendeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionAttendeeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SessionLocationModel {
  const SessionLocationModel({
    required this.address,
    this.isFacilityLocation,
    this.mapUrl,
  });

  final String address;

  /// True when the facility's own address applies; false when the service
  /// carries its own selected location.
  final bool? isFacilityLocation;
  final String? mapUrl;

  factory SessionLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SessionLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionLocationModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SessionReservationTicketModel {
  const SessionReservationTicketModel({
    required this.name,
    required this.quantity,
    this.due,
    this.purchasedAt,
    this.validForDays,
    this.addOns,
  });

  final String name;
  final int quantity;
  final bool? due;
  final DateTime? purchasedAt;
  final int? validForDays;
  final int? addOns;

  factory SessionReservationTicketModel.fromJson(Map<String, dynamic> json) =>
      _$SessionReservationTicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionReservationTicketModelToJson(this);
}
