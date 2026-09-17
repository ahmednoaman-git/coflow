import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'facility_faq_state.dart';

@injectable
class FacilityFaqCubit extends Cubit<FacilityFaqState> {
  FacilityFaqCubit(this._getFacilityFaqs, @factoryParam int facilityId)
    : super(const FacilityFaqState()) {
    faqsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.faqsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(faqsRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getFacilityFaqs(GetFacilityFaqsDto(facilityId: facilityId)),
    );
  }

  final GetFacilityFaqsUseCase _getFacilityFaqs;

  late final AsyncRequestManager<FacilityFaqState, List<FacilityFaqEntity>> faqsManager;

  Future<void> refreshFaqs() => faqsManager.refresh();

  /// Opens or closes one entry. Several may be open at once — the answers are
  /// short and users compare them.
  void toggleExpanded(int faqId) {
    final expanded = Set<int>.of(state.expandedIds);
    if (!expanded.remove(faqId)) expanded.add(faqId);
    emit(state.copyWith(expandedIds: expanded));
  }
}
