import 'package:json_annotation/json_annotation.dart';

part 'get_facility_promotion_details_dto.g.dart';

/// Request DTO for getting facility promotion details.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetFacilityPromotionDetailsDto {
  const GetFacilityPromotionDetailsDto({required this.promotionId});

  final int promotionId;

  factory GetFacilityPromotionDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GetFacilityPromotionDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetFacilityPromotionDetailsDtoToJson(this);
}
