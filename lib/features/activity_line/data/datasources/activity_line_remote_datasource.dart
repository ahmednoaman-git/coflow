import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/network/interceptors/data_extractor_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

abstract final class ActivityLineEndpoints {
  static const String facilities = 'facilities';
}

@lazySingleton
class ActivityLineRemoteDataSource {
  const ActivityLineRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<FacilitiesResponseModel> getFacilities(GetFacilitiesDto dto) =>
      AsyncTaskExtension.tryCatchMapDioToFailure(() async {
        final response = await _dio.post(
          ActivityLineEndpoints.facilities,
          data: FormData.fromMap(dto.toJson()),
          options: Options(contentType: 'multipart/form-data'),
        );
        return FacilitiesResponseModel.fromApi(
          response.data as Map<String, dynamic>,
          response.extra[DataExtractorInterceptor.extraDataKey] as Map<String, dynamic>,
        );
      });
}
