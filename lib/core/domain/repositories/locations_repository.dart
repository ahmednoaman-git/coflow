import 'package:coflow_users_v2/core/async/types.dart';

import '../entities/entities.dart';

/// Repository interface for locations data.
abstract interface class LocationsRepository {
  /// Fetches all available locations (cities and areas).
  AsyncTask<LocationsEntity> getLocations();
}
