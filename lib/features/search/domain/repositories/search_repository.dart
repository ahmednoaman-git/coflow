import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

/// Search operations. One method per result set — the API takes a single
/// `type` per request.
abstract interface class SearchRepository {
  AsyncTask<PaginatedEntity<CollapsedFacilityEntity>> searchBusinesses(SearchDto dto);

  AsyncTask<PaginatedEntity<SearchInstructorEntity>> searchInstructors(SearchDto dto);

  AsyncTask<PaginatedEntity<SearchServiceEntity>> searchServices(SearchDto dto);
}
