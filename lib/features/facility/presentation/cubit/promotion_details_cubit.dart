import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'promotion_details_state.dart';

@injectable
class PromotionDetailsCubit extends Cubit<PromotionDetailsState> {
  PromotionDetailsCubit(
    this._getPromotionDetails,
    @factoryParam int promotionId,
  ) : super(PromotionDetailsState(promotionId: promotionId)) {
    _initManagers();
  }

  final GetFacilityPromotionDetailsUseCase _getPromotionDetails;

  late final AsyncRequestManager<PromotionDetailsState, FacilityPromotionDetailsEntity>
  detailsManager;

  void _initManagers() {
    detailsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.detailsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(detailsRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getPromotionDetails(
        GetFacilityPromotionDetailsDto(promotionId: state.promotionId),
      ),
    );
  }

  Future<void> refresh() => detailsManager.refresh();
}
