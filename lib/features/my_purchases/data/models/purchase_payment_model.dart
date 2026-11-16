import 'package:json_annotation/json_annotation.dart';

part 'purchase_payment_model.g.dart';

/// One entry of a purchase's payment ledger (`payments[]`): the `due` row
/// written when it is bought, then a `paid` row per payment and a `refund` row
/// per refund.
@JsonSerializable(fieldRename: FieldRename.snake, checked: true, createToJson: false)
class PurchasePaymentModel {
  const PurchasePaymentModel({this.amount, this.status, this.createdAt});

  final num? amount;

  /// `due`, `paid` or `refund`.
  final String? status;
  final DateTime? createdAt;

  factory PurchasePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasePaymentModelFromJson(json);
}
