// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_promotion_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityPromotionDetailsModel _$FacilityPromotionDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FacilityPromotionDetailsModel', json, ($checkedConvert) {
  $checkKeys(json, disallowNullValues: const ['coupons']);
  final val = FacilityPromotionDetailsModel(
    promotion: $checkedConvert(
      'promotion',
      (v) => FacilityPromotionModel.fromJson(v as Map<String, dynamic>),
    ),
    coupons: $checkedConvert(
      'coupons',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => FacilityPromotionCouponModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

Map<String, dynamic> _$FacilityPromotionDetailsModelToJson(
  FacilityPromotionDetailsModel instance,
) => <String, dynamic>{
  'promotion': instance.promotion,
  'coupons': instance.coupons,
};
