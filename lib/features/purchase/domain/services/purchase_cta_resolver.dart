import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';

/// The purchase call-to-action implied by a facility's [PaymentType].
enum PurchaseCtaAction { directPurchase, onlinePayment, depositPayment }

/// Resolves the checkout CTA/behavior from a facility's [PaymentType].
abstract final class PurchaseCtaResolver {
  static PurchaseCtaAction resolve(PaymentType paymentType) => switch (paymentType) {
    PaymentType.directPurchase || PaymentType.none => PurchaseCtaAction.directPurchase,
    PaymentType.fullOnline => PurchaseCtaAction.onlinePayment,
    PaymentType.depositOnline => PurchaseCtaAction.depositPayment,
  };

  static bool showsDeposit(PaymentType paymentType) => paymentType == PaymentType.depositOnline;
}
