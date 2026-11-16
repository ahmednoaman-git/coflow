import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/search/data/models/paginated_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Support request endpoints. GET lists (Laravel paginator), POST creates.
abstract final class SupportEndpoints {
  static const String supports = 'supports';
}

@lazySingleton
class SupportRemoteDataSource {
  const SupportRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<PaginatedResponseModel<SupportRequestModel>> getSupportRequests(
    GetSupportRequestsDto dto,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(SupportEndpoints.supports, queryParameters: dto.toQuery());
      return PaginatedResponseModel.fromJson(
        response.data as Map<String, dynamic>,
        SupportRequestModel.fromJson,
      );
    });
  }

  AsyncTask<void> createSupportRequest(CreateSupportRequestDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final image = dto.image;
      final formData = FormData.fromMap({
        'issue': dto.issue,
        if (image != null)
          'image': await MultipartFile.fromFile(image.path, filename: image.uri.pathSegments.last),
      });
      await _dio.post(
        SupportEndpoints.supports,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
    });
  }
}
