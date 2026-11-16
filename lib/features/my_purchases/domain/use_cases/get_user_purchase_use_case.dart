import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetUserPurchaseUseCase {
  const GetUserPurchaseUseCase(this._repository);
  final UserPurchasesRepository _repository;

  AsyncTask<UserPurchaseEntity> call(UserPurchaseIdDto dto) => _repository.getUserPurchase(dto);
}
