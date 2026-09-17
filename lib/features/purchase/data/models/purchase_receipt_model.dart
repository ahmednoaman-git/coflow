import 'package:json_annotation/json_annotation.dart';

part 'purchase_receipt_model.g.dart';

@JsonSerializable(checked: true)
class PurchaseReceiptModel {
  const PurchaseReceiptModel({required this.id});

  @JsonKey(fromJson: _purchaseId)
  final int id;

  factory PurchaseReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseReceiptModelFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseReceiptModelToJson(this);

  static int _purchaseId(Object? value) {
    final id = int.tryParse('$value');
    if (id == null || id <= 0) throw const FormatException('Missing persisted purchase ID');
    return id;
  }
}
