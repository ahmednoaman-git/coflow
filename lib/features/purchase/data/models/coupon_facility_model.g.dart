// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_facility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponFacilityModel _$CouponFacilityModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CouponFacilityModel', json, ($checkedConvert) {
      final val = CouponFacilityModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CouponFacilityModelToJson(
  CouponFacilityModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
