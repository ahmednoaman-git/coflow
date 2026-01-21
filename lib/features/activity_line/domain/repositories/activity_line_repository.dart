import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Repository interface for activity line feature.
abstract interface class ActivityLineRepository {
  /// Gets facilities for an activity line with optional filters.
  AsyncTask<ActivityLineFacilitiesEntity> getFacilities(GetFacilitiesDto dto);
}
