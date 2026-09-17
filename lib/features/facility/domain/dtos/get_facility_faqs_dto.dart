import 'package:json_annotation/json_annotation.dart';

part 'get_facility_faqs_dto.g.dart';

/// Request DTO for a facility's FAQ list.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilityFaqsDto {
  const GetFacilityFaqsDto({required this.facilityId});

  final int facilityId;

  factory GetFacilityFaqsDto.fromJson(Map<String, dynamic> json) =>
      _$GetFacilityFaqsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilityFaqsDtoToJson(this);
}
