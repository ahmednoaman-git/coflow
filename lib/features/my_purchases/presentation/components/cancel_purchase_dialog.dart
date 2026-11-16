import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Confirmation in front of cancelling a purchase. Returns true when confirmed.
class CancelPurchaseDialog extends StatelessWidget {
  const CancelPurchaseDialog({super.key, required this.purchaseName});

  final String purchaseName;

  static Future<bool?> show(BuildContext context, {required String purchaseName}) =>
      showDialog<bool>(
        context: context,
        builder: (_) => CancelPurchaseDialog(purchaseName: purchaseName),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Dialog(
      insetPadding: EdgeInsets.all(context.spacing.s24),
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(context.spacing.s24)),
      child: Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          spacing: context.spacing.s16,
          children: [
            Text(
              l10n.myPurchases_cancelConfirmTitle,
              style: context.typography.bold20.primary(context),
            ),
            Text(
              l10n.myPurchases_cancelConfirmBody(purchaseName),
              style: context.typography.book14.secondary(context),
            ),
            Row(
              spacing: context.spacing.s12,
              children: [
                Expanded(
                  child: MainButton(
                    text: l10n.myPurchases_keepPurchase,
                    backgroundColor: context.colors.backgroundGrey,
                    textColor: context.colors.textPrimary,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
                Expanded(
                  child: MainButton(
                    text: l10n.myPurchases_cancelPurchase,
                    backgroundColor: context.colors.energyCherryPrimary,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
