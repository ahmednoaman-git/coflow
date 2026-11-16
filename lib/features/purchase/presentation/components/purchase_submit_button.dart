import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// Starts a direct purchase: it is added to the account and paid for at the
/// facility. The purchase endpoints collect no payment.
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
    return MainButton(
      height: context.spacing.s48,
      backgroundColor: accentColor,
      text: context.l10n.purchase_directPurchase,
      trailingIcon: SolarIconsOutline.banknote,
      isLoading: isLoading,
      isDisabled: onPressed == null,
      onPressed: onPressed,
    );
  }
}
