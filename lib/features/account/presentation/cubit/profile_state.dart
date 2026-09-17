import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'profile_state.freezed.dart';

/// State for [ProfileCubit].
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(AsyncState.idle()) AsyncState<ProfileEntity> profileRequest,
    @Default(AsyncState.idle()) AsyncState<ProfileStatsEntity> statisticsRequest,
    @Default(AsyncState.idle()) AsyncState<void> logoutRequest,
  }) = _ProfileState;
}
