import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'promotion_purchase_args.dart';
import 'promotion_purchase_state.dart';

@injectable
class PromotionPurchaseCubit extends Cubit<PromotionPurchaseState> {
  PromotionPurchaseCubit(
    this._getCoupons,
    @factoryParam PromotionPurchaseArgs args,
  ) : super(
        PromotionPurchaseState(
          promotion: args.promotion,
          facility: args.facility,
          accentColor: args.accentColor,
        ),
      ) {
    _initManagers();
  }

  final GetPurchaseCouponsUseCase _getCoupons;

  late final AsyncRequestManager<PromotionPurchaseState, List<PurchaseCouponEntity>> couponsManager;

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
          subjectType: PurchaseSubjectType.promotion,
          subjectId: state.promotion.promotion.id,
        ),
      ),
    );
  }

  void incrementQuantity() => emit(state.copyWith(quantity: state.quantity + 1));

  void decrementQuantity() {
    if (state.quantity <= 1) return;
    emit(state.copyWith(quantity: state.quantity - 1));
  }

  void selectCoupon(PurchaseCouponEntity? coupon) => emit(state.copyWith(selectedCoupon: coupon));

  Future<void> refreshCoupons() => couponsManager.refresh();
}
