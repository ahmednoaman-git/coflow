// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_facility_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseFacilityGroupModel _$PurchaseFacilityGroupModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PurchaseFacilityGroupModel', json, ($checkedConvert) {
  final val = PurchaseFacilityGroupModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String?),
    tags: $checkedConvert(
      'tags',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => PurchaseGroupTagModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    ),
    purchases: $checkedConvert(
      'purchases',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => UserPurchaseModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    ),
  );
  return val;
});

PurchaseGroupTagModel _$PurchaseGroupTagModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PurchaseGroupTagModel',
  json,
  ($checkedConvert) {
    final val = PurchaseGroupTagModel(
      activityLineId: $checkedConvert(
        'activity_line_id',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'activityLineId': 'activity_line_id'},
);
