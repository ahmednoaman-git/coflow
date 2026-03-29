/// Subscription tier of a facility account.
///
/// Determines which features are unlocked for a given [AccountType]:
/// - [basic] — Free tier with limited features.
/// - [active] — Paid tier with full features (online payment, calendar, etc.).
/// - [trial] — Temporary access to active-tier features.
/// - [inactive] — Account is deactivated; no features available.
enum SubscriptionStatus {
  basic,
  trial,
  active,
  inactive
  ;

  /// Whether this subscription unlocks premium features (online payment, calendar).
  bool get isPremium => this == active || this == trial;

  static SubscriptionStatus fromString(String value) => switch (value.toLowerCase()) {
    'basic' => basic,
    'trial' => trial,
    'active' => active,
    _ => inactive,
  };
}
