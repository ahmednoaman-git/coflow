import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// One row of [AccountManagementList].
class AccountManagementAction {
  const AccountManagementAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
}

/// The grouped settings card under the Account screen's counters.
class AccountManagementList extends StatelessWidget {
  const AccountManagementList({super.key, required this.actions});

  final List<AccountManagementAction> actions;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.spacing.s16);

    return Container(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: radius,
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.xs,
      ),
      child: ClipRSuperellipse(
        borderRadius: radius,
        child: Column(
          children: [
            for (final (index, action) in actions.indexed) ...[
              if (index > 0)
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: context.spacing.s16,
                  endIndent: context.spacing.s16,
                  color: context.colors.strokePrimary,
                ),
              _ActionRow(action: action),
            ],
          ],
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.action});

  final AccountManagementAction action;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: action.onTap,
      scaleEnd: 0.98,
      borderRadius: BorderRadius.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s16,
          vertical: context.spacing.s16,
        ),
        child: Row(
          spacing: context.spacing.s12,
          children: [
            Icon(action.icon, size: 24, color: context.colors.textPrimary),
            Expanded(
              child: Text(
                action.label,
                style: context.typography.medium16.primary(context),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            Icon(
              // Points toward the direction of travel, so it flips in Arabic.
              context.isRTL ? SolarIconsOutline.altArrowLeft : SolarIconsOutline.altArrowRight,
              size: 20,
              color: context.colors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
