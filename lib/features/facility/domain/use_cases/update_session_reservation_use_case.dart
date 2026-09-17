import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case for the four reservation actions — reserve, cancel, join and leave
/// waitlist. Each returns the slot's updated details, so the UI never has to
/// derive the resulting state itself.
@lazySingleton
class UpdateSessionReservationUseCase {
  const UpdateSessionReservationUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilitySessionDetailsEntity> call(SessionReservationDto dto) =>
      _repository.updateSessionReservation(dto);
}
