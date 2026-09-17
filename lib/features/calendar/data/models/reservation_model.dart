import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';

/// Normalized reservations from the monthly `account-reservations` endpoint.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ReservationsResponseModel {
  const ReservationsResponseModel({this.reservations = const <ReservationModel>[]});

  @JsonKey(defaultValue: <ReservationModel>[])
  final List<ReservationModel> reservations;

  factory ReservationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationsResponseModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ReservationModel {
  const ReservationModel({
    required this.id,
    required this.facilityId,
    required this.facilityName,
    required this.serviceName,
    required this.startsAt,
    required this.endsAt,
    this.facilityLogo,
    this.color,
    this.level,
    this.instructors = const <ReservationInstructorModel>[],
  });

  final int id;
  final int facilityId;
  final String facilityName;
  final String? facilityLogo;
  final String serviceName;

  /// ISO-8601 local date-time, e.g. `2026-01-04T18:00:00`.
  final DateTime startsAt;
  final DateTime endsAt;

  /// Accent colour picked by the facility, e.g. `#5BC5F2`.
  final String? color;

  final ReservationLevelModel? level;

  @JsonKey(defaultValue: <ReservationInstructorModel>[])
  final List<ReservationInstructorModel> instructors;

  factory ReservationModel.fromJson(Map<String, dynamic> json) => _$ReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ReservationLevelModel {
  const ReservationLevelModel({required this.name, this.color});

  final String name;
  final String? color;

  factory ReservationLevelModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationLevelModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class ReservationInstructorModel {
  const ReservationInstructorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final int id;
  final String firstName;
  final String lastName;

  factory ReservationInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationInstructorModelToJson(this);
}
