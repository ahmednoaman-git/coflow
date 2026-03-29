/// Features available to facility accounts.
///
/// Features are gated by [AccountType] and [SubscriptionStatus].
///
/// **Mutual exclusivity rules:**
/// - A facility has either [activities] or [flows], never both.
/// - A facility has either [schedule] or [calendar], never both.
///   [calendar] is a premium upgrade of [schedule].
///
/// **[purchasing]** encompasses tickets, promotions, and coupons — all three
/// are bundled together across every account type that supports purchasing.
enum FacilityFeature {
  /// Purchasable services (Go and Pro profiles).
  activities,

  /// Similar to activities but with richer data (Flow profiles only).
  /// Mutually exclusive with [activities].
  flows,

  /// Multi-session purchasable services (Pro profiles only).
  courses,

  /// Basic time-slot management (Flow basic tier).
  /// Mutually exclusive with [calendar].
  schedule,

  /// Premium time-slot management with advanced views (Flow & Pro active tier).
  /// Mutually exclusive with [schedule].
  calendar,

  /// Tickets, promotions, and coupons for purchasable services.
  purchasing,

  /// Online payment processing (active/trial subscription only).
  onlinePayment,
}
