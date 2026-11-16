import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../models/models.dart';

/// Account › Purchases and Gifts endpoints.
abstract final class UserPurchasesEndpoints {
  static const String purchases = 'purchases';
  static const String purchasesHistory = 'purchases-history';
  static const String gifts = 'gifts';
  static const String giftsHistory = 'gifts-history';

  /// One purchase: `GET` re-reads it, `DELETE` cancels it.
  static String purchase(int id) => 'purchases/$id';

  static String list(GetUserPurchasesDto dto) => switch ((dto.category, dto.period)) {
    (UserPurchaseCategory.purchases, UserPurchasePeriod.current) => purchases,
    (UserPurchaseCategory.purchases, UserPurchasePeriod.history) => purchasesHistory,
    (UserPurchaseCategory.gifts, UserPurchasePeriod.current) => gifts,
    (UserPurchaseCategory.gifts, UserPurchasePeriod.history) => giftsHistory,
  };
}

@lazySingleton
class UserPurchasesRemoteDataSource {
  const UserPurchasesRemoteDataSource(this._dio);
  final DioClient _dio;

  /// One of the four lists, grouped by facility as the API sends it.
  ///
  /// Unpaginated: the endpoints return every row at once (brief F8).
  AsyncTask<List<PurchaseFacilityGroupModel>> getUserPurchases(GetUserPurchasesDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(UserPurchasesEndpoints.list(dto));
      final raw = response.data as List<dynamic>;
      return raw
          .cast<Map<String, dynamic>>()
          .map(PurchaseFacilityGroupModel.fromJson)
          .toList(growable: false);
    });
  }

  AsyncTask<UserPurchaseModel> getUserPurchase(UserPurchaseIdDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      final response = await _dio.get(UserPurchasesEndpoints.purchase(dto.purchaseId));
      return UserPurchaseModel.fromJson(response.data as Map<String, dynamic>);
    });
  }

  /// `DELETE purchases/{id}`, the resource route reservations cancel through
  /// too. The backend has no `destroy` for it yet (brief F1): today it answers
  /// 500, which surfaces as a failure.
  AsyncTask<void> cancelUserPurchase(UserPurchaseIdDto dto) {
    return AsyncTaskExtension.tryCatchMapDioToFailure(() async {
      await _dio.delete(UserPurchasesEndpoints.purchase(dto.purchaseId));
    });
  }
}
