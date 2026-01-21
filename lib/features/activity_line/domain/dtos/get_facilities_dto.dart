import 'package:coflow_users_v2/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_facilities_dto.g.dart';

/// Request DTO for getting facilities by activity line.
///
/// Matches backend API: POST {{userUrl}}facilities
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilitiesDto {
  const GetFacilitiesDto({
    this.locationType,
    this.cityId,
    this.areaId,
    required this.activityLineId,
    this.tagId,
  });

  /// Location type filter: "address based" or "remote location"
  final String? locationType;

  /// City ID filter (required if location type is address based)
  final int? cityId;

  /// Area ID filter (optional)
  final int? areaId;

  /// Activity line ID filter (required)
  final int activityLineId;

  /// Tag ID filter (optional)
  final int? tagId;

  factory GetFacilitiesDto.fromJson(Map<String, dynamic> json) => _$GetFacilitiesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilitiesDtoToJson(this);

  /// Creates a DTO with address-based location type.
  factory GetFacilitiesDto.addressBased({
    required int activityLineId,
    int? cityId,
    int? areaId,
    int? tagId,
  }) => GetFacilitiesDto(
    locationType: LocationType.addressBased.value,
    activityLineId: activityLineId,
    cityId: cityId,
    areaId: areaId,
    tagId: tagId,
  );

  /// Creates a DTO with remote location type.
  factory GetFacilitiesDto.remote({
    required int activityLineId,
    int? tagId,
  }) => GetFacilitiesDto(
    locationType: LocationType.remoteLocation.value,
    activityLineId: activityLineId,
    tagId: tagId,
  );
}
