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
    this._getQuote,
    this._submitPurchase,
    @factoryParam TicketPurchaseArgs args,
  ) : super(
        TicketPurchaseState(
          ticket: args.ticket,
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

  late final AsyncRequestManager<TicketPurchaseState, List<PurchaseCouponEntity>> couponsManager;
  late AsyncRequestManager<TicketPurchaseState, PurchaseQuoteEntity> quoteManager;
  late final AsyncRequestManager<TicketPurchaseState, PurchaseReceiptEntity> submitManager;
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
          facilityId: state.facility.id,
          subjectType: PurchaseSubjectType.ticket,
          subjectId: state.ticket.id,
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

  void _emitIfOpen(TicketPurchaseState next) {
    if (!isClosed) emit(next);
  }

  Future<void> refreshQuote() async {
    if (inputsLocked || isClosed) return;
    final revision = ++_quoteRevision;
    final selection = SubmitPurchaseDto(
      subjectType: PurchaseSubjectType.ticket,
      subjectId: state.ticket.id,
      quantity: state.quantity,
      addOnIds: state.selectedAddOnIds.toList(),
      couponId: state.selectedCoupon?.id,
    );
    _quotedSelection = selection;
    // Each quote owns its emitter: late responses cannot overwrite a newer
    // selection, including when the user retries after an error.
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
    await quoteManager.execute(_getQuote(selection));

    // Rather than leave checkout stuck on the error, drop a coupon the quote
    // refused and price the purchase without it.
    if (revision == _quoteRevision && !isClosed && quoteManager.failure is CouponRejectedFailure) {
      emit(
        state.copyWith(
          selectedCoupon: null,
          couponRejected: true,
          quoteRequest: const AsyncState.idle(),
        ),
      );
      await refreshQuote();
    }
  }

  Future<void> submit() async {
    if (inputsLocked || !quoteManager.isSuccess || isClosed) return;
    await submitManager.execute(_submitPurchase(_quotedSelection!));
  }

  void toggleAddOn(int addOnId) {
    if (inputsLocked || !state.ticket.addOns.any((addOn) => addOn.id == addOnId)) return;
    final selected = Set<int>.from(state.selectedAddOnIds);
    if (!selected.remove(addOnId)) {
      selected.add(addOnId);
    }
    emit(state.copyWith(selectedAddOnIds: selected, quoteRequest: const AsyncState.idle()));
    refreshQuote();
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
    emit(
      state.copyWith(
        selectedCoupon: coupon,
        couponRejected: false,
        quoteRequest: const AsyncState.idle(),
      ),
    );
    refreshQuote();
  }

  Future<void> refreshCoupons() =>
      couponsManager.isLoading ? Future.value() : couponsManager.refresh();
}
