import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/home_repository.dart';

/// Use case for fetching home screen data.
@lazySingleton
class GetHomeUseCase {
  const GetHomeUseCase(this._repository);
  final HomeRepository _repository;

  /// Fetches home data with optional location filter.
  AsyncTask<HomeEntity> call(HomeRequestDto dto) => _repository.getHome(dto);
}
