import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Use case to get details for a specific promotion.
@lazySingleton
class GetFacilityPromotionDetailsUseCase {
  const GetFacilityPromotionDetailsUseCase(this._repository);

  final FacilityRepository _repository;

  AsyncTask<FacilityPromotionDetailsEntity> call(GetFacilityPromotionDetailsDto dto) =>
      _repository.getFacilityPromotionDetails(dto);
}
