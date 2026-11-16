// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased_add_on_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasedAddOnModel _$PurchasedAddOnModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PurchasedAddOnModel', json, ($checkedConvert) {
      final val = PurchasedAddOnModel(
        name: $checkedConvert('name', (v) => v as String?),
        quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
        finalPrice: $checkedConvert('final_price', (v) => v as num?),
      );
      return val;
    }, fieldKeyMap: const {'finalPrice': 'final_price'});
