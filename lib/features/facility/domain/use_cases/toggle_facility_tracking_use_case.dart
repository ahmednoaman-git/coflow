import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Use case for turning update-tracking on/off for a facility.
///
/// Not called from the facility profile — the design has no tracking control
/// there. Its caller is the Profiles screen's track toggle
/// (`SavedProfilesCubit.toggleTracking`).
///
/// Note the backend couples the two flags: tracking an unsaved facility saves
/// it as well, and un-saving clears the tracking.
@lazySingleton
class ToggleFacilityTrackingUseCase {
  const ToggleFacilityTrackingUseCase(this._repository);
  final FacilityRepository _repository;

  AsyncTask<void> call(ToggleFacilityTrackingDto dto) => _repository.toggleFacilityTracking(dto);
}
