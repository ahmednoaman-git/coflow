import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get a facility's recurring weekly schedule, projected onto the
/// days the UI is showing.
@lazySingleton
class GetFacilityWeeklyScheduleUseCase {
  const GetFacilityWeeklyScheduleUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityScheduleEntity> call(GetFacilityWeeklyScheduleDto dto) =>
      _repository.getFacilityWeeklySchedule(dto);
}
