import 'package:json_annotation/json_annotation.dart';

part 'get_facility_profile_dto.g.dart';

/// Request DTO for getting a facility profile.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilityProfileDto {
  const GetFacilityProfileDto({required this.facilityId});

  final int facilityId;

  factory GetFacilityProfileDto.fromJson(Map<String, dynamic> json) =>
      _$GetFacilityProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilityProfileDtoToJson(this);
}
