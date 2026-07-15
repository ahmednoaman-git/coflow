import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A label/value row (e.g. price, validity) with an accent-colored value.
class PurchaseInfoRow extends StatelessWidget {
  const PurchaseInfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.accentColor,
    this.icon,
  });

  final String label;
  final String value;
  final Color accentColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: context.spacing.s8,
          children: [
            ?icon,
            Text(label, style: context.typography.medium14.primary(context)),
          ],
        ),
        Expanded(
          child: Text(
            value,
            textAlign: .end,
            style: context.typography.medium14.withColor(accentColor),
          ),
        ),
      ],
    );
  }
}
