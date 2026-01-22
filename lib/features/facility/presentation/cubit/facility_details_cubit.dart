import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'facility_details_state.dart';

@injectable
class FacilityDetailsCubit extends Cubit<FacilityDetailsState> {
  FacilityDetailsCubit(
    this._getFacilityProfile,
    this._getFacilityTickets,
    @factoryParam CollapsedFacilityEntity facility,
  ) : super(FacilityDetailsState(facility: facility)) {
    _initManagers();
  }

  final GetFacilityProfileUseCase _getFacilityProfile;
  final GetFacilityTicketsUseCase _getFacilityTickets;

  late final AsyncRequestManager<FacilityDetailsState, FacilityProfileEntity> profileManager;
  late final AsyncRequestManager<FacilityDetailsState, List<FacilityTicketEntity>> ticketsManager;

  void _initManagers() {
    profileManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.profileRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(profileRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getFacilityProfile(
        GetFacilityProfileDto(facilityId: state.facility.id),
      ),
    );

    ticketsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.ticketsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(ticketsRequest: partial),
      ),
      emit: emit,
      autoExecute: false,
      defaultRequest: _getFacilityTickets(
        GetFacilityTicketsDto(facilityId: state.facility.id),
      ),
    );
  }

  void setSelectedTab(FacilityDetailsTab tab) {
    if (tab == state.selectedTab) return;
    emit(state.copyWith(selectedTab: tab));

    if (tab == FacilityDetailsTab.pricing) {
      ensureTicketsLoaded();
    }
  }

  void setSelectedPricingTab(FacilityPricingTab tab) {
    if (tab == state.selectedPricingTab) return;
    emit(state.copyWith(selectedPricingTab: tab));

    if (tab == FacilityPricingTab.tickets) {
      ensureTicketsLoaded();
    }
  }

  void ensureTicketsLoaded() {
    if (ticketsManager.isLoading || ticketsManager.isSuccess) return;
    ticketsManager.execute();
  }

  Future<void> refreshProfile() => profileManager.refresh();

  Future<void> refreshTickets() => ticketsManager.refresh();
}
