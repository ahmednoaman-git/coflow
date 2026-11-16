import 'package:json_annotation/json_annotation.dart';

import 'user_purchase_model.dart';

part 'purchase_facility_group_model.g.dart';

/// The list endpoints group rows by facility: `[{id, name, purchases[]}]`.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchaseFacilityGroupModel {
  const PurchaseFacilityGroupModel({
    required this.id,
    this.name,
    this.tags = const [],
    this.purchases = const [],
  });

  /// The facility's id.
  final int id;
  final String? name;

  /// The facility's tags — only read for their activity line, which gift rows
  /// (they carry no facility record) need to open the facility.
  @JsonKey(defaultValue: <PurchaseGroupTagModel>[])
  final List<PurchaseGroupTagModel> tags;

  @JsonKey(defaultValue: <UserPurchaseModel>[])
  final List<UserPurchaseModel> purchases;

  factory PurchaseFacilityGroupModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFacilityGroupModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchaseGroupTagModel {
  const PurchaseGroupTagModel({this.activityLineId});

  final int? activityLineId;

  factory PurchaseGroupTagModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseGroupTagModelFromJson(json);
}
