import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'purchase_style.dart';

/// Shown when a tab has nothing to list.
class UserPurchasesEmptyState extends StatelessWidget {
  const UserPurchasesEmptyState({super.key, required this.category, required this.period});

  final UserPurchaseCategory category;
  final UserPurchasePeriod period;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (title, hint) = switch ((category, period)) {
      (UserPurchaseCategory.purchases, UserPurchasePeriod.current) => (
        l10n.myPurchases_emptyCurrent,
        l10n.myPurchases_emptyHint,
      ),
      (UserPurchaseCategory.purchases, UserPurchasePeriod.history) => (
        l10n.myPurchases_emptyHistory,
        null,
      ),
      (UserPurchaseCategory.gifts, UserPurchasePeriod.current) => (
        l10n.myGifts_emptyCurrent,
        l10n.myGifts_emptyHint,
      ),
      (UserPurchaseCategory.gifts, UserPurchasePeriod.history) => (l10n.myGifts_emptyHistory, null),
    };

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.s48),
      child: Column(
        spacing: context.spacing.s12,
        children: [
          Assets.svgs.ticket.svg(
            width: 40,
            height: 40,
            colorFilter: category.accent(context).withValues(alpha: 0.5).colorFilter,
          ),
          Text(
            title,
            style: context.typography.medium16.secondary(context),
            textAlign: .center,
          ),
          if (hint != null)
            Text(hint, style: context.typography.book14.tertiary(context), textAlign: .center),
        ],
      ),
    );
  }
}
