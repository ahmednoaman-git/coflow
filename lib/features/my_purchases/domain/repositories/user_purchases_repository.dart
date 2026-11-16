import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract interface class UserPurchasesRepository {
  /// One of the account lists, as flat rows (each carries its facility).
  AsyncTask<List<UserPurchaseEntity>> getUserPurchases(GetUserPurchasesDto dto);

  /// One purchase, re-read.
  AsyncTask<UserPurchaseEntity> getUserPurchase(UserPurchaseIdDto dto);

  /// Cancels a purchase that is still due and unreserved.
  AsyncTask<void> cancelUserPurchase(UserPurchaseIdDto dto);
}
