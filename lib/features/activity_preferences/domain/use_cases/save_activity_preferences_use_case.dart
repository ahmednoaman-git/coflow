import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

@lazySingleton
class SaveActivityPreferencesUseCase {
  const SaveActivityPreferencesUseCase(this._repository);
  final ActivityPreferencesRepository _repository;

  AsyncTask<void> call(SaveActivityPreferencesDto dto) => _repository.savePreferences(dto);
}
