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
  ) : super(ActivityLineFacilitiesState(activityLine: activityLine)) {
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
      autoExecute: true,
      defaultRequest: getLocations(),
    );
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
