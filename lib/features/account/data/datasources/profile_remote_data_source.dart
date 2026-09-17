import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

/// Profile API endpoints.
abstract final class ProfileEndpoints {
  static const String profile = 'profile';
  static const String accountStatistics = 'account-statistics';
}

/// Remote data source for the signed-in user's profile.
@lazySingleton
class ProfileRemoteDataSource {
  const ProfileRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<ProfileModel> getProfile() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.post(ProfileEndpoints.profile);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<AccountStatisticsModel> getAccountStatistics() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(ProfileEndpoints.accountStatistics);
      return AccountStatisticsModel.fromJson(response.data as Map<String, dynamic>);
    });
  }
}
