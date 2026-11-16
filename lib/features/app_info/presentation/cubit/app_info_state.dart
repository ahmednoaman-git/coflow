import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'app_info_state.freezed.dart';

@freezed
abstract class AppInfoState with _$AppInfoState {
  const factory AppInfoState({
    @Default(AsyncState.idle()) AsyncState<AppInfoEntity> infoRequest,
  }) = _AppInfoState;
}
