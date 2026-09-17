import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetAccountStatisticsUseCase {
  const GetAccountStatisticsUseCase(this._repository);

  final ProfileRepository _repository;

  AsyncTask<ProfileStatsEntity> call() => _repository.getAccountStatistics();
}
