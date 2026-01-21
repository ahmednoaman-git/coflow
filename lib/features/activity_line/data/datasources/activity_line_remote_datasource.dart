import 'package:coflow_users_v2/core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

/// Activity line API endpoints.
abstract final class ActivityLineEndpoints {
  static const String facilities = 'facilities';
}

/// Remote data source for activity line API calls.
@lazySingleton
class ActivityLineRemoteDataSource {
  const ActivityLineRemoteDataSource(this._dio);
  final DioClient _dio;

  /// Fetches facilities for an activity line with optional filters.
  AsyncTask<FacilitiesResponseModel> getFacilities(GetFacilitiesDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final formData = FormData.fromMap(dto.toJson());

      final response = await _dio.post(
        ActivityLineEndpoints.facilities,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      final dynamic data = response.data;

      if (data is List) {
        final facilities = data
            .map((e) => FacilityModel.fromJson(e as Map<String, dynamic>))
            .toList();

        // Extract unique tags from the facilities to satisfy FacilitiesResponseModel
        final tagCounts = <int, int>{};
        final tagModels = <int, TagModel>{};

        for (final facility in facilities) {
          if (facility.tags != null) {
            for (final tag in facility.tags!) {
              tagCounts[tag.id] = (tagCounts[tag.id] ?? 0) + 1;
              tagModels[tag.id] = tag;
            }
          }
        }

        final tags = tagModels.entries
            .map(
              (e) => TagWithCountModel(
                id: e.key,
                name: e.value.name,
                count: tagCounts[e.key]!,
              ),
            )
            .toList();

        return FacilitiesResponseModel(facilities: facilities, tags: tags);
      }

      return FacilitiesResponseModel.fromJson(
        data as Map<String, dynamic>,
      );
    });
  }
}
