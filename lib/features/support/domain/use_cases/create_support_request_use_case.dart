import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

@lazySingleton
class CreateSupportRequestUseCase {
  const CreateSupportRequestUseCase(this._repository);
  final SupportRepository _repository;

  AsyncTask<void> call(CreateSupportRequestDto dto) => _repository.createSupportRequest(dto);
}
