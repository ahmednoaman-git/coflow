import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: AppInfoRepository)
class AppInfoRepositoryImpl implements AppInfoRepository {
  const AppInfoRepositoryImpl(this._remote);
  final AppInfoRemoteDataSource _remote;

  @override
  AsyncTask<List<AppFaqEntity>> getFaqs() => _remote.getFaqs().map(AppFaqMapper.toCustomerFaqs);

  @override
  AsyncTask<AppInfoEntity> getAppInfo() => _remote.getAppInfo().map(AppInfoMapper.toEntity);
}
