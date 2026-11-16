import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: SupportRepository)
class SupportRepositoryImpl implements SupportRepository {
  const SupportRepositoryImpl(this._remote);
  final SupportRemoteDataSource _remote;

  @override
  AsyncTask<PaginatedEntity<SupportRequestEntity>> getSupportRequests(
    GetSupportRequestsDto dto,
  ) => _remote.getSupportRequests(dto).map(SupportRequestMapper.toPage);

  @override
  AsyncTask<void> createSupportRequest(CreateSupportRequestDto dto) =>
      _remote.createSupportRequest(dto);
}
