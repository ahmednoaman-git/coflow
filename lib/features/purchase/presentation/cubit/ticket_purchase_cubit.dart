import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'ticket_purchase_args.dart';
import 'ticket_purchase_state.dart';

@injectable
class TicketPurchaseCubit extends Cubit<TicketPurchaseState> {
  TicketPurchaseCubit(
    this._getCoupons,
    @factoryParam TicketPurchaseArgs args,
  ) : super(
        TicketPurchaseState(
          ticket: args.ticket,
          facility: args.facility,
          accentColor: args.accentColor,
        ),
      ) {
    _initManagers();
  }

  final GetPurchaseCouponsUseCase _getCoupons;

  late final AsyncRequestManager<TicketPurchaseState, List<PurchaseCouponEntity>> couponsManager;

  void _initManagers() {
    couponsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.couponsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(couponsRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getCoupons(
        GetPurchaseCouponsDto(
          subjectType: PurchaseSubjectType.ticket,
          subjectId: state.ticket.id,
        ),
      ),
    );
  }

  void toggleAddOn(int addOnId) {
    final selected = Set<int>.from(state.selectedAddOnIds);
    if (!selected.remove(addOnId)) {
      selected.add(addOnId);
    }
    emit(state.copyWith(selectedAddOnIds: selected));
  }

  void incrementQuantity() => emit(state.copyWith(quantity: state.quantity + 1));

  void decrementQuantity() {
    if (state.quantity <= 1) return;
    emit(state.copyWith(quantity: state.quantity - 1));
  }

  void selectCoupon(PurchaseCouponEntity? coupon) => emit(state.copyWith(selectedCoupon: coupon));

  Future<void> refreshCoupons() => couponsManager.refresh();
}
