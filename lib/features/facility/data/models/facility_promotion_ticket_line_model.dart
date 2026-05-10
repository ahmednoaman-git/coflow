import 'package:json_annotation/json_annotation.dart';

import 'facility_promotion_ticket_snapshot_model.dart';

part 'facility_promotion_ticket_line_model.g.dart';

bool _promotionBoolFromJson(Object? value) => switch (value) {
  null => false,
  final bool boolValue => boolValue,
  final num numberValue => numberValue != 0,
  final String stringValue => switch (stringValue.trim().toLowerCase()) {
    '1' || 'true' || 'yes' => true,
    '0' || 'false' || 'no' || '' => false,
    _ => false,
  },
  _ => false,
};

Object _promotionBoolToJson(bool? value) => value ?? false;

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityPromotionTicketLineModel {
  const FacilityPromotionTicketLineModel({
    this.count,
    this.unlimited,
    this.ticketId,
    this.ticket,
  });

  final int? count;

  @JsonKey(
    fromJson: _promotionBoolFromJson,
    toJson: _promotionBoolToJson,
    defaultValue: false,
  )
  final bool? unlimited;

  @JsonKey(name: 'ticket_id')
  final int? ticketId;

  final FacilityPromotionTicketSnapshotModel? ticket;

  factory FacilityPromotionTicketLineModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityPromotionTicketLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityPromotionTicketLineModelToJson(this);
}
