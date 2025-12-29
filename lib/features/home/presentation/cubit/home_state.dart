import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'home_state.freezed.dart';

/// State for [HomeCubit].
@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncState.idle()) AsyncState<HomeEntity> homeRequest,
    int? selectedActivityLineId,
  }) = _HomeState;
}
