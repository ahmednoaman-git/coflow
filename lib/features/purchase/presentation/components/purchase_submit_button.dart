import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Creates an account purchase. These endpoints do not collect online payment.
class PurchaseSubmitButton extends StatelessWidget {
  const PurchaseSubmitButton({
    super.key,
    required this.accentColor,
    required this.onPressed,
    this.isLoading = false,
  });

  final Color accentColor;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.s12,
      children: [
        Text(context.l10n.purchase_dueNotice, style: context.typography.book13.secondary(context)),
        MainButton(
          height: context.spacing.s48,
          backgroundColor: accentColor,
          text: context.l10n.purchase_title,
          isLoading: isLoading,
          isDisabled: onPressed == null,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
