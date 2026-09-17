import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Searches instructors.
@lazySingleton
class SearchInstructorsUseCase {
  const SearchInstructorsUseCase(this._repository);
  final SearchRepository _repository;

  AsyncTask<PaginatedEntity<SearchInstructorEntity>> call(SearchDto dto) =>
      _repository.searchInstructors(dto);
}
