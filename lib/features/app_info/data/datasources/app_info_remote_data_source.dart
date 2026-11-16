import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

/// Public app-content endpoints (no sign-in needed).
abstract final class AppInfoEndpoints {
  static const String faqs = 'admin-faq';
  static const String info = 'info';
}

@lazySingleton
class AppInfoRemoteDataSource {
  const AppInfoRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<List<AppFaqModel>> getFaqs() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(AppInfoEndpoints.faqs);
      return (response.data as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(AppFaqModel.fromJson)
          .toList(growable: false);
    });
  }

  AsyncTask<AppInfoModel> getAppInfo() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(AppInfoEndpoints.info);
      return AppInfoModel.fromJson(response.data as Map<String, dynamic>);
    });
  }
}
