import 'package:json_annotation/json_annotation.dart';

part 'toggle_facility_tracking_dto.g.dart';

/// Request DTO for flipping update-tracking on a facility.
///
/// Like the save verb, the endpoint is a toggle and takes no body.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ToggleFacilityTrackingDto {
  const ToggleFacilityTrackingDto({required this.facilityId});

  final int facilityId;

  factory ToggleFacilityTrackingDto.fromJson(Map<String, dynamic> json) =>
      _$ToggleFacilityTrackingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleFacilityTrackingDtoToJson(this);
}
