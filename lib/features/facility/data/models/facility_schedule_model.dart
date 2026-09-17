import 'package:json_annotation/json_annotation.dart';

import 'facility_service_model.dart';
import 'facility_session_model.dart';

part 'facility_schedule_model.g.dart';

/// One page of `schedule/{facilityId}`.
///
/// The endpoint returns a Laravel paginator, so the data source walks pages
/// until [currentPage] reaches [lastPage] — the weekly pattern is only complete
/// once every page is in.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilitySchedulePageModel {
  const FacilitySchedulePageModel({
    this.currentPage = 1,
    this.lastPage = 1,
    this.slots = const <FacilityScheduleSlotModel>[],
  });

  @JsonKey(defaultValue: 1)
  final int currentPage;

  @JsonKey(defaultValue: 1)
  final int lastPage;

  @JsonKey(name: 'data', defaultValue: <FacilityScheduleSlotModel>[])
  final List<FacilityScheduleSlotModel> slots;

  factory FacilitySchedulePageModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitySchedulePageModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySchedulePageModelToJson(this);
}

/// A recurring weekly slot: the facility runs this service every [day] between
/// [from] and [to].
///
/// There are no dates here — the slot repeats every week, and the mapper
/// projects it onto the days the UI is showing.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityScheduleSlotModel {
  const FacilityScheduleSlotModel({
    required this.id,
    required this.day,
    required this.from,
    required this.to,
    this.dayInt,
    this.ladiesOnly,
    this.status,
    this.serviceId,
    this.instructors = const <FacilitySessionInstructorModel>[],
    this.service,
  });

  final int id;

  /// Lowercase weekday name, e.g. `sunday`. Authoritative over [dayInt].
  final String day;

  /// Index into the API's week, which starts on Saturday (`1`) — **not**
  /// Dart's `DateTime.weekday`. Only used when [day] is unrecognized.
  final int? dayInt;

  /// Clock times in `HH:mm:ss`, with no date attached.
  final String from;
  final String to;

  @JsonKey(defaultValue: <FacilitySessionInstructorModel>[])
  final List<FacilitySessionInstructorModel> instructors;

  final bool? ladiesOnly;

  /// `active` / `inactive` — inactive slots are dropped by the mapper.
  final String? status;

  final int? serviceId;

  final FacilityScheduleServiceModel? service;

  factory FacilityScheduleSlotModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityScheduleSlotModelFromJson({
        ...json,
        'instructors': [
          for (final row in [
            ...?json['instructors'] as List?,
            ...?json['other_instructors'] as List?,
          ])
            if (row is Map)
              <String, dynamic>{
                ...Map<String, dynamic>.from(row),
                'first_name': row['full_name'] ?? row['first_name'] ?? '',
                'last_name': row['full_name'] == null ? row['last_name'] ?? '' : '',
              },
        ],
      });

  Map<String, dynamic> toJson() => _$FacilityScheduleSlotModelToJson(this);
}

/// The slice of a service the schedule endpoint embeds in each slot.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityScheduleServiceModel {
  const FacilityScheduleServiceModel({
    required this.id,
    required this.name,
    this.type,
    this.image,
    this.level,
  });

  final int id;
  final String name;

  /// `flow` / `activity` / `course` — the endpoint takes no type filter, so
  /// this is what the listing toggle filters on client-side.
  final String? type;

  final String? image;
  final FacilityServiceLevelModel? level;

  factory FacilityScheduleServiceModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityScheduleServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityScheduleServiceModelToJson(this);
}
