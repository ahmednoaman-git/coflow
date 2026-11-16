import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import 'user_purchase_details_state.dart';

/// Drives one purchase's detail sheet.
///
/// The sheet opens on the row the list already holds, then re-reads it from
/// `purchases/{id}` in the background, so what it shows — and whether it
/// offers to cancel — is current. A gift has no single-row endpoint of its own
/// and keeps the list's row.
@injectable
class UserPurchaseDetailsCubit extends Cubit<UserPurchaseDetailsState> {
  UserPurchaseDetailsCubit(
    this._getUserPurchase,
    this._cancelUserPurchase,
    @factoryParam UserPurchaseEntity purchase,
  ) : super(UserPurchaseDetailsState(purchaseRequest: AsyncState.success(purchase))) {
    final dto = UserPurchaseIdDto(purchaseId: purchase.id);

    purchaseManager = .new(
      accessor: (
        getPartialState: (state) => state.purchaseRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(purchaseRequest: partial),
      ),
      emit: _emitIfOpen,
      defaultRequest: _getUserPurchase(dto),
      refreshInBackground: true,
    );
    cancelManager = .new(
      accessor: (
        getPartialState: (state) => state.cancelRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(cancelRequest: partial),
      ),
      emit: _emitIfOpen,
      defaultRequest: _cancelUserPurchase(dto),
    );

    if (!purchase.isGift) purchaseManager.execute();
  }

  final GetUserPurchaseUseCase _getUserPurchase;
  final CancelUserPurchaseUseCase _cancelUserPurchase;

  late final AsyncRequestManager<UserPurchaseDetailsState, UserPurchaseEntity> purchaseManager;
  late final AsyncRequestManager<UserPurchaseDetailsState, void> cancelManager;

  /// Cancels the purchase. Only offered while [UserPurchaseEntity.canCancel].
  Future<void> cancel() async {
    if (cancelManager.isLoading) return;
    await cancelManager.execute();
  }

  void _emitIfOpen(UserPurchaseDetailsState state) {
    if (!isClosed) emit(state);
  }
}
