import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';

/// The purchase call-to-action implied by a facility's [PaymentType].
enum PurchaseCtaAction { directPurchase, onlinePayment, depositPayment }

/// Resolves the checkout CTA/behavior from a facility's [PaymentType].
abstract final class PurchaseCtaResolver {
  /// Whether [facility] can take a purchase inside the app.
  ///
  /// Online payment is premium-only, so basic and inactive accounts are
  /// contact-only however their [PaymentType] is configured — the backend
  /// leaves `payment_type` set from whenever the facility last held a
  /// subscription, so it cannot be trusted on its own (facility 94 is
  /// `inactive` yet still reports `deposit online`).
  static bool allowsInAppPurchase(CollapsedFacilityEntity facility) => facility.accountType
      .features(facility.subscriptionStatus)
      .contains(FacilityFeature.onlinePayment);

  static PurchaseCtaAction resolve(PaymentType paymentType) => switch (paymentType) {
    PaymentType.directPurchase || PaymentType.none => PurchaseCtaAction.directPurchase,
    PaymentType.fullOnline => PurchaseCtaAction.onlinePayment,
    PaymentType.depositOnline => PurchaseCtaAction.depositPayment,
  };

  static bool showsDeposit(PaymentType paymentType) => paymentType == PaymentType.depositOnline;
}
