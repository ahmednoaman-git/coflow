import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../activity_line/domain/entities/collapsed_facility_entity.dart';
import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/enums/enums.dart';
import '../../domain/events/events.dart';
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
    this._saveEvents,
    @factoryParam CollapsedFacilityEntity facility,

    /// Whether [facility] is a preview — only its id, name, title, images and
    /// activity line are known — to be completed from the profile.
    @factoryParam bool? isPreview,
  ) : super(FacilityDetailsState(facility: facility, isResolved: !(isPreview ?? false))) {
    _initManagers();
    _saveChanges = _saveEvents.changes.listen(_onSaveChange);
  }

  final GetFacilityProfileUseCase _getFacilityProfile;
  final GetFacilityTicketsUseCase _getFacilityTickets;
  final GetFacilityPromotionsUseCase _getFacilityPromotions;
  final GetFacilityServicesUseCase _getFacilityServices;
  final ToggleFacilitySaveUseCase _toggleFacilitySave;
  final FacilitySaveEvents _saveEvents;
  late final StreamSubscription<FacilitySaveChange> _saveChanges;

  late final AsyncRequestManager<FacilityDetailsState, FacilityProfileEntity> profileManager;
  late final AsyncRequestManager<FacilityDetailsState, List<FacilityPromotionEntity>>
  promotionsManager;
  late final AsyncRequestManager<FacilityDetailsState, List<FacilityTicketEntity>> ticketsManager;
  late final AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> activitiesManager;
  late final AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> flowsManager;
  late final AsyncRequestManager<FacilityDetailsState, FacilityServicesEntity> coursesManager;

  void _initManagers() {
    profileManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.profileRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) =>
            _withProfile(state.copyWith(profileRequest: partial), partial.dataOrNull),
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
    );

    flowsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.flowsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(flowsRequest: partial),
      ),
      emit: emit,
    );

    coursesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.coursesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(coursesRequest: partial),
      ),
      emit: emit,
    );
  }

  /// How long the bookmark must be left alone before its taps are sent.
  @visibleForTesting
  static Duration saveSettle = const Duration(milliseconds: 400);

  /// Created on the first tap, from the loaded profile's flag.
  ConsolidatedToggle? _save;

  /// Whether the server has the facility tracked, as of the last save state
  /// it confirmed.
  bool _tracked = false;

  /// Saves or unsaves the facility — optimistically, and safe to spam.
  ///
  /// The bookmark flips on every tap, but the endpoint is a bare toggle, so
  /// the taps are merged ([ConsolidatedToggle]): nothing is sent until they
  /// stop, then one call only if the net state changed, never two at once. A
  /// failure puts the bookmark back to what the server holds and reports it in
  /// [FacilityDetailsState.saveRequest], which also reports each settled
  /// change.
  ///
  /// Un-saving drops tracking with it: the backend stores tracking against the
  /// saved-facility row, so removing the save clears `has_track` too. Mirroring
  /// that here keeps the bell from staying lit on a facility that is no longer
  /// saved — and a save undone before it was sent leaves tracking as it was.
  void toggleSave() {
    final profile = profileManager.data;
    if (profile == null || isClosed) return;

    emit(state.copyWith(saveRequest: const AsyncState.idle()));
    (_save ??= _createSaveToggle(profile)).flip();
  }

  /// The bookmark as an optimistic edit on the loaded profile
  /// ([OptimisticToggleManager.optimisticToggle]): each tap shows at once, and
  /// a failure puts it back. The outcome is reported in
  /// [FacilityDetailsState.saveRequest], which has its own messages, rather
  /// than beside the profile.
  ConsolidatedToggle _createSaveToggle(FacilityProfileEntity profile) {
    _tracked = profile.isTracked;
    return profileManager.optimisticToggle(
      value: profile.isSaved,
      settle: saveSettle,
      send: () => _toggleFacilitySave(ToggleFacilitySaveDto(facilityId: profile.id)),
      show: (profile, saved) => profile.copyWith(isSaved: saved, isTracked: saved && _tracked),
      onConfirmed: (saved) {
        if (!saved) _tracked = false;
      },
      onSettled: (saved) {
        _reportSaved(saved);
        _emitIfOpen(state.copyWith(saveRequest: AsyncState.success(saved)));
      },
      onFailed: (failure, saved) {
        // A step may have landed before the one that failed.
        _reportSaved(saved);
        _emitIfOpen(state.copyWith(saveRequest: AsyncState.error(failure)));
      },
      reportFailure: false,
    );
  }

  /// Tells the other screens showing this facility what the server now holds.
  void _reportSaved(bool saved) => _saveEvents.report(
    FacilitySaveChange(
      facilityId: state.facility.id,
      isSaved: saved,
      isTracked: saved && _tracked,
      source: this,
    ),
  );

  /// Another screen changed this facility's flags — e.g. unsaved it from the
  /// Profiles list while this profile stayed open in another tab. Its news
  /// wins: taps not yet sent from here are dropped, and the next tap starts
  /// from the flags as shown.
  void _onSaveChange(FacilitySaveChange change) {
    if (isClosed || change.source == this || change.facilityId != state.facility.id) return;

    _tracked = change.isTracked;
    final save = _save;
    _save = null;
    unawaited(save?.discard());
    profileManager.update(
      (profile) => profile.copyWith(isSaved: change.isSaved, isTracked: change.isTracked),
    );
  }

  void _emitIfOpen(FacilityDetailsState next) {
    if (!isClosed) emit(next);
  }

  @override
  Future<void> close() {
    unawaited(_saveChanges.cancel());
    // A tap made just before leaving still reaches the server.
    unawaited(_save?.close());
    return super.close();
  }

  /// Brings the facility the screen was opened with up to date with a freshly
  /// read [profile].
  ///
  /// A preview (see [FacilityDetailsState.isResolved]) takes its whole summary
  /// from the first profile read: until then the screen cannot tell which tabs
  /// the facility has. A full copy — a list card's — only takes the payment
  /// type: the card can be stale (a results list left open while the facility
  /// switched to `contact`), and the pricing tab decides between "Purchase
  /// Now" and "Contact" from it. Its subscription is left alone, as it also
  /// decides which tabs exist, and those must not change under the user.
  static FacilityDetailsState _withProfile(
    FacilityDetailsState state,
    FacilityProfileEntity? profile,
  ) {
    if (profile == null) return state;
    final facility = state.facility;

    if (!state.isResolved) {
      return state.copyWith(
        isResolved: true,
        facility: facility.copyWith(
          accountType: profile.accountType ?? facility.accountType,
          subscriptionStatus: profile.subscriptionStatus ?? facility.subscriptionStatus,
          status: profile.status ?? facility.status,
          statusMessage: profile.statusMessage ?? facility.statusMessage,
          paymentType: profile.paymentType ?? facility.paymentType,
          views: profile.views ?? facility.views,
          likeCount: profile.likesCount ?? facility.likeCount,
        ),
      );
    }

    final paymentType = profile.paymentType;
    if (paymentType == null) return state;
    return state.copyWith(facility: facility.copyWith(paymentType: paymentType));
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
    // Built now rather than up front: a preview learns its account type, which
    // decides the request, only once the profile is in.
    manager.execute(
      _getFacilityServices(
        GetFacilityServicesDto(
          facilityId: state.facility.id,
          type: type,
          accountType: state.facility.accountType,
        ),
      ),
    );
  }

  Future<void> refreshServices(FacilityServiceType type) => servicesManagerFor(type).refresh();
}
