import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

/// Use case to turn update-tracking on or off for a saved facility.
@lazySingleton
class SetProfileTrackingUseCase {
  const SetProfileTrackingUseCase(this._repository);

  final SavedProfilesRepository _repository;

  AsyncTask<void> call(SetProfileTrackingDto dto) => _repository.setProfileTracking(dto);
}
