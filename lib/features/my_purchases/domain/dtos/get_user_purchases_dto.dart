import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_purchases_dto.freezed.dart';

/// Which owned items a list shows: what the user bought, or what was gifted.
enum UserPurchaseCategory { purchases, gifts }

/// The Current / History split both lists share.
enum UserPurchasePeriod { current, history }

/// Asks for one of the four account lists.
@freezed
abstract class GetUserPurchasesDto with _$GetUserPurchasesDto {
  const factory GetUserPurchasesDto({
    required UserPurchaseCategory category,
    required UserPurchasePeriod period,
  }) = _GetUserPurchasesDto;
}
