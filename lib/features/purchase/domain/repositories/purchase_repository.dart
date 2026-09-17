import 'package:coflow_users_v2/core/core.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract interface class PurchaseRepository {
  AsyncTask<PurchaseQuoteEntity> getQuote(SubmitPurchaseDto dto);
  AsyncTask<PurchaseReceiptEntity> submit(SubmitPurchaseDto dto);
}
