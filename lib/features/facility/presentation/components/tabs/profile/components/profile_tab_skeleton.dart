import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../page_section.dart';

/// Placeholder for the Profile tab while the profile loads: the header — name
/// and likes, subtitle and branch, bio — then a team section and an opening
/// hours section, split by the same dividers and in [PageSection]'s padding.
class ProfileTabSkeleton extends StatelessWidget {
  const ProfileTabSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final divider = Divider(color: context.colors.strokePrimary, height: 1, thickness: 1);

    return Skeleton(
      child: Column(
        children: [
          Padding(padding: PageSection.padding(context), child: const _HeaderSkeleton()),
          divider,
          const _SectionSkeleton(titleWidth: 64, child: _TeamSkeleton()),
          divider,
          const _SectionSkeleton(titleWidth: 112, child: _HoursSkeleton()),
        ],
      ),
    );
  }
}

class _HeaderSkeleton extends StatelessWidget {
  const _HeaderSkeleton();

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final spacing = context.spacing;

    return Column(
      spacing: spacing.s8,
      children: [
        Row(
          spacing: spacing.s8,
          children: [
            Expanded(child: SkeletonText(style: typography.medium16, widthFactor: 0.55)),
            const SkeletonBox(width: 24, height: 24, radius: 8),
            SkeletonText(style: typography.medium14, width: 18),
          ],
        ),
        Row(
          children: [
            Expanded(child: SkeletonText(style: typography.medium12, widthFactor: 0.4)),
            SkeletonChip(
              style: typography.book10,
              // The branch icon sits beside the label.
              labelWidth: 14 + spacing.s4 + 56,
              padding: EdgeInsets.symmetric(horizontal: spacing.s8, vertical: spacing.s4),
            ),
          ],
        ),
        SkeletonText(style: typography.medium12, lines: 3),
      ],
    );
  }
}

/// A [PageSection]'s shape: its icon and title, then [child].
class _SectionSkeleton extends StatelessWidget {
  const _SectionSkeleton({required this.titleWidth, required this.child});

  final double titleWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageSection.padding(context),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s16,
        children: [
          Row(
            spacing: context.spacing.s16,
            children: [
              const SkeletonBox(width: 20, height: 20, radius: 6),
              SkeletonText(style: context.typography.medium14, width: titleWidth),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

/// One row of the team grid: square photos with a name and a role under each.
class _TeamSkeleton extends StatelessWidget {
  const _TeamSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final typography = context.typography;

    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: spacing.s16,
      crossAxisSpacing: spacing.s16,
      children: [
        for (var index = 0; index < 3; index++)
          Column(
            children: [
              Expanded(
                child: AspectRatio(aspectRatio: 1, child: SkeletonBox(radius: spacing.s16)),
              ),
              SizedBox(height: spacing.s4),
              SkeletonText(style: typography.medium14, widthFactor: 0.7, alignment: .center),
              SkeletonText(style: typography.medium12, widthFactor: 0.5, alignment: .center),
            ],
          ),
      ],
    );
  }
}

/// Days on the left, hours on the right, as in the operating hours section.
class _HoursSkeleton extends StatelessWidget {
  const _HoursSkeleton();

  @override
  Widget build(BuildContext context) {
    final style = context.typography.medium12;

    return Column(
      spacing: context.spacing.s16,
      children: [
        for (final daysWidth in const [0.5, 0.3, 0.4])
          Row(
            children: [
              Expanded(
                child: SkeletonText(style: style, widthFactor: daysWidth),
              ),
              SkeletonText(style: style, width: 112),
            ],
          ),
      ],
    );
  }
}
