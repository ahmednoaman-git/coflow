import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetAppFaqsUseCase {
  const GetAppFaqsUseCase(this._repository);
  final AppInfoRepository _repository;

  AsyncTask<List<AppFaqEntity>> call() => _repository.getFaqs();
}
