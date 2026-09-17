import 'package:json_annotation/json_annotation.dart';

part 'purchase_quote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class PurchaseQuoteModel {
  const PurchaseQuoteModel({
    required this.totalPrice,
    required this.finalPrice,
    required this.discountCoupon,
    this.addonsPrice = 0,
    this.currency,
  });

  @JsonKey(fromJson: _amount)
  final double totalPrice;
  @JsonKey(fromJson: _amount)
  final double finalPrice;
  @JsonKey(fromJson: _amount)
  final double discountCoupon;
  @JsonKey(fromJson: _amount, defaultValue: 0)
  final double addonsPrice;
  final String? currency;

  factory PurchaseQuoteModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseQuoteModelFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseQuoteModelToJson(this);

  static double _amount(Object? value) {
    final amount = value is num ? value.toDouble() : double.tryParse('$value');
    if (amount == null || !amount.isFinite || amount < 0) {
      throw const FormatException('Invalid purchase amount');
    }
    return amount;
  }
}
