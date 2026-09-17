import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Confirmation step in front of signing out. Returns true when confirmed.
class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({super.key});

  static Future<bool?> show(BuildContext context) => showDialog<bool>(
    context: context,
    builder: (_) => const LogoutConfirmDialog(),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Dialog(
      insetPadding: EdgeInsets.all(context.spacing.s24),
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          spacing: context.spacing.s16,
          children: [
            Text(
              l10n.account_logoutConfirmTitle,
              style: context.typography.bold20.primary(context),
            ),
            Text(
              l10n.account_logoutConfirmBody,
              style: context.typography.book14.secondary(context),
            ),
            Row(
              spacing: context.spacing.s12,
              children: [
                Expanded(
                  child: MainButton(
                    text: l10n.account_cancel,
                    backgroundColor: context.colors.backgroundGrey,
                    textColor: context.colors.textPrimary,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
                Expanded(
                  child: MainButton(
                    text: l10n.account_logout,
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
