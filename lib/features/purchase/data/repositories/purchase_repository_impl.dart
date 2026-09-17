import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: PurchaseRepository)
class PurchaseRepositoryImpl implements PurchaseRepository {
  const PurchaseRepositoryImpl(this._remote);
  final PurchaseRemoteDataSource _remote;

  @override
  AsyncTask<PurchaseQuoteEntity> getQuote(SubmitPurchaseDto dto) =>
      _remote.getQuote(dto).map(PurchaseMapper.quote);

  @override
  AsyncTask<PurchaseReceiptEntity> submit(SubmitPurchaseDto dto) =>
      _remote.submit(dto).map(PurchaseMapper.receipt);
}
