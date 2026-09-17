import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetPurchaseQuoteUseCase {
  const GetPurchaseQuoteUseCase(this._repository);
  final PurchaseRepository _repository;

  AsyncTask<PurchaseQuoteEntity> call(SubmitPurchaseDto dto) => _repository.getQuote(dto);
}
