import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get promotions for a facility.
@lazySingleton
class GetFacilityPromotionsUseCase {
  const GetFacilityPromotionsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<List<FacilityPromotionEntity>> call(GetFacilityPromotionsDto dto) =>
      _repository.getFacilityPromotions(dto);
}
