import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'saved_profile_card.dart';
import 'saved_profile_track_button.dart';

/// Placeholder for the saved list: [SavedProfileCard]s — logo, name and likes,
/// description, branch chip and track button — on the card's own surface
/// and spacing.
class SavedProfilesSkeleton extends StatelessWidget {
  const SavedProfilesSkeleton({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        spacing: context.spacing.s16,
        children: [for (var index = 0; index < itemCount; index++) const _CardSkeleton()],
      ),
    );
  }
}

class _CardSkeleton extends StatelessWidget {
  const _CardSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final typography = context.typography;

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: Padding(
        padding: EdgeInsets.all(spacing.s12),
        child: Row(
          crossAxisAlignment: .start,
          spacing: spacing.s12,
          children: [
            const SkeletonCircle(size: SavedProfileCard.logoSize),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: spacing.s4,
                children: [
                  Row(
                    spacing: spacing.s8,
                    children: [
                      Expanded(child: SkeletonText(style: typography.bold16, widthFactor: 0.6)),
                      const SkeletonBox(width: 20, height: 20, radius: 6),
                      SkeletonText(style: typography.medium14, width: 14),
                    ],
                  ),
                  SkeletonText(style: typography.book14, widthFactor: 0.85),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: SkeletonChip(
                            style: typography.medium12,
                            labelWidth: 96,
                            padding: EdgeInsets.symmetric(
                              horizontal: spacing.s8,
                              vertical: spacing.s4,
                            ),
                          ),
                        ),
                      ),
                      const SkeletonCircle(size: SavedProfileTrackButton.size),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
