import 'package:coflow_users_v2/core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Home API endpoints.
abstract final class HomeEndpoints {
  static const String home = 'home';
}

/// Remote data source for home API calls.
@lazySingleton
class HomeRemoteDataSource {
  const HomeRemoteDataSource(this._dio);
  final DioClient _dio;

  /// Fetches home screen data with optional location filter.
  AsyncTask<HomeResponseModel> getHome(HomeRequestDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final formData = FormData.fromMap({
        if (dto.locationType != null) 'location_type': dto.locationType!.value,
        if (dto.cityId != null) 'city_id': dto.cityId,
        if (dto.areaId != null) 'area_id': dto.areaId,
      });

      final response = await _dio.post(
        HomeEndpoints.home,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return HomeResponseModel.fromJson(response.data as Map<String, dynamic>);
    });
  }
}
