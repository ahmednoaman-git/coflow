import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

/// Implementation of [ProfileRepository].
@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._remote, this._authStateManager);

  final ProfileRemoteDataSource _remote;
  final AuthStateManager _authStateManager;

  @override
  AsyncTask<ProfileStatsEntity> getAccountStatistics() =>
      _remote.getAccountStatistics().map(ProfileMapper.statsToEntity);

  @override
  AsyncTask<ProfileEntity> getProfile() {
    return _remote.getProfile().flatMap((model) {
      // Overwrite what login cached, so the next cold start paints the user
      // from current data instead of whatever was true at sign-in.
      return _authStateManager
          .setUserData(model.user.toJson())
          .map((_) => ProfileMapper.toEntity(model));
    });
  }

  // The write endpoints' responses aren't documented, so each write re-reads
  // the profile: the screen then shows exactly what the server stored (e.g. the
  // new photo's URL), and the cached user is refreshed with it.
  @override
  AsyncTask<ProfileEntity> updateProfile(UpdateProfileDto dto) =>
      _remote.updateProfile(dto).flatMap((_) => getProfile());

  @override
  AsyncTask<ProfileEntity> changeProfileImage(ChangeProfileImageDto dto) =>
      _remote.changeProfileImage(dto).flatMap((_) => getProfile());

  @override
  AsyncTask<void> changePassword(ChangePasswordDto dto) => _remote.changePassword(dto);

  @override
  AsyncTask<List<NationalityEntity>> getNationalities() => _remote.getNationalities().map(
    (models) => [
      for (final model in models)
        if (model.name.trim().isNotEmpty) ProfileMapper.nationalityToEntity(model),
    ],
  );
}
