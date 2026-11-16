import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'user_purchases_state.freezed.dart';

/// State for [UserPurchasesCubit]: one request per tab, and the tab on show.
@freezed
abstract class UserPurchasesState with _$UserPurchasesState {
  const factory UserPurchasesState({
    @Default(UserPurchasePeriod.current) UserPurchasePeriod period,
    @Default(AsyncState.idle()) AsyncState<List<UserPurchaseEntity>> currentRequest,
    @Default(AsyncState.idle()) AsyncState<List<UserPurchaseEntity>> historyRequest,
  }) = _UserPurchasesState;
}
