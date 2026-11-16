import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Contract for reading and editing the signed-in user's profile.
abstract interface class ProfileRepository {
  /// Fetches the signed-in user's identity.
  AsyncTask<ProfileEntity> getProfile();

  /// Fetches current Account counters independently of profile availability.
  AsyncTask<ProfileStatsEntity> getAccountStatistics();

  /// Saves the account details, then returns the profile as the server now
  /// has it.
  AsyncTask<ProfileEntity> updateProfile(UpdateProfileDto dto);

  /// Uploads a new profile photo, then returns the profile as the server now
  /// has it.
  AsyncTask<ProfileEntity> changeProfileImage(ChangeProfileImageDto dto);

  /// Sets a new password for the signed-in user.
  AsyncTask<void> changePassword(ChangePasswordDto dto);

  /// Permanently deletes the signed-in account, then signs out on this device.
  /// Nothing is cleared locally unless the server confirmed the deletion.
  AsyncTask<void> deleteAccount();

  /// The nationalities the backend accepts for `POST profile`.
  AsyncTask<List<NationalityEntity>> getNationalities();
}
