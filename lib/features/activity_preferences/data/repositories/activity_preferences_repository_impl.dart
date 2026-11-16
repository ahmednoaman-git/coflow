import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: ActivityPreferencesRepository)
class ActivityPreferencesRepositoryImpl implements ActivityPreferencesRepository {
  const ActivityPreferencesRepositoryImpl(this._remote);
  final ActivityPreferencesRemoteDataSource _remote;

  @override
  AsyncTask<List<PreferenceActivityLineEntity>> getPreferenceCatalog() =>
      _remote.getAccountTags().map(ActivityPreferencesMapper.toCatalog);

  @override
  AsyncTask<void> savePreferences(SaveActivityPreferencesDto dto) => _remote.savePreferences(dto);
}
