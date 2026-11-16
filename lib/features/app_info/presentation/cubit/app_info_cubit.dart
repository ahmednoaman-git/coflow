import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'app_info_state.dart';

/// Loads `GET info` for the Terms & Conditions and Privacy Policy screens.
@injectable
class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit(this._getAppInfo) : super(const AppInfoState()) {
    infoManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.infoRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(infoRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getAppInfo(),
      refreshInBackground: true,
    );
  }

  final GetAppInfoUseCase _getAppInfo;

  late final AsyncRequestManager<AppInfoState, AppInfoEntity> infoManager;

  Future<void> refresh() => infoManager.refresh();

  void _emitIfOpen(AppInfoState state) {
    if (!isClosed) emit(state);
  }
}
