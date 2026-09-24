import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A label/value row (e.g. price, validity); the [value] sits at the end.
class PurchaseInfoRow extends StatelessWidget {
  const PurchaseInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  final String label;
  final Widget value;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      spacing: context.spacing.s8,
      children: [
        Row(
          spacing: context.spacing.s8,
          children: [
            ?icon,
            Text(label, style: context.typography.medium14.primary(context)),
          ],
        ),
        Flexible(
          child: Align(alignment: AlignmentDirectional.centerEnd, child: value),
        ),
      ],
    );
  }
}
