import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/get_home_use_case.dart';
import 'home_state.dart';

/// Cubit for managing home screen state.
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHomeUseCase) : super(const HomeState());
  final GetHomeUseCase _getHomeUseCase;

  /// Manager for home data request.
  late final homeManager = AsyncRequestManager<HomeState, HomeEntity>(
    accessor: (
      getPartialState: (state) => state.homeRequest,
      getWholeState: () => state,
      setWholeState: (state, partial) => state.copyWith(homeRequest: partial),
    ),
    emit: emit,
    autoExecute: true,
    defaultRequest: _getHomeUseCase(const HomeRequestDto()),
  );

  /// Refreshes home data.
  Future<void> refresh() => homeManager.refresh();

  /// Filters businesses by activity line.
  void filterByActivityLine(int? activityLineId) {
    emit(state.copyWith(selectedActivityLineId: activityLineId));
  }
}
