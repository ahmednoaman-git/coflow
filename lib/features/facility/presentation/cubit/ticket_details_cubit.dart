import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'ticket_details_state.dart';

@injectable
class TicketDetailsCubit extends Cubit<TicketDetailsState> {
  TicketDetailsCubit(
    this._getTicketDetails,
    @factoryParam int ticketId,
  ) : super(TicketDetailsState(ticketId: ticketId)) {
    _initManagers();
  }

  final GetFacilityTicketDetailsUseCase _getTicketDetails;

  late final AsyncRequestManager<TicketDetailsState, FacilityTicketDetailsEntity> detailsManager;

  void _initManagers() {
    detailsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.detailsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(detailsRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getTicketDetails(
        GetFacilityTicketDetailsDto(ticketId: state.ticketId),
      ),
    );
  }

  Future<void> refresh() => detailsManager.refresh();
}
