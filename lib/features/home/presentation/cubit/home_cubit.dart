import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/use_cases/get_home_use_case.dart';
import 'home_state.dart';

/// Cubit for managing home screen state.
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getHomeUseCase, this._getLocationsUseCase) : super(const HomeState()) {
    homeManager = .new(
      accessor: (
        getPartialState: (state) => state.homeRequest,
        getWholeState: () => state,
        setWholeState: (state, partial) => state.copyWith(homeRequest: partial),
      ),
      emit: emit,
      autoExecute: true,
      defaultRequest: _getHomeUseCase(const HomeRequestDto()),
    );

    locationsManager = .new(
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

  final GetHomeUseCase _getHomeUseCase;
  final GetLocationsUseCase _getLocationsUseCase;

  /// Manager for home data request.
  late final AsyncRequestManager<HomeState, HomeEntity> homeManager;

  /// Manager for locations request.
  late final AsyncRequestManager<HomeState, LocationsEntity> locationsManager;

  /// Refreshes home data.
  Future<void> refresh() => homeManager.refresh();

  /// Filters businesses by activity line.
  void filterByActivityLine(int? activityLineId) {
    emit(state.copyWith(selectedActivityLineId: activityLineId));
  }

  /// Takes on a location the user picked on a screen opened from here (an
  /// activity line's), so the dashboard is filtered the same way on return —
  /// but only when this screen's own list has the place. Otherwise, or while
  /// that list hasn't loaded, the current selection stands.
  void adoptLocation(SelectedLocation location) {
    if (isClosed) return;
    final matched = state.locationsRequest.dataOrNull?.match(location);
    if (matched == null || matched == state.selectedLocation) return;
    selectLocation(matched);
  }

  /// Updates the selected location and refreshes home data.
  void selectLocation(SelectedLocation location) {
    emit(state.copyWith(selectedLocation: location));

    // Refresh home data with new location filter
    final request = location.isRemote
        ? const HomeRequestDto(locationType: LocationType.remoteLocation)
        : HomeRequestDto(
            locationType: location.cityId != null ? LocationType.addressBased : null,
            cityId: location.cityId,
            areaId: location.areaId,
          );

    homeManager.execute(_getHomeUseCase(request));
  }
}
