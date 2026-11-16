import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// The last step before deleting the account. Spells out what is lost, and
/// only enables Delete once the customer ticks that they understand. Returns
/// true when confirmed.
class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({super.key});

  static Future<bool?> show(BuildContext context) => showDialog<bool>(
    context: context,
    builder: (_) => const DeleteAccountDialog(),
  );

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  bool _understood = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final danger = context.colors.energyCherryPrimary;

    return Dialog(
      insetPadding: EdgeInsets.all(context.spacing.s24),
      backgroundColor: context.colors.backgroundWhite,
      shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.s24),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          spacing: context.spacing.s16,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: context.colors.energyCherrySecondary.withValues(alpha: 0.6),
                shape: const CircleBorder(),
              ),
              child: Icon(SolarIconsOutline.trashBinTrash, color: danger, size: 28),
            ),
            Text(l10n.deleteAccount_title, style: context.typography.bold20.primary(context)),
            Text(
              l10n.deleteAccount_body,
              style: context.typography.book14.secondary(context).copyWith(height: 1.5),
            ),
            TappableScale(
              borderRadius: BorderRadius.circular(context.spacing.s8),
              onTap: () => setState(() => _understood = !_understood),
              child: Row(
                crossAxisAlignment: .start,
                spacing: context.spacing.s8,
                children: [
                  SizedBox.square(
                    dimension: 24,
                    child: Checkbox(
                      value: _understood,
                      activeColor: danger,
                      side: BorderSide(color: context.colors.strokeSecondary, width: 1.5),
                      onChanged: (value) => setState(() => _understood = value ?? false),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      l10n.deleteAccount_understand,
                      style: context.typography.medium14.primary(context),
                    ),
                  ),
                ],
              ),
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
                    text: l10n.deleteAccount_confirm,
                    backgroundColor: danger,
                    isDisabled: !_understood,
                    onPressed: _understood ? () => Navigator.of(context).pop(true) : null,
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
