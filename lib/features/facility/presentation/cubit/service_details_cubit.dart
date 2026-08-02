import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../../domain/use_cases/use_cases.dart';
import 'service_details_state.dart';

@injectable
class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  ServiceDetailsCubit(
    this._getServiceDetails,
    @factoryParam int serviceId,
    @factoryParam FacilityServiceType type,
  ) : super(ServiceDetailsState(serviceId: serviceId, type: type)) {
    _initManagers();
  }

  final GetFacilityServiceDetailsUseCase _getServiceDetails;

  late final AsyncRequestManager<ServiceDetailsState, FacilityServiceDetailsEntity> detailsManager;

  void _initManagers() {
    detailsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.detailsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(detailsRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getServiceDetails(
        GetFacilityServiceDetailsDto(serviceId: state.serviceId, type: state.type),
      ),
    );
  }

  Future<void> refresh() => detailsManager.refresh();
}
