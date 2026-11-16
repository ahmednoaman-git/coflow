import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';

/// Decides whether a facility's tickets and promotions are bought in the app
/// or through "Contact {facility}".
abstract final class PurchaseCtaResolver {
  /// Whether [facility] takes purchases in the app.
  ///
  /// Every in-app purchase is a direct purchase, paid in cash at the facility:
  /// online and deposit payment are out of scope, so `full online` and
  /// `deposit online` facilities sell the same way (product decision,
  /// 2026-09-23). A facility is contact-only when:
  /// - its subscription is not premium — basic and inactive accounts never
  ///   sell in the app, whatever `payment_type` says (the backend leaves it set
  ///   from the facility's last subscription: facility 94 is `inactive` yet
  ///   reports `deposit online`);
  /// - it chose `contact` as its payment type.
  static bool allowsInAppPurchase(CollapsedFacilityEntity facility) =>
      facility.subscriptionStatus.isPremium && facility.paymentType != PaymentType.contact;
}
