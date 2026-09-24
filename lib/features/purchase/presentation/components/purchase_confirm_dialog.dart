import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';

/// The step between "Direct Purchase" and the purchase itself: what the
/// customer will owe the facility, paid there rather than in the app.
///
/// Returns true when the customer confirms.
class PurchaseConfirmDialog extends StatelessWidget {
  const PurchaseConfirmDialog({
    super.key,
    required this.quote,
    required this.currency,
    required this.accentColor,
  });

  final PurchaseQuoteEntity quote;

  /// Used when the quote does not name its own currency.
  final String currency;
  final Color accentColor;

  static Future<bool?> show(
    BuildContext context, {
    required PurchaseQuoteEntity quote,
    required String currency,
    required Color accentColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => PurchaseConfirmDialog(
        quote: quote,
        currency: currency,
        accentColor: accentColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Dialog(
      insetPadding: EdgeInsets.all(context.spacing.s24),
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: context.spacing.s16,
          children: [
            Text(
              l10n.purchase_directPurchase,
              textAlign: .center,
              style: context.typography.bold20.primary(context),
            ),
            _PaymentSummary(
              quote: quote,
              currency: quote.currency ?? currency,
              accentColor: accentColor,
            ),
            Text(l10n.purchase_dueNotice, style: context.typography.book13.secondary(context)),
            MainButton(
              height: context.spacing.s48,
              backgroundColor: accentColor,
              text: l10n.purchase_confirmPurchase,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            MainButton(
              height: context.spacing.s48,
              backgroundColor: context.colors.backgroundWhite,
              textColor: context.colors.textTertiary,
              borderColor: context.colors.strokeSecondary,
              text: l10n.purchase_cancel,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary({
    required this.quote,
    required this.currency,
    required this.accentColor,
  });

  final PurchaseQuoteEntity quote;
  final String currency;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsets.all(context.spacing.s16),
      decoration: ShapeDecoration(
        color: context.colors.backgroundGrey,
        shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: context.spacing.s12,
        children: [
          Text(
            l10n.purchase_paymentSummary,
            style: context.typography.medium14.primary(context),
          ),
          _SummaryRow(
            label: l10n.purchase_purchasePrice,
            value: quote.itemsPrice.priceText(currency),
          ),
          if (quote.addOnsPrice > 0)
            _SummaryRow(
              label: l10n.purchase_addOnsPrice,
              value: '+ ${quote.addOnsPrice.priceText(currency)}',
            ),
          if (quote.couponDiscount > 0)
            _SummaryRow(
              label: l10n.purchase_couponDiscount,
              value: '- ${quote.couponDiscount.priceText(currency)}',
            ),
          Divider(height: 1, color: context.colors.strokeSecondary),
          Row(
            mainAxisAlignment: .spaceBetween,
            spacing: context.spacing.s12,
            children: [
              Text(l10n.purchase_dueAmount, style: context.typography.bold16.primary(context)),
              Text(
                quote.finalPrice.priceText(currency),
                style: context.typography.bold16.withColor(accentColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      spacing: context.spacing.s12,
      children: [
        Flexible(child: Text(label, style: context.typography.book13.secondary(context))),
        Text(value, style: context.typography.medium13.primary(context)),
      ],
    );
  }
}
