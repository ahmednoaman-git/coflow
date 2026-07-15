import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Standard accent-colored app bar for the purchase screens: default back
/// button, facility name title, and a "Purchase" subtitle.
class PurchaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PurchaseAppBar({super.key, required this.title, required this.accentColor});

  final String title;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: accentColor,
      foregroundColor: context.colors.textWhite,
      centerTitle: true,
      title: Column(
        mainAxisSize: .min,
        children: [
          Text(title, style: context.typography.bold18.withColor(context.colors.textWhite)),
          Text(
            context.l10n.purchase_title,
            style: context.typography.medium13.withColor(
              context.colors.textWhite.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}
