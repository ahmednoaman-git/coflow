import 'package:json_annotation/json_annotation.dart';

part 'facility_promotion_ticket_snapshot_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class FacilityPromotionTicketSnapshotModel {
  const FacilityPromotionTicketSnapshotModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory FacilityPromotionTicketSnapshotModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityPromotionTicketSnapshotModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityPromotionTicketSnapshotModelToJson(this);
}
