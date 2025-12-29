import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/datasources.dart';
import '../mappers/home_mapper.dart';

/// Implementation of [HomeRepository].
@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteDataSource);
  final HomeRemoteDataSource _remoteDataSource;

  @override
  AsyncTask<HomeEntity> getHome(HomeRequestDto dto) {
    return _remoteDataSource.getHome(dto).map(HomeMapper.toEntity);
  }
}
