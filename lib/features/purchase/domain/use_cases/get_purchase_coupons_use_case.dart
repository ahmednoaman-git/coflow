import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

@lazySingleton
class GetPurchaseCouponsUseCase {
  const GetPurchaseCouponsUseCase(this._repository);

  final CouponRepository _repository;

  AsyncTask<List<PurchaseCouponEntity>> call(GetPurchaseCouponsDto dto) =>
      _repository.getCoupons(dto);
}
