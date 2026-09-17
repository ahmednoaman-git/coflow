import 'package:coflow_users_v2/core/core.dart';

import '../entities/entities.dart';

/// Contract for reading the signed-in user's profile.
abstract interface class ProfileRepository {
  /// Fetches the signed-in user's identity.
  AsyncTask<ProfileEntity> getProfile();

  /// Fetches current Account counters independently of profile availability.
  AsyncTask<ProfileStatsEntity> getAccountStatistics();
}
