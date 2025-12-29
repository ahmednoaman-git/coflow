import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Repository interface for home data.
abstract interface class HomeRepository {
  /// Fetches home screen data with optional location filter.
  AsyncTask<HomeEntity> getHome(HomeRequestDto dto);
}
