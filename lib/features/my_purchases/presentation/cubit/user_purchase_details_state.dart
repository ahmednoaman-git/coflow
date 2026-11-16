import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'user_purchase_details_state.freezed.dart';

/// State for [UserPurchaseDetailsCubit].
@freezed
abstract class UserPurchaseDetailsState with _$UserPurchaseDetailsState {
  const factory UserPurchaseDetailsState({
    /// Starts out holding the list's row, so the sheet opens filled in.
    required AsyncState<UserPurchaseEntity> purchaseRequest,
    @Default(AsyncState.idle()) AsyncState<void> cancelRequest,
  }) = _UserPurchaseDetailsState;
}
