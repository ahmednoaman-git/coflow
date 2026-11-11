import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/use_cases.dart';
import 'activity_line_facilities_state.dart';

@injectable
class ActivityLineFacilitiesCubit extends Cubit<ActivityLineFacilitiesState> {
  ActivityLineFacilitiesCubit(
    this._getFacilities,
    GetLocationsUseCase getLocations,
    @factoryParam ActivityLineEntity activityLine,
    // Filters the first page straight away; checked against this line's own
    // locations once they load.
    @factoryParam SelectedLocation? initialLocation,
  ) : super(
        ActivityLineFacilitiesState(
          activityLine: activityLine,
          selectedLocation: initialLocation ?? const SelectedLocation(),
        ),
      ) {
    facilitiesManager = PaginatedRequestManager(
      accessor: (
        getPartialState: (state) => state.facilitiesRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) {
          final data = partial.dataOrNull;
          return state.copyWith(
            facilitiesRequest: partial,
            availableTags: data?.tags ?? state.availableTags,
            allFacilitiesTotal: state.selectedTagId == null && data != null
                ? data.total
                : state.allFacilitiesTotal,
          );
        },
      ),
      nextPageAccessor: (
        getPartialState: (state) => state.nextPageRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(nextPageRequest: partial),
      ),
      emit: _emitIfOpen,
      requestPage: _requestFor(state),
      nextPageOf: (data) => data.nextPage,
      merge: (current, next) => current.mergedWith(next),
      autoExecute: true,
    );
    locationsManager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.locationsRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(locationsRequest: partial),
      ),
      emit: _emitIfOpen,
      defaultRequest: getLocations(activityLineId: activityLine.id),
    );
    Future.microtask(_loadLocations);
  }

  Future<void> _loadLocations() async {
    await locationsManager.execute();
    if (isClosed) return;
    final locations = state.locationsRequest.dataOrNull;
    // On failure the opening selection simply stays.
    if (locations == null) return;

    switch (locations.match(state.selectedLocation)) {
      // This line has nothing there: show all of it instead.
      case null:
        selectLocation(const SelectedLocation());
      case final matched when matched != state.selectedLocation:
        // Same place, names as this line spells them; the facilities already
        // loaded for it stand.
        emit(state.copyWith(selectedLocation: matched));
      default:
        break;
    }
  }

  final GetFacilitiesUseCase _getFacilities;
  late final PaginatedRequestManager<ActivityLineFacilitiesState, ActivityLineFacilitiesEntity>
  facilitiesManager;
  late final AsyncRequestManager<ActivityLineFacilitiesState, LocationsEntity> locationsManager;

  AsyncTask<ActivityLineFacilitiesEntity> Function(int) _requestFor(
    ActivityLineFacilitiesState snapshot,
  ) => (page) {
    final location = snapshot.selectedLocation;
    return _getFacilities(
      GetFacilitiesDto(
        activityLineId: snapshot.activityLine.id,
        tagId: snapshot.selectedTagId,
        page: page,
        locationType: location.isRemote
            ? LocationType.remoteLocation.value
            : location.cityId != null
            ? LocationType.addressBased.value
            : null,
        cityId: location.isRemote ? null : location.cityId,
        areaId: location.isRemote ? null : location.areaId,
      ),
    );
  };

  void handleTagSelection(int tagId) {
    emit(state.copyWith(selectedTagId: state.selectedTagId == tagId ? null : tagId));
    facilitiesManager.execute(requestPage: _requestFor(state));
  }

  void clearSelectedTags() {
    if (state.selectedTagId == null) return;
    emit(state.copyWith(selectedTagId: null));
    facilitiesManager.execute(requestPage: _requestFor(state));
  }

  void selectLocation(SelectedLocation location) {
    if (location == state.selectedLocation) return;
    emit(state.copyWith(selectedLocation: location, allFacilitiesTotal: null));
    facilitiesManager.execute(requestPage: _requestFor(state));
  }

  Future<void> refresh() => facilitiesManager.refresh();
  Future<void> loadMore() => facilitiesManager.loadMore();

  void _emitIfOpen(ActivityLineFacilitiesState next) {
    if (!isClosed) emit(next);
  }

  @override
  Future<void> close() {
    facilitiesManager.dispose();
    return super.close();
  }
}
