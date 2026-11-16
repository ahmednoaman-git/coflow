// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_target_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponTargetModel _$CouponTargetModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CouponTargetModel', json, ($checkedConvert) {
      final val = CouponTargetModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CouponTargetModelToJson(CouponTargetModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
