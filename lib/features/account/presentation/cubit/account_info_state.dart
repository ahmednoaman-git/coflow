import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'account_info_state.freezed.dart';

/// State for [AccountInfoCubit]: one request per account write.
@freezed
abstract class AccountInfoState with _$AccountInfoState {
  const factory AccountInfoState({
    @Default(AsyncState.idle()) AsyncState<ProfileEntity> updateRequest,
    @Default(AsyncState.idle()) AsyncState<ProfileEntity> imageRequest,
    @Default(AsyncState.idle()) AsyncState<void> passwordRequest,
    @Default(AsyncState.idle()) AsyncState<List<NationalityEntity>> nationalitiesRequest,
    @Default(AsyncState.idle()) AsyncState<void> deleteRequest,
  }) = _AccountInfoState;
}
