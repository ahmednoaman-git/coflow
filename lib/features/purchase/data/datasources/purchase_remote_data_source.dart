import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Purchase API endpoints.
abstract final class PurchaseEndpoints {
  static const String coupons = 'coupons';
  static String purchase(PurchaseSubjectType type) => switch (type) {
    PurchaseSubjectType.ticket => 'purchase-ticket',
    PurchaseSubjectType.promotion => 'purchase-promotion',
  };
  static String quote(PurchaseSubjectType type) => '${purchase(type)}/validate';
}

/// Remote data source for purchase API calls.
@lazySingleton
class PurchaseRemoteDataSource {
  const PurchaseRemoteDataSource(this._dio);

  final DioClient _dio;

  AsyncTask<PurchaseQuoteModel> getQuote(SubmitPurchaseDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.post(
        PurchaseEndpoints.quote(dto.subjectType),
        data: dto.toJson(),
      );
      return PurchaseQuoteModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  AsyncTask<PurchaseReceiptModel> submit(SubmitPurchaseDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.post(
        PurchaseEndpoints.purchase(dto.subjectType),
        data: dto.toJson(),
      );
      return PurchaseReceiptModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

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
