import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetAppInfoUseCase {
  const GetAppInfoUseCase(this._repository);
  final AppInfoRepository _repository;

  AsyncTask<AppInfoEntity> call() => _repository.getAppInfo();
}
