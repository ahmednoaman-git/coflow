// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_promotion_ticket_snapshot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityPromotionTicketSnapshotModel
_$FacilityPromotionTicketSnapshotModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FacilityPromotionTicketSnapshotModel', json, (
      $checkedConvert,
    ) {
      final val = FacilityPromotionTicketSnapshotModel(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$FacilityPromotionTicketSnapshotModelToJson(
  FacilityPromotionTicketSnapshotModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
