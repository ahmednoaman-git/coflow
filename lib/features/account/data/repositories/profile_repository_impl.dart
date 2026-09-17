import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

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
}
