import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/data/data.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl(this._remote);
  final SearchRemoteDataSource _remote;

  @override
  AsyncTask<PaginatedEntity<CollapsedFacilityEntity>> searchBusinesses(SearchDto dto) => _remote
      .searchBusinesses(dto)
      .map((page) => SearchMapper.toPaginatedEntity(page, ActivityLineMapper.toFacilityEntity));

  @override
  AsyncTask<PaginatedEntity<SearchInstructorEntity>> searchInstructors(SearchDto dto) => _remote
      .searchInstructors(dto)
      .map((page) => SearchMapper.toPaginatedEntity(page, SearchMapper.toInstructorEntity));

  @override
  AsyncTask<PaginatedEntity<SearchServiceEntity>> searchServices(SearchDto dto) => _remote
      .searchServices(dto)
      .map((page) => SearchMapper.toPaginatedEntity(page, SearchMapper.toServiceEntity));
}
