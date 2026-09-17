// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseQuoteModel _$PurchaseQuoteModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PurchaseQuoteModel',
      json,
      ($checkedConvert) {
        final val = PurchaseQuoteModel(
          totalPrice: $checkedConvert(
            'total_price',
            (v) => PurchaseQuoteModel._amount(v),
          ),
          finalPrice: $checkedConvert(
            'final_price',
            (v) => PurchaseQuoteModel._amount(v),
          ),
          discountCoupon: $checkedConvert(
            'discount_coupon',
            (v) => PurchaseQuoteModel._amount(v),
          ),
          addonsPrice: $checkedConvert(
            'addons_price',
            (v) => v == null ? 0 : PurchaseQuoteModel._amount(v),
          ),
          currency: $checkedConvert('currency', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalPrice': 'total_price',
        'finalPrice': 'final_price',
        'discountCoupon': 'discount_coupon',
        'addonsPrice': 'addons_price',
      },
    );

Map<String, dynamic> _$PurchaseQuoteModelToJson(PurchaseQuoteModel instance) =>
    <String, dynamic>{
      'total_price': instance.totalPrice,
      'final_price': instance.finalPrice,
      'discount_coupon': instance.discountCoupon,
      'addons_price': instance.addonsPrice,
      'currency': instance.currency,
    };
