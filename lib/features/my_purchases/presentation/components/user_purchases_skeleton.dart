import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'purchase_facility_section.dart';
import 'purchase_ticket_card.dart';

/// Placeholder for a tab while it loads: two facility headers, each over a
/// couple of ticket cards, at the real sizes and gaps.
class UserPurchasesSkeleton extends StatelessWidget {
  const UserPurchasesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final typography = context.typography;

    return Skeleton(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: spacing.s32,
        children: [
          for (var group = 0; group < 2; group++)
            Column(
              crossAxisAlignment: .stretch,
              spacing: spacing.s16,
              children: [
                Row(
                  spacing: spacing.s12,
                  children: [
                    const SkeletonCircle(size: PurchaseFacilitySection.logoSize),
                    Expanded(child: SkeletonText(style: typography.book18, widthFactor: 0.5)),
                  ],
                ),
                for (var card = 0; card < 2 - group; card++)
                  SkeletonBox(
                    height: PurchaseTicketCard.minHeight + spacing.s16,
                    radius: spacing.s12,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
