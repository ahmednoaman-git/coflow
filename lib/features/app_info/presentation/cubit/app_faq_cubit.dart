import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'app_faq_state.dart';

/// Coflow's customer FAQs, opened from the Account tab.
@injectable
class AppFaqCubit extends Cubit<AppFaqState> {
  AppFaqCubit(this._getFaqs) : super(const AppFaqState()) {
    faqsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.faqsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(faqsRequest: partial),
      ),
      emit: _emitIfOpen,
      autoExecute: true,
      defaultRequest: _getFaqs(),
      refreshInBackground: true,
    );
  }

  final GetAppFaqsUseCase _getFaqs;

  late final AsyncRequestManager<AppFaqState, List<AppFaqEntity>> faqsManager;

  Future<void> refresh() => faqsManager.refresh();

  /// Opens or closes one entry; several may be open at once.
  void toggleExpanded(int faqId) {
    final expanded = Set<int>.of(state.expandedIds);
    if (!expanded.remove(faqId)) expanded.add(faqId);
    emit(state.copyWith(expandedIds: expanded));
  }

  void _emitIfOpen(AppFaqState state) {
    if (!isClosed) emit(state);
  }
}
