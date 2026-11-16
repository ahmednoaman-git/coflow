import 'package:coflow_users_v2/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: UserPurchasesRepository)
class UserPurchasesRepositoryImpl implements UserPurchasesRepository {
  const UserPurchasesRepositoryImpl(this._remote);
  final UserPurchasesRemoteDataSource _remote;

  @override
  AsyncTask<List<UserPurchaseEntity>> getUserPurchases(GetUserPurchasesDto dto) =>
      _remote.getUserPurchases(dto).map(UserPurchaseMapper.fromGroups);

  @override
  AsyncTask<UserPurchaseEntity> getUserPurchase(UserPurchaseIdDto dto) =>
      _remote.getUserPurchase(dto).map(UserPurchaseMapper.toEntity);

  @override
  AsyncTask<void> cancelUserPurchase(UserPurchaseIdDto dto) => _remote.cancelUserPurchase(dto);
}
