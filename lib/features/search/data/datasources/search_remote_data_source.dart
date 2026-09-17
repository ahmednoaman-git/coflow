import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/data/data.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../models/models.dart';

/// Search API endpoints.
abstract final class SearchEndpoints {
  static const String search = 'search';
}

/// Remote data source for the search endpoint.
///
/// The endpoint serves one result set per call (`type`), so each result list
/// has its own method over the same path.
@lazySingleton
class SearchRemoteDataSource {
  const SearchRemoteDataSource(this._dio);
  final DioClient _dio;

  AsyncTask<PaginatedResponseModel<FacilityModel>> searchBusinesses(SearchDto dto) =>
      _search(dto, FacilityModel.fromJson);

  AsyncTask<PaginatedResponseModel<SearchInstructorModel>> searchInstructors(SearchDto dto) =>
      _search(dto, SearchInstructorModel.fromJson);

  AsyncTask<PaginatedResponseModel<SearchServiceModel>> searchServices(SearchDto dto) =>
      _search(dto, SearchServiceModel.fromJson);

  AsyncTask<PaginatedResponseModel<T>> _search<T>(
    SearchDto dto,
    T Function(Map<String, dynamic> json) itemFromJson,
  ) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(
        SearchEndpoints.search,
        queryParameters: dto.toQueryParameters(),
      );

      return PaginatedResponseModel<T>.fromJson(
        response.data as Map<String, dynamic>,
        itemFromJson,
      );
    });
  }
}
