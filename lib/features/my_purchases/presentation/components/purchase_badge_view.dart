import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

/// A purchase's status, as the design draws it: DUE and PAID as tinted pills
/// (they can still change), EXPIRED, REFUNDED and GIFT as bare coloured text.
class PurchaseBadgeView extends StatelessWidget {
  const PurchaseBadgeView({super.key, required this.badge});

  final PurchaseBadge badge;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return switch (badge) {
      PurchaseBadge.due => PurchasePill(
        label: l10n.myPurchases_statusDue,
        color: colors.energyCherryPrimary,
        background: colors.energyCherrySecondary,
      ),
      PurchaseBadge.paid => PurchasePill(
        label: l10n.myPurchases_statusPaid,
        color: colors.seaCaribbeanPrimary,
        background: colors.seaCaribbeanSecondary,
      ),
      PurchaseBadge.expired => _BareLabel(
        label: l10n.myPurchases_statusExpired,
        color: colors.energyCherryPrimary,
      ),
      PurchaseBadge.refunded => _BareLabel(
        label: l10n.myPurchases_statusRefunded,
        color: colors.energyCherryPrimary,
      ),
      PurchaseBadge.gift => _BareLabel(
        label: l10n.myPurchases_statusGift,
        color: colors.earthSunnyGoldPrimary,
      ),
    };
  }
}

/// Whether the refund covered the whole amount: FULL or PARTIAL.
class PurchaseRefundPill extends StatelessWidget {
  const PurchaseRefundPill({super.key, required this.extent});

  final PurchaseRefundExtent extent;

  @override
  Widget build(BuildContext context) => PurchasePill(
    label: switch (extent) {
      PurchaseRefundExtent.full => context.l10n.myPurchases_refundFull,
      PurchaseRefundExtent.partial => context.l10n.myPurchases_refundPartial,
    },
    color: context.colors.energyCherryPrimary,
    background: context.colors.energyCherrySecondary,
  );
}

/// The small tinted pill the status chips are drawn in.
class PurchasePill extends StatelessWidget {
  const PurchasePill({
    super.key,
    required this.label,
    required this.color,
    required this.background,
  });

  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.s8, vertical: context.spacing.s4),
      decoration: ShapeDecoration(
        color: background,
        shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(context.spacing.s24)),
      ),
      child: Text(label, style: context.typography.medium12.withColor(color)),
    );
  }
}

class _BareLabel extends StatelessWidget {
  const _BareLabel({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) =>
      Text(label, style: context.typography.medium13.withColor(color));
}
