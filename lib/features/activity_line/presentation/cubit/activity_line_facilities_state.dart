import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'activity_line_facilities_state.freezed.dart';

/// State for [ActivityLineFacilitiesCubit].
@freezed
abstract class ActivityLineFacilitiesState with _$ActivityLineFacilitiesState {
  const ActivityLineFacilitiesState._();

  const factory ActivityLineFacilitiesState({
    /// The activity line being displayed.
    required ActivityLineEntity activityLine,

    /// Async state for facilities request.
    @Default(AsyncState.idle()) AsyncState<ActivityLineFacilitiesEntity> facilitiesRequest,

    @Default(AsyncState.idle()) AsyncState<void> nextPageRequest,

    /// Complete API tag catalog, retained while a filter request is in flight.
    @Default([]) List<TagWithCountEntity> availableTags,

    /// Unfiltered total for the current location, not the loaded page size.
    int? allFacilitiesTotal,

    /// Async state for locations request.
    @Default(AsyncState.idle()) AsyncState<LocationsEntity> locationsRequest,

    /// The endpoint accepts one tag ID at a time.
    int? selectedTagId,

    /// Selected location for filtering.
    @Default(SelectedLocation()) SelectedLocation selectedLocation,

    /// Whether the user has confirmed their location selection.
    @Default(false) bool hasLockedInSelection,
  }) = _ActivityLineFacilitiesState;

  /// All facilities from the request.
  List<CollapsedFacilityEntity> get facilities =>
      facilitiesRequest.dataOrNull?.facilities ?? const [];

  /// All tags from the request.
  List<TagWithCountEntity> get tags => availableTags;

  /// Whether no location filter is applied.
  bool get nothingIsSelected => selectedLocation.isEmpty;

  /// Count of selected locations.
  int get selectedLocationCount => selectedLocation.isEmpty ? 0 : 1;

  /// List of cities from the locations request.
  List<LocationCityEntity> get cities => locationsRequest.dataOrNull?.cities ?? [];

  /// Remote location count from the locations request.
  int get remoteCount => locationsRequest.dataOrNull?.remoteCount ?? 0;
}
