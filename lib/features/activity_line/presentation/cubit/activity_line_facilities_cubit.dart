import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'activity_line_facilities_state.dart';

/// Cubit for managing activity line facilities screen state.
@injectable
class ActivityLineFacilitiesCubit extends Cubit<ActivityLineFacilitiesState> {
  ActivityLineFacilitiesCubit(
    this._getFacilitiesUseCase,
    this._filterFacilitiesUseCase,
    this._getLocationsUseCase,
    @factoryParam ActivityLineEntity activityLine,
  ) : super(ActivityLineFacilitiesState(activityLine: activityLine)) {
    _initManagers();
  }

  final GetFacilitiesUseCase _getFacilitiesUseCase;
  final FilterFacilitiesUseCase _filterFacilitiesUseCase;
  final GetLocationsUseCase _getLocationsUseCase;

  /// Manager for facilities request.
  late final AsyncRequestManager<ActivityLineFacilitiesState, ActivityLineFacilitiesEntity>
  facilitiesManager;

  /// Manager for locations request.
  late final AsyncRequestManager<ActivityLineFacilitiesState, LocationsEntity> locationsManager;

  void _initManagers() {
    facilitiesManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.facilitiesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(facilitiesRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      // Default to "All" (no location filter) if supported, or provide logic to pick one.
      // Since city_id is required for addressBased, we shouldn't use addressBased without a city.
      // We will assume sending just activityLineId fits 'All'.
      defaultRequest: _getFacilitiesUseCase(
        GetFacilitiesDto(
          activityLineId: state.activityLine.id,
        ),
      ),
    );

    locationsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.locationsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(locationsRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getLocationsUseCase(),
    );
  }

  /// Gets filtered facilities based on selected tags.
  List<CollapsedFacilityEntity> get filteredFacilities {
    return _filterFacilitiesUseCase(
      facilities: state.facilities,
      tagIds: state.selectedTagIds,
    );
  }

  /// Handles tag selection toggle.
  void handleTagSelection(int tagId) {
    final selectedTagIds = state.selectedTagIds.contains(tagId)
        ? state.selectedTagIds.where((id) => id != tagId).toList()
        : [...state.selectedTagIds, tagId];

    emit(state.copyWith(selectedTagIds: selectedTagIds));
  }

  /// Clears all selected tags.
  void clearSelectedTags() {
    emit(state.copyWith(selectedTagIds: []));
  }

  /// Selects a location and refreshes facilities.
  void selectLocation(SelectedLocation location) {
    emit(state.copyWith(selectedLocation: location));

    final dto = location.isRemote
        ? GetFacilitiesDto.remote(activityLineId: state.activityLine.id)
        : location.cityId != null
        ? GetFacilitiesDto.addressBased(
            activityLineId: state.activityLine.id,
            cityId: location.cityId,
            areaId: location.areaId,
          )
        : GetFacilitiesDto(activityLineId: state.activityLine.id); // All / No filter default

    facilitiesManager.execute(_getFacilitiesUseCase(dto));
  }

  /// Refreshes facilities with current filters.
  Future<void> refresh() => facilitiesManager.refresh();
}
