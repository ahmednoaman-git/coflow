import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:flutter/material.dart';

/// Renders the computed [PurchaseInvoiceEntity] breakdown.
class PurchaseInvoiceSection extends StatelessWidget {
  const PurchaseInvoiceSection({super.key, required this.invoice, required this.accentColor});

  final PurchaseInvoiceEntity invoice;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s12,
      children: [
        Text(
          context.l10n.purchase_invoiceTitle,
          style: context.typography.bold16.primary(context),
        ),
        for (final line in invoice.lines)
          _InvoiceRow(
            label: line.quantity > 1
                ? _QuantityLabel(count: line.quantity, label: line.label, accentColor: accentColor)
                : Text(line.label, style: context.typography.book14.secondary(context)),
            value: '+ ${invoice.currency} ${line.amount}',
            accentColor: accentColor,
          ),
        if (invoice.hasCouponDiscount)
          _InvoiceRow(
            label: Text(
              context.l10n.purchase_couponDiscount,
              style: context.typography.book14.secondary(context),
            ),
            value: '- ${invoice.currency} ${invoice.couponDiscount}',
            accentColor: accentColor,
          ),
        Divider(height: context.spacing.s16, color: context.colors.strokeSecondary),
        _InvoiceRow(
          label: Text(
            context.l10n.purchase_totalAmount,
            style: context.typography.medium14.primary(context),
          ),
          value: '${invoice.currency} ${invoice.total}',
          accentColor: accentColor,
        ),
        if (invoice.hasDeposit)
          _InvoiceRow(
            label: Text(
              context.l10n.purchase_depositAmount,
              style: context.typography.medium14.primary(context),
            ),
            value: '${invoice.currency} ${invoice.depositAmount}',
            accentColor: accentColor,
          ),
      ],
    );
  }
}

class _QuantityLabel extends StatelessWidget {
  const _QuantityLabel({required this.count, required this.label, required this.accentColor});

  final int count;
  final String label;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${count}x ',
            style: context.typography.bold14.withColor(accentColor),
          ),
          TextSpan(text: label, style: context.typography.book14.secondary(context)),
        ],
      ),
    );
  }
}

class _InvoiceRow extends StatelessWidget {
  const _InvoiceRow({required this.label, required this.value, required this.accentColor});

  final Widget label;
  final String value;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        label,
        Text(value, style: context.typography.bold14.withColor(accentColor)),
      ],
    );
  }
}
