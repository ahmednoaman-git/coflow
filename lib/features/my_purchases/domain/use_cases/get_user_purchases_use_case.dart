import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetUserPurchasesUseCase {
  const GetUserPurchasesUseCase(this._repository);
  final UserPurchasesRepository _repository;

  AsyncTask<List<UserPurchaseEntity>> call(GetUserPurchasesDto dto) =>
      _repository.getUserPurchases(dto);
}
