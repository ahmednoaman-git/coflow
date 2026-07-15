import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: CouponRepository)
class CouponRepositoryImpl implements CouponRepository {
  const CouponRepositoryImpl(this._remote);

  final PurchaseRemoteDataSource _remote;

  @override
  AsyncTask<List<PurchaseCouponEntity>> getCoupons(GetPurchaseCouponsDto dto) {
    return _remote
        .getCoupons(dto)
        .map((models) => models.map(CouponMapper.toEntity).toList(growable: false));
  }
}
