// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPurchaseModel _$UserPurchaseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UserPurchaseModel',
  json,
  ($checkedConvert) {
    final val = UserPurchaseModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      price: $checkedConvert('price', (v) => v as num?),
      discountOffer: $checkedConvert('discount_offer', (v) => v as num?),
      discountCoupon: $checkedConvert('discount_coupon', (v) => v as num?),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
      totalPrice: $checkedConvert('total_price', (v) => v as num?),
      addonsPrice: $checkedConvert('addons_price', (v) => v as num?),
      finalPrice: $checkedConvert('final_price', (v) => v as num?),
      refund: $checkedConvert('refund', (v) => v as num?),
      gift: $checkedConvert('gift', (v) => v as bool?),
      expireDate: $checkedConvert(
        'expire_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert('status', (v) => v as String?),
      action: $checkedConvert('action', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String?),
      facilityId: $checkedConvert('facility_id', (v) => (v as num?)?.toInt()),
      facility: $checkedConvert('facility', (v) => _facilityFromJson(v)),
      tickets: $checkedConvert(
        'tickets',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PurchasedTicketModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      addons: $checkedConvert(
        'addons',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PurchasedAddOnModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      promotion: $checkedConvert('promotion', (v) => _promotionFromJson(v)),
      payments: $checkedConvert(
        'payments',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => PurchasePaymentModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      ),
      coupon: $checkedConvert(
        'coupon',
        (v) => v == null ? null : GiftCouponModel.fromJson(v as Map<String, dynamic>),
      ),
      relatedPurchase: $checkedConvert(
        'related_purchase',
        (v) => v == null ? null : UserPurchaseModel.fromJson(v as Map<String, dynamic>),
      ),
      couponPurchase: $checkedConvert(
        'coupon_purchase',
        (v) => v == null ? null : UserPurchaseModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'discountOffer': 'discount_offer',
    'discountCoupon': 'discount_coupon',
    'totalPrice': 'total_price',
    'addonsPrice': 'addons_price',
    'finalPrice': 'final_price',
    'expireDate': 'expire_date',
    'createdAt': 'created_at',
    'facilityId': 'facility_id',
    'relatedPurchase': 'related_purchase',
    'couponPurchase': 'coupon_purchase',
  },
);
