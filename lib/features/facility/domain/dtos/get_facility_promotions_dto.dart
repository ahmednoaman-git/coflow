import 'package:json_annotation/json_annotation.dart';

part 'get_facility_promotions_dto.g.dart';

/// Request DTO for getting facility promotions.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilityPromotionsDto {
  const GetFacilityPromotionsDto({required this.facilityId});

  final int facilityId;

  factory GetFacilityPromotionsDto.fromJson(Map<String, dynamic> json) =>
      _$GetFacilityPromotionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilityPromotionsDtoToJson(this);
}
