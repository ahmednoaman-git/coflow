import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: SavedProfilesRepository)
class SavedProfilesRepositoryImpl implements SavedProfilesRepository {
  const SavedProfilesRepositoryImpl(this._stub);

  final SavedProfilesStubDataSource _stub;

  @override
  AsyncTask<List<SavedProfileEntity>> getSavedProfiles() {
    // TODO(backend): swap the stub for the real saved-facilities endpoint once
    // it ships — only this line and the data source change.
    return _stub.getSavedProfiles().map(SavedProfileMapper.toEntities);
  }

  @override
  AsyncTask<void> unsaveProfile(UnsaveProfileDto dto) {
    // TODO(backend): swap the stub for the real unsave verb.
    return _stub.unsaveProfile(dto);
  }

  @override
  AsyncTask<void> setProfileTracking(SetProfileTrackingDto dto) {
    // TODO(backend): swap the stub for the real track-updates verb.
    return _stub.setProfileTracking(dto);
  }
}
