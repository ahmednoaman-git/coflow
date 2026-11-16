import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_purchase_id_dto.freezed.dart';

/// Names one purchase — to re-read it, or to cancel it.
@freezed
abstract class UserPurchaseIdDto with _$UserPurchaseIdDto {
  const factory UserPurchaseIdDto({required int purchaseId}) = _UserPurchaseIdDto;
}
