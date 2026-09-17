import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'facility_faq_state.freezed.dart';

@freezed
abstract class FacilityFaqState with _$FacilityFaqState {
  const factory FacilityFaqState({
    @Default(AsyncState.idle()) AsyncState<List<FacilityFaqEntity>> faqsRequest,

    /// Ids of the entries the user has expanded. Kept in state so the list can
    /// stay stateless and rebuild from the top.
    @Default(<int>{}) Set<int> expandedIds,
  }) = _FacilityFaqState;
}
