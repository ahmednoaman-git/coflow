import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

/// Implementation of [ActivityLineRepository].
@LazySingleton(as: ActivityLineRepository)
class ActivityLineRepositoryImpl implements ActivityLineRepository {
  const ActivityLineRepositoryImpl(this._remoteDataSource);
  final ActivityLineRemoteDataSource _remoteDataSource;

  @override
  AsyncTask<ActivityLineFacilitiesEntity> getFacilities(
    GetFacilitiesDto dto,
  ) {
    return _remoteDataSource.getFacilities(dto).map(ActivityLineMapper.toFacilitiesEntity);
  }
}
