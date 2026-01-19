import 'package:coflow_users_v2/core/async/types.dart';
import 'package:coflow_users_v2/core/domain/entities/entities.dart';
import 'package:coflow_users_v2/core/domain/repositories/locations_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case for fetching available locations.
@lazySingleton
class GetLocationsUseCase {
  const GetLocationsUseCase(this._repository);
  final LocationsRepository _repository;

  /// Fetches all available locations (cities and areas).
  AsyncTask<LocationsEntity> call() => _repository.getLocations();
}
