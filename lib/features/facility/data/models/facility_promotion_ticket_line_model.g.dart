// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_promotion_ticket_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityPromotionTicketLineModel _$FacilityPromotionTicketLineModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FacilityPromotionTicketLineModel',
  json,
  ($checkedConvert) {
    final val = FacilityPromotionTicketLineModel(
      count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      unlimited: $checkedConvert(
        'unlimited',
        (v) => v == null ? false : _promotionBoolFromJson(v),
      ),
      ticketId: $checkedConvert('ticket_id', (v) => (v as num?)?.toInt()),
      ticket: $checkedConvert(
        'ticket',
        (v) => v == null
            ? null
            : FacilityPromotionTicketSnapshotModel.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'ticketId': 'ticket_id'},
);

Map<String, dynamic> _$FacilityPromotionTicketLineModelToJson(
  FacilityPromotionTicketLineModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'unlimited': _promotionBoolToJson(instance.unlimited),
  'ticket_id': instance.ticketId,
  'ticket': instance.ticket,
};
