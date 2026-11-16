import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: SavedProfilesRepository)
class SavedProfilesRepositoryImpl implements SavedProfilesRepository {
  const SavedProfilesRepositoryImpl(this._remote);

  final SavedProfilesRemoteDataSource _remote;

  @override
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles() {
    return _remote.getSavedProfiles().map(SavedProfileMapper.toEntities);
  }
}
