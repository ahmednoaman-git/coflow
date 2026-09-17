import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Searches services (activities, flows and courses).
@lazySingleton
class SearchServicesUseCase {
  const SearchServicesUseCase(this._repository);
  final SearchRepository _repository;

  AsyncTask<PaginatedEntity<SearchServiceEntity>> call(SearchDto dto) =>
      _repository.searchServices(dto);
}
