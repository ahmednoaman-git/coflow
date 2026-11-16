import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetSupportRequestsUseCase {
  const GetSupportRequestsUseCase(this._repository);
  final SupportRepository _repository;

  AsyncTask<PaginatedEntity<SupportRequestEntity>> call(GetSupportRequestsDto dto) =>
      _repository.getSupportRequests(dto);
}
