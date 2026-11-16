import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'app_faq_state.freezed.dart';

@freezed
abstract class AppFaqState with _$AppFaqState {
  const factory AppFaqState({
    @Default(AsyncState.idle()) AsyncState<List<AppFaqEntity>> faqsRequest,

    /// Ids of the entries the user has opened.
    @Default(<int>{}) Set<int> expandedIds,
  }) = _AppFaqState;
}
