import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

abstract final class ActivityPreferencesEndpoints {
  static const String accountTags = 'account-tags';
  static const String accountPreferences = 'account-preferences';
}

@lazySingleton
class ActivityPreferencesRemoteDataSource {
  const ActivityPreferencesRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<List<PreferenceActivityLineModel>> getAccountTags() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(ActivityPreferencesEndpoints.accountTags);
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(PreferenceActivityLineModel.fromJson)
          .toList(growable: false);
    });
  }

  AsyncTask<void> savePreferences(SaveActivityPreferencesDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.post(ActivityPreferencesEndpoints.accountPreferences, data: dto.toJson());
    });
  }
}
