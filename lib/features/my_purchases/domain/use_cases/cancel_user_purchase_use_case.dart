import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../repositories/repositories.dart';

@lazySingleton
class CancelUserPurchaseUseCase {
  const CancelUserPurchaseUseCase(this._repository);
  final UserPurchasesRepository _repository;

  AsyncTask<void> call(UserPurchaseIdDto dto) => _repository.cancelUserPurchase(dto);
}
