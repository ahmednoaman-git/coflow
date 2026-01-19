import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

/// Locations API endpoints.
abstract final class LocationsEndpoints {
  static const String locations = 'locations';
}

/// Remote data source for locations API.
@lazySingleton
class LocationsRemoteDataSource {
  const LocationsRemoteDataSource(this._dio);
  final DioClient _dio;

  /// Fetches all available locations (cities and areas).
  AsyncTask<LocationsResponseModel> getLocations() {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(LocationsEndpoints.locations);
      return LocationsResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }
}
