// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'CouponModel',
  json,
  ($checkedConvert) {
    final val = CouponModel(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      type: $checkedConvert('type', (v) => v as String),
      promoGift: $checkedConvert('promo_gift', (v) => v),
      price: $checkedConvert('price', (v) => (v as num?)?.toDouble()),
      discountOffer: $checkedConvert('discount_offer', (v) => v),
      discountCoupon: $checkedConvert('discount_coupon', (v) => v),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
      used: $checkedConvert('used', (v) => (v as num?)?.toInt()),
      totalPrice: $checkedConvert(
        'total_price',
        (v) => (v as num?)?.toDouble(),
      ),
      addonsPrice: $checkedConvert(
        'addons_price',
        (v) => (v as num?)?.toDouble(),
      ),
      finalPrice: $checkedConvert(
        'final_price',
        (v) => (v as num?)?.toDouble(),
      ),
      paid: $checkedConvert('paid', (v) => (v as num?)?.toDouble()),
      remain: $checkedConvert('remain', (v) => (v as num?)?.toDouble()),
      refund: $checkedConvert('refund', (v) => (v as num?)?.toDouble()),
      gift: $checkedConvert('gift', (v) => v as bool?),
      expireDate: $checkedConvert(
        'expire_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert('status', (v) => v as String?),
      action: $checkedConvert('action', (v) => v as String?),
      userId: $checkedConvert('user_id', (v) => (v as num?)?.toInt()),
      adminId: $checkedConvert('admin_id', (v) => (v as num?)?.toInt()),
      createdById: $checkedConvert(
        'created_by_id',
        (v) => (v as num?)?.toInt(),
      ),
      facilityId: $checkedConvert('facility_id', (v) => (v as num?)?.toInt()),
      promotionId: $checkedConvert('promotion_id', (v) => (v as num?)?.toInt()),
      paymentMethodId: $checkedConvert(
        'payment_method_id',
        (v) => (v as num?)?.toInt(),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      relatedPurchaseId: $checkedConvert(
        'related_purchase_id',
        (v) => (v as num?)?.toInt(),
      ),
      coupon: $checkedConvert(
        'coupon',
        (v) => CouponDetailsModel.fromJson(v as Map<String, dynamic>),
      ),
      facility: $checkedConvert(
        'facility',
        (v) => v == null ? null : CouponFacilityModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'promoGift': 'promo_gift',
    'discountOffer': 'discount_offer',
    'discountCoupon': 'discount_coupon',
    'totalPrice': 'total_price',
    'addonsPrice': 'addons_price',
    'finalPrice': 'final_price',
    'expireDate': 'expire_date',
    'userId': 'user_id',
    'adminId': 'admin_id',
    'createdById': 'created_by_id',
    'facilityId': 'facility_id',
    'promotionId': 'promotion_id',
    'paymentMethodId': 'payment_method_id',
    'createdAt': 'created_at',
    'relatedPurchaseId': 'related_purchase_id',
  },
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'promo_gift': instance.promoGift,
  'price': instance.price,
  'discount_offer': instance.discountOffer,
  'discount_coupon': instance.discountCoupon,
  'quantity': instance.quantity,
  'used': instance.used,
  'total_price': instance.totalPrice,
  'addons_price': instance.addonsPrice,
  'final_price': instance.finalPrice,
  'paid': instance.paid,
  'remain': instance.remain,
  'refund': instance.refund,
  'gift': instance.gift,
  'expire_date': instance.expireDate?.toIso8601String(),
  'status': instance.status,
  'action': instance.action,
  'user_id': instance.userId,
  'admin_id': instance.adminId,
  'created_by_id': instance.createdById,
  'facility_id': instance.facilityId,
  'promotion_id': instance.promotionId,
  'payment_method_id': instance.paymentMethodId,
  'created_at': instance.createdAt?.toIso8601String(),
  'related_purchase_id': instance.relatedPurchaseId,
  'coupon': instance.coupon,
  'facility': instance.facility,
};
