import 'package:json_annotation/json_annotation.dart';

part 'toggle_facility_save_dto.g.dart';

/// Request DTO for flipping the saved flag on a facility.
///
/// The endpoint is a toggle with no body — it saves an unsaved facility and
/// removes a saved one — so the DTO carries only the target.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ToggleFacilitySaveDto {
  const ToggleFacilitySaveDto({required this.facilityId});

  final int facilityId;

  factory ToggleFacilitySaveDto.fromJson(Map<String, dynamic> json) =>
      _$ToggleFacilitySaveDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleFacilitySaveDtoToJson(this);
}
