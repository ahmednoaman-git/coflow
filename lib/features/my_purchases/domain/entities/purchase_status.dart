/// What a purchase row is: a single ticket, a promotion bought as a whole, or
/// a gifted coupon.
enum PurchaseKind {
  ticket,
  package,
  buyGet,
  coupon,
  unknown
  ;

  static PurchaseKind fromApi(String? value) => switch (value?.trim().toLowerCase()) {
    'ticket' => ticket,
    'package' => package,
    'buy_get' => buyGet,
    'coupon' => coupon,
    _ => unknown,
  };

  /// Whether the row was bought as a promotion, so its tickets sit under the
  /// promotion's name.
  bool get isPromotion => this == package || this == buyGet;
}

/// A purchase's lifecycle `status`, as the API sends it.
///
/// The values are only partly documented (backend brief F5): `expiration`
/// doesn't say whether the purchase was paid, and gifted coupons come back as
/// `due` although they cost nothing. Anything unrecognised is [unknown] and
/// gets no status chip.
enum PurchaseStatus {
  due,
  paid,
  completedPaid,

  /// Every ticket used, not yet paid.
  completedDue,
  expired,
  expiredDue,
  expiredPaid,
  refunded,
  used,
  gift,
  unknown
  ;

  static PurchaseStatus fromApi(String? value) => switch (value?.trim().toLowerCase()) {
    'due' => due,
    'paid' => paid,
    'completed_paid' => completedPaid,
    'completed_due' => completedDue,
    'expiration' || 'expired' || 'expire' => expired,
    'expiration_due' => expiredDue,
    'expiration_paid' => expiredPaid,
    'refund' || 'refunded' => refunded,
    'used' => used,
    'gift' => gift,
    _ => unknown,
  };

  bool get isExpired => this == expired || this == expiredDue || this == expiredPaid;
}

/// Whether the user still owes money on a purchase.
///
/// Derived from [PurchaseStatus] and the payment ledger, never from the row's
/// `paid` / `remain`, which the backend doesn't keep up to date (brief F3).
enum PurchasePaymentState { due, paid, free }

/// The status chip a purchase card and its sheet show.
enum PurchaseBadge { due, paid, expired, refunded, gift }

/// Whether a refund covered the whole amount.
enum PurchaseRefundExtent { full, partial }

/// What a gifted coupon can be redeemed against.
enum CouponScope {
  tickets,
  promotions,
  purchases,
  unknown
  ;

  static CouponScope fromApi(String? value) => switch (value?.trim().toLowerCase()) {
    'ticket' || 'tickets' => tickets,
    'promotion' || 'promotions' => promotions,
    'purchase' || 'purchases' => purchases,
    _ => unknown,
  };
}
