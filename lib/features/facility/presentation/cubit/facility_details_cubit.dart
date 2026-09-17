import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../../domain/use_cases/use_cases.dart';
import 'facility_details_state.dart';

@injectable
class FacilityDetailsCubit extends Cubit<FacilityDetailsState> {
  FacilityDetailsCubit(
    this._getFacilityProfile,
    this._getFacilityTickets,
    this._getFacilityPromotions,
    this._getFacilityServices,
    this._toggleFacilitySave,
    @factoryParam CollapsedFacilityEntity facility,
  ) : super(FacilityDetailsState(facility: facility)) {
    _initManagers();
  }

  final GetFacilityProfileUseCase _getFacilityProfile;
  final GetFacilityTicketsUseCase _getFacilityTickets;
  final GetFacilityPromotionsUseCase _getFacilityPromotions;
  final GetFacilityServicesUseCase _getFacilityServices;
  final ToggleFacilitySaveUseCase _toggleFacilitySave;

  late final AsyncRequestManager<FacilityDetailsState, FacilityProfileEntity> profileManager;
  late final AsyncRequestManager<FacilityDetailsState, List<FacilityPromotionEntity>>
  promotionsManager;
  late final AsyncRequestManager<FacilityDetailsState, List<FacilityTicketEntity>> ticketsManager;
  late final AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> activitiesManager;
  late final AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> flowsManager;
  late final AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> coursesManager;
  late final AsyncRequestManager<FacilityDetailsState, void> saveManager;

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

    promotionsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.promotionsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(promotionsRequest: partial),
      ),
      emit: emit,
      autoExecute: false,
      defaultRequest: _getFacilityPromotions(
        GetFacilityPromotionsDto(facilityId: state.facility.id),
      ),
    );

    activitiesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.activitiesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(activitiesRequest: partial),
      ),
      emit: emit,
      autoExecute: false,
      defaultRequest: _getFacilityServices(
        GetFacilityServicesDto(
          facilityId: state.facility.id,
          type: FacilityServiceType.activity,
          accountType: state.facility.accountType,
        ),
      ),
    );

    flowsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.flowsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(flowsRequest: partial),
      ),
      emit: emit,
      autoExecute: false,
      defaultRequest: _getFacilityServices(
        GetFacilityServicesDto(
          facilityId: state.facility.id,
          type: FacilityServiceType.flow,
          accountType: state.facility.accountType,
        ),
      ),
    );

    coursesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.coursesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(coursesRequest: partial),
      ),
      emit: emit,
      autoExecute: false,
      defaultRequest: _getFacilityServices(
        GetFacilityServicesDto(
          facilityId: state.facility.id,
          type: FacilityServiceType.course,
          accountType: state.facility.accountType,
        ),
      ),
    );

    // No `defaultRequest`: the toggle is user-triggered and gets its task
    // handed to `execute` at the moment of the tap.
    saveManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.saveRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(saveRequest: partial),
      ),
      emit: emit,
    );
  }

  /// Saves or unsaves the facility.
  ///
  /// The endpoint is a toggle that reports no resulting state, so the flags are
  /// flipped optimistically and rolled back if the call fails — which also
  /// keeps the bookmark responsive on a slow connection.
  ///
  /// Un-saving drops tracking with it: the backend stores tracking against the
  /// saved-facility row, so removing the save clears `has_track` too. Mirroring
  /// that here keeps the bell from staying lit on a facility that is no longer
  /// saved.
  Future<void> toggleSave() async {
    final profile = profileManager.data;
    if (profile == null || saveManager.isLoading) return;

    final isSaved = !profile.isSaved;
    _emitProfile(
      profile.copyWith(isSaved: isSaved, isTracked: isSaved && profile.isTracked),
    );
    await saveManager.execute(_toggleFacilitySave(ToggleFacilitySaveDto(facilityId: profile.id)));

    if (saveManager.isError) _emitProfile(profile);
  }

  /// Writes a locally-adjusted profile back into the loaded state, so the whole
  /// screen reads the flags from one place.
  void _emitProfile(FacilityProfileEntity profile) {
    emit(state.copyWith(profileRequest: AsyncState.success(profile)));
  }

  void setSelectedTab(FacilityDetailsTab tab) {
    if (tab == state.selectedTab) return;
    emit(state.copyWith(selectedTab: tab));

    if (tab == FacilityDetailsTab.pricing) {
      _ensurePricingTabLoaded(state.selectedPricingTab);
    }
  }

  void setSelectedPricingTab(FacilityPricingTab tab) {
    if (tab == state.selectedPricingTab) return;
    emit(state.copyWith(selectedPricingTab: tab));

    _ensurePricingTabLoaded(tab);
  }

  void _ensurePricingTabLoaded(FacilityPricingTab tab) {
    switch (tab) {
      case FacilityPricingTab.tickets:
        ensureTicketsLoaded();
      case FacilityPricingTab.promotions:
        ensurePromotionsLoaded();
    }
  }

  void ensureTicketsLoaded() {
    if (ticketsManager.isLoading || ticketsManager.isSuccess) return;
    ticketsManager.execute();
  }

  void ensurePromotionsLoaded() {
    if (promotionsManager.isLoading || promotionsManager.isSuccess) return;
    promotionsManager.execute();
  }

  Future<void> refreshProfile() => profileManager.refresh();

  Future<void> refreshPromotions() => promotionsManager.refresh();

  Future<void> refreshTickets() => ticketsManager.refresh();

  /// Returns the manager backing the given services listing [type], so the
  /// services tab UI can stay generic across activities/flows/courses.
  AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> servicesManagerFor(
    FacilityServiceType type,
  ) {
    return switch (type) {
      FacilityServiceType.activity => activitiesManager,
      FacilityServiceType.flow => flowsManager,
      FacilityServiceType.course => coursesManager,
    };
  }

  void ensureServicesLoaded(FacilityServiceType type) {
    final manager = servicesManagerFor(type);
    if (manager.isLoading || manager.isSuccess) return;
    manager.execute();
  }

  Future<void> refreshServices(FacilityServiceType type) => servicesManagerFor(type).refresh();
}
