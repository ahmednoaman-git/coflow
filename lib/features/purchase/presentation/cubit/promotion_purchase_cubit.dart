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
    this._getQuote,
    this._submitPurchase,
    @factoryParam PromotionPurchaseArgs args,
  ) : super(
        PromotionPurchaseState(
          promotion: args.promotion,
          facility: args.facility,
          accentColor: args.accentColor,
        ),
      ) {
    _initManagers();
    refreshQuote();
  }

  final GetPurchaseCouponsUseCase _getCoupons;
  final GetPurchaseQuoteUseCase _getQuote;
  final SubmitPurchaseUseCase _submitPurchase;

  late final AsyncRequestManager<PromotionPurchaseState, List<PurchaseCouponEntity>> couponsManager;
  late AsyncRequestManager<PromotionPurchaseState, PurchaseQuoteEntity> quoteManager;
  late final AsyncRequestManager<PromotionPurchaseState, PurchaseReceiptEntity> submitManager;
  int _quoteRevision = 0;
  SubmitPurchaseDto? _quotedSelection;

  bool get inputsLocked => submitManager.isLoading || submitManager.isSuccess;

  void _initManagers() {
    couponsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.couponsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(couponsRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getCoupons(
        GetPurchaseCouponsDto(
          subjectType: PurchaseSubjectType.promotion,
          subjectId: state.promotion.promotion.id,
        ),
      ),
    );
    submitManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.submitRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(submitRequest: partial),
      ),
      emit: _emitIfOpen,
    );
  }

  void _emitIfOpen(PromotionPurchaseState next) {
    if (!isClosed) emit(next);
  }

  Future<void> refreshQuote() {
    if (inputsLocked || isClosed) return Future.value();
    final revision = ++_quoteRevision;
    final selection = SubmitPurchaseDto(
      subjectType: PurchaseSubjectType.promotion,
      subjectId: state.promotion.promotion.id,
      quantity: state.quantity,
      couponId: state.selectedCoupon?.id,
    );
    _quotedSelection = selection;
    quoteManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.quoteRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(quoteRequest: partial),
      ),
      emit: (next) {
        if (revision == _quoteRevision) _emitIfOpen(next);
      },
    );
    return quoteManager.execute(_getQuote(selection));
  }

  Future<void> submit() async {
    if (inputsLocked || !quoteManager.isSuccess || isClosed) return;
    await submitManager.execute(_submitPurchase(_quotedSelection!));
  }

  void incrementQuantity() {
    if (inputsLocked) return;
    emit(state.copyWith(quantity: state.quantity + 1, quoteRequest: const AsyncState.idle()));
    refreshQuote();
  }

  void decrementQuantity() {
    if (inputsLocked || state.quantity <= 1) return;
    emit(state.copyWith(quantity: state.quantity - 1, quoteRequest: const AsyncState.idle()));
    refreshQuote();
  }

  void selectCoupon(PurchaseCouponEntity? coupon) {
    if (inputsLocked) return;
    emit(state.copyWith(selectedCoupon: coupon, quoteRequest: const AsyncState.idle()));
    refreshQuote();
  }

  Future<void> refreshCoupons() =>
      couponsManager.isLoading ? Future.value() : couponsManager.refresh();
}
