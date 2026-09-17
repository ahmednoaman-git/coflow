import 'package:json_annotation/json_annotation.dart';

import 'facility_service_model.dart';

part 'facility_session_model.g.dart';

/// Response model for the scheduled-sessions endpoint
/// (`sessions/{facilityId}?type=...&start_date=...&end_date=...`).
///
/// TODO(backend): shape is provisional — served by
/// `FacilityScheduleStubDataSource` until the real endpoint ships.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitySessionsResponseModel {
  const FacilitySessionsResponseModel({this.sessions = const <FacilitySessionModel>[]});

  @JsonKey(defaultValue: <FacilitySessionModel>[])
  final List<FacilitySessionModel> sessions;

  factory FacilitySessionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitySessionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySessionsResponseModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitySessionModel {
  const FacilitySessionModel({
    required this.id,
    required this.serviceId,
    required this.name,
    required this.startsAt,
    required this.endsAt,
    this.color,
    this.ladiesOnly,
    this.level,
    this.instructors = const <FacilitySessionInstructorModel>[],
    this.capacity,
  });

  final int id;
  final int serviceId;
  final String name;

  /// ISO-8601 local date-time, e.g. `2026-01-04T18:00:00`.
  final DateTime startsAt;
  final DateTime endsAt;

  /// Accent colour picked by the facility, e.g. `#5BC5F2`.
  final String? color;

  final bool? ladiesOnly;
  final FacilityServiceLevelModel? level;

  @JsonKey(defaultValue: <FacilitySessionInstructorModel>[])
  final List<FacilitySessionInstructorModel> instructors;

  final FacilitySessionCapacityModel? capacity;

  factory FacilitySessionModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitySessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySessionModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitySessionInstructorModel {
  const FacilitySessionInstructorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final int id;
  final String firstName;
  final String lastName;

  factory FacilitySessionInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitySessionInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySessionInstructorModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitySessionCapacityModel {
  const FacilitySessionCapacityModel({
    required this.booked,
    required this.total,
    this.waitlist,
  });

  final int booked;
  final int total;

  /// People queued once the session is fully booked.
  final int? waitlist;

  factory FacilitySessionCapacityModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitySessionCapacityModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySessionCapacityModelToJson(this);
}
