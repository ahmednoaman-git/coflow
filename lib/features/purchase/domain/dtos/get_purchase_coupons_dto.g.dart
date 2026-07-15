// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_purchase_coupons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPurchaseCouponsDto _$GetPurchaseCouponsDtoFromJson(
  Map<String, dynamic> json,
) => GetPurchaseCouponsDto(
  subjectType: $enumDecode(_$PurchaseSubjectTypeEnumMap, json['subject_type']),
  subjectId: (json['subject_id'] as num).toInt(),
);

Map<String, dynamic> _$GetPurchaseCouponsDtoToJson(
  GetPurchaseCouponsDto instance,
) => <String, dynamic>{
  'subject_type': _$PurchaseSubjectTypeEnumMap[instance.subjectType]!,
  'subject_id': instance.subjectId,
};

const _$PurchaseSubjectTypeEnumMap = {
  PurchaseSubjectType.ticket: 'ticket',
  PurchaseSubjectType.promotion: 'promotion',
};
