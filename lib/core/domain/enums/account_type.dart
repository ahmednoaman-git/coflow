import 'facility_feature.dart';
import 'subscription_status.dart';

/// The three account profile tiers a facility can hold.
///
/// Each tier defines a distinct set of [FacilityFeature]s that are available
/// under [SubscriptionStatus.basic] and expanded when the subscription is
/// premium ([SubscriptionStatus.active] or [SubscriptionStatus.trial]).
///
/// ## Feature matrix
///
/// | Feature         | Go basic | Go active | Flow basic | Flow active | Pro basic | Pro active |
/// |-----------------|----------|-----------|------------|-------------|-----------|------------|
/// | Activities      | ✓        | ✓         |            |             | ✓         | ✓          |
/// | Flows           |          |           | ✓          | ✓           |           |            |
/// | Courses         |          |           |            |             | ✓         | ✓          |
/// | Schedule        |          |           | ✓          |             |           |            |
/// | Calendar        |          |           |            | ✓           |           | ✓          |
/// | Purchasing      | ✓        | ✓         | ✓          | ✓           | ✓         | ✓          |
/// | Online Payment  |          | ✓         |            | ✓           |           | ✓          |
sealed class AccountType {
  const AccountType();

  /// Resolve the correct [AccountType] from an API string.
  ///
  /// Accepted values: `'go'`, `'flow'`, `'pro'` (case-insensitive).
  /// Falls back to [GoAccount] for unrecognized values.
  factory AccountType.fromString(String value) => switch (value.toLowerCase()) {
    'go' => const GoAccount(),
    'flow' => const FlowAccount(),
    'pro' => const ProAccount(),
    _ => const GoAccount(),
  };

  /// Human-readable label for display purposes.
  String get label;

  /// The set of features available at the [SubscriptionStatus.basic] tier.
  Set<FacilityFeature> get _basicFeatures;

  /// Additional features unlocked by a premium subscription.
  Set<FacilityFeature> get _premiumFeatures;

  /// Returns the full set of features available for [subscription].
  ///
  /// [SubscriptionStatus.inactive] returns an empty set.
  Set<FacilityFeature> features(SubscriptionStatus subscription) {
    if (subscription == SubscriptionStatus.inactive) return const {};
    return {
      ..._basicFeatures,
      if (subscription.isPremium) ..._premiumFeatures,
    };
  }

  /// Whether a specific [feature] is available for [subscription].
  bool hasFeature(FacilityFeature feature, SubscriptionStatus subscription) {
    return features(subscription).contains(feature);
  }

  @override
  bool operator ==(Object other) => runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// **Go** — Entry-level facility profile.
///
/// Basic: activities + purchasing.
/// Active: adds online payment.
final class GoAccount extends AccountType {
  const GoAccount();

  @override
  String get label => 'Go';

  @override
  Set<FacilityFeature> get _basicFeatures => const {
    FacilityFeature.activities,
    FacilityFeature.purchasing,
  };

  @override
  Set<FacilityFeature> get _premiumFeatures => const {
    FacilityFeature.onlinePayment,
  };
}

/// **Flow** — Schedule-oriented facility profile.
///
/// Basic: flows + schedule + purchasing.
/// Active: replaces schedule with calendar, adds online payment.
final class FlowAccount extends AccountType {
  const FlowAccount();

  @override
  String get label => 'Flow';

  @override
  Set<FacilityFeature> get _basicFeatures => const {
    FacilityFeature.flows,
    FacilityFeature.schedule,
    FacilityFeature.purchasing,
  };

  @override
  Set<FacilityFeature> get _premiumFeatures => const {
    FacilityFeature.calendar,
    FacilityFeature.onlinePayment,
  };

  /// Flow active replaces [FacilityFeature.schedule] with [FacilityFeature.calendar].
  @override
  Set<FacilityFeature> features(SubscriptionStatus subscription) {
    if (subscription == SubscriptionStatus.inactive) return const {};
    if (subscription.isPremium) {
      // Calendar replaces schedule for premium Flow accounts.
      return {
        FacilityFeature.flows,
        FacilityFeature.calendar,
        FacilityFeature.purchasing,
        FacilityFeature.onlinePayment,
      };
    }
    return _basicFeatures;
  }
}

/// **Pro** — Full-featured facility profile.
///
/// Basic: activities + courses + purchasing.
/// Active: adds calendar and online payment.
final class ProAccount extends AccountType {
  const ProAccount();

  @override
  String get label => 'Pro';

  @override
  Set<FacilityFeature> get _basicFeatures => const {
    FacilityFeature.activities,
    FacilityFeature.courses,
    FacilityFeature.purchasing,
  };

  @override
  Set<FacilityFeature> get _premiumFeatures => const {
    FacilityFeature.calendar,
    FacilityFeature.onlinePayment,
  };
}
