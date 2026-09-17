import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_quote_entity.freezed.dart';

/// Authoritative amounts returned by the checkout validation endpoint.
@freezed
abstract class PurchaseQuoteEntity with _$PurchaseQuoteEntity {
  const factory PurchaseQuoteEntity({
    required double totalPrice,
    required double finalPrice,
    required double couponDiscount,
    @Default(0) double addOnsPrice,
    String? currency,
  }) = _PurchaseQuoteEntity;
}
