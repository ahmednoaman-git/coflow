import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_purchase_entity.dart';

part 'purchase_facility_group_entity.freezed.dart';

/// A facility's purchases, as the lists show them: one collapsible section per
/// facility.
@freezed
abstract class PurchaseFacilityGroupEntity with _$PurchaseFacilityGroupEntity {
  const factory PurchaseFacilityGroupEntity({
    required int facilityId,
    required String facilityName,

    /// The facility's profile, from the first row that carried one.
    CollapsedFacilityEntity? facility,
    required List<UserPurchaseEntity> purchases,
  }) = _PurchaseFacilityGroupEntity;
}
