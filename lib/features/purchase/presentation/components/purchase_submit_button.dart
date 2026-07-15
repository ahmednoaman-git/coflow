import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';

/// The bottom checkout CTA. Label depends on the facility's [PaymentType];
/// submission is stubbed to a snackbar (payment integration is out of scope).
class PurchaseSubmitButton extends StatelessWidget {
  const PurchaseSubmitButton({
    super.key,
    required this.paymentType,
    required this.accentColor,
  });

  final PaymentType paymentType;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final action = PurchaseCtaResolver.resolve(paymentType);
    final text = switch (action) {
      PurchaseCtaAction.directPurchase => context.l10n.purchase_directPurchase,
      PurchaseCtaAction.onlinePayment => context.l10n.purchase_onlinePayment,
      PurchaseCtaAction.depositPayment => context.l10n.purchase_depositPayment,
    };

    return MainButton(
      height: 56,
      backgroundColor: accentColor,
      text: text,
      onPressed: () => context.showInfoSnackBar(context.l10n.purchase_stubSnackBar),
    );
  }
}
