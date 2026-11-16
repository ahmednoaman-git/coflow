// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasePaymentModel _$PurchasePaymentModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PurchasePaymentModel', json, ($checkedConvert) {
  final val = PurchasePaymentModel(
    amount: $checkedConvert('amount', (v) => v as num?),
    status: $checkedConvert('status', (v) => v as String?),
    createdAt: $checkedConvert(
      'created_at',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
}, fieldKeyMap: const {'createdAt': 'created_at'});
