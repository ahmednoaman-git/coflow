import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Purchase API endpoints.
abstract final class PurchaseEndpoints {
  static const String coupons = 'coupons';
}

/// Remote data source for purchase API calls.
@lazySingleton
class PurchaseRemoteDataSource {
  const PurchaseRemoteDataSource(this._dio);

  final DioClient _dio;

  AsyncTask<List<CouponModel>> getCoupons(GetPurchaseCouponsDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(
        PurchaseEndpoints.coupons,
        queryParameters: switch (dto.subjectType) {
          PurchaseSubjectType.ticket => {'ticket_id': dto.subjectId},
          PurchaseSubjectType.promotion => {'promotion_id': dto.subjectId},
        },
      );
      final raw = response.data as List<dynamic>;
      return raw.cast<Map<String, dynamic>>().map(CouponModel.fromJson).toList(growable: false);
    });
  }
}
