import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import 'user_purchases_state.dart';

/// Drives Account › Purchases or Gifts ([category]): the Current list loads at
/// once, History on first visit, and both refresh in the background after
/// that — the user comes back to them from a facility or a cancelled sheet.
@injectable
class UserPurchasesCubit extends Cubit<UserPurchasesState> {
  UserPurchasesCubit(this._getUserPurchases, @factoryParam this.category)
    : super(const UserPurchasesState()) {
    currentManager = .new(
      accessor: (
        getPartialState: (state) => state.currentRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(currentRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _request(UserPurchasePeriod.current),
      refreshInBackground: true,
    );
    historyManager = .new(
      accessor: (
        getPartialState: (state) => state.historyRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(historyRequest: partial),
      ),
      emit: _emitIfOpen,
      defaultRequest: _request(UserPurchasePeriod.history),
      refreshInBackground: true,
    );
  }

  final GetUserPurchasesUseCase _getUserPurchases;

  /// Purchases or gifts.
  final UserPurchaseCategory category;

  late final AsyncRequestManager<UserPurchasesState, List<UserPurchaseEntity>> currentManager;
  late final AsyncRequestManager<UserPurchasesState, List<UserPurchaseEntity>> historyManager;

  AsyncRequestManager<UserPurchasesState, List<UserPurchaseEntity>> managerFor(
    UserPurchasePeriod period,
  ) => switch (period) {
    UserPurchasePeriod.current => currentManager,
    UserPurchasePeriod.history => historyManager,
  };

  AsyncTask<List<UserPurchaseEntity>> _request(UserPurchasePeriod period) =>
      _getUserPurchases(GetUserPurchasesDto(category: category, period: period));

  /// Switches tab, loading History the first time it is shown.
  void selectPeriod(UserPurchasePeriod period) {
    if (period == state.period) return;
    emit(state.copyWith(period: period));

    final manager = managerFor(period);
    if (manager.isIdle) manager.execute();
  }

  /// Re-reads the tab on show, keeping its rows on screen meanwhile.
  Future<void> refresh() => managerFor(state.period).refresh();

  /// Re-reads both tabs that have loaded — after a purchase changed (e.g. was
  /// cancelled), which can move it from one to the other.
  Future<void> refreshAll() async {
    await Future.wait([
      for (final manager in [currentManager, historyManager])
        if (!manager.isIdle) manager.refresh(),
    ]);
  }

  void _emitIfOpen(UserPurchasesState state) {
    if (!isClosed) emit(state);
  }
}
