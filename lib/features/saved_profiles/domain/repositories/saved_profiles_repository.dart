import 'package:coflow_users_v2/core/async/async.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Saved facilities ("Profiles") for the signed-in user.
abstract interface class SavedProfilesRepository {
  /// Every facility the user has saved, newest first.
  ///
  /// Activity-line filtering is done client-side: the whole list is small and
  /// the filter has to feel instant.
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles();

  /// Removes a facility from the saved list.
  AsyncTask<void> unsaveProfile(UnsaveProfileDto dto);

  /// Turns update-tracking on or off for a saved facility.
  AsyncTask<void> setProfileTracking(SetProfileTrackingDto dto);
}
