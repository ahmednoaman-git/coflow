import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Searches facilities (businesses).
@lazySingleton
class SearchBusinessesUseCase {
  const SearchBusinessesUseCase(this._repository);
  final SearchRepository _repository;

  AsyncTask<PaginatedEntity<CollapsedFacilityEntity>> call(SearchDto dto) =>
      _repository.searchBusinesses(dto);
}
