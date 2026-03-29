import 'package:coflow_users_v2/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tag_entity.dart';

part 'collapsed_facility_entity.freezed.dart';

/// Collapsed facility entity for list display.
///
/// Contains basic info for facility cards. A more detailed entity
/// will be used in the facility details screen in the future.
@freezed
abstract class CollapsedFacilityEntity with _$CollapsedFacilityEntity {
  const factory CollapsedFacilityEntity({
    required int id,
    required String name,
    required String description,
    String? statusMessage,
    String? logoUrl,
    String? coverUrl,
    int? likeCount,
    required ActivityLineEntity activityLine,
    @Default([]) List<TagEntity> tags,
    required AccountType accountType,
    required FacilityStatus status,
    required SubscriptionStatus subscriptionStatus,
    required PaymentType paymentType,
    required int views,
  }) = _CollapsedFacilityEntity;
}

/// Status of a facility.
enum FacilityStatus {
  visible,
  invisible,
  temporarilyClosed
  ;

  static FacilityStatus fromString(String value) => switch (value.toLowerCase()) {
    'visible' => visible,
    'temp_closed' => temporarilyClosed,
    _ => invisible,
  };
}

/// Payment type supported by a facility.
enum PaymentType {
  directPurchase,
  fullOnline,
  depositOnline,
  none
  ;

  static PaymentType fromString(String value) => switch (value.toLowerCase()) {
    'direct purchase' || 'direct_purchase' => directPurchase,
    'full online' || 'full_online' => fullOnline,
    'deposit online' || 'deposit_online' => depositOnline,
    _ => none,
  };
}
