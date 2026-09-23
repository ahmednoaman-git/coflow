import 'package:coflow_users_v2/core/async/async.dart';

import '../entities/entities.dart';

/// Saved facilities ("Profiles") for the signed-in user.
///
/// Only the listing lives here. Saving, unsaving and tracking are the
/// facility's own toggles (`ToggleFacilitySaveUseCase`,
/// `ToggleFacilityTrackingUseCase`), shared with the facility profile screen.
abstract interface class SavedProfilesRepository {
  /// Every facility the user has saved.
  ///
  /// Activity-line filtering is done client-side: the whole list is small and
  /// the filter has to feel instant.
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles();
}
