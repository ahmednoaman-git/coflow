import 'package:json_annotation/json_annotation.dart';

part 'purchased_add_on_model.g.dart';

/// An add-on bought with a purchase (`addons[]`).
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchasedAddOnModel {
  const PurchasedAddOnModel({this.name, this.quantity, this.finalPrice});

  final String? name;
  final int? quantity;

  /// What the add-on came to across [quantity].
  final num? finalPrice;

  factory PurchasedAddOnModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasedAddOnModelFromJson(json);
}
