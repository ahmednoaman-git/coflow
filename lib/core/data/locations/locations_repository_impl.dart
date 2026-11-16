import 'package:coflow_users_v2/core/async/types.dart';
import 'package:coflow_users_v2/core/domain/entities/entities.dart';
import 'package:coflow_users_v2/core/domain/repositories/locations_repository.dart';
import 'package:injectable/injectable.dart';

import 'datasources/datasources.dart';
import 'locations_mapper.dart';

/// Implementation of [LocationsRepository].
@LazySingleton(as: LocationsRepository)
class LocationsRepositoryImpl implements LocationsRepository {
  const LocationsRepositoryImpl(this._remoteDataSource);
  final LocationsRemoteDataSource _remoteDataSource;

  @override
  AsyncTask<LocationsEntity> getLocations({int? activityLineId}) {
    return _remoteDataSource
        .getLocations(activityLineId: activityLineId)
        .map(LocationsMapper.toEntity);
  }
}
