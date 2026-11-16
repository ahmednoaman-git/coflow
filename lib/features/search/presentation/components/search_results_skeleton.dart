import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder for one search result, in the layout of the tab's own tile —
/// for the first page ([SearchResultsSkeleton]) and the "load more" footer.
class SearchResultSkeleton extends StatelessWidget {
  /// A `SearchBusinessTile`: a bare row with a round logo.
  const SearchResultSkeleton.business({super.key}) : _kind = _Kind.business;

  /// A `SearchInstructorTile`: a card with a round photo.
  const SearchResultSkeleton.instructor({super.key}) : _kind = _Kind.instructor;

  /// A `SearchServiceTile`: a card with a square thumbnail and the facility
  /// credit under the name.
  const SearchResultSkeleton.service({super.key}) : _kind = _Kind.service;

  final _Kind _kind;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final typography = context.typography;

    final row = Row(
      spacing: spacing.s12,
      children: [
        switch (_kind) {
          .business => const SkeletonCircle(size: 48),
          .instructor => const SkeletonCircle(size: 56),
          .service => const SkeletonBox(width: 56, height: 56, radius: 12),
        },
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            spacing: _kind == .service ? spacing.s8 : spacing.s4,
            children: [
              SkeletonText(style: typography.medium16, widthFactor: 0.55),
              if (_kind == .service)
                Row(
                  spacing: spacing.s4,
                  children: [
                    const SkeletonCircle(size: 20),
                    SkeletonText(style: typography.book13, width: 120),
                  ],
                )
              else
                SkeletonText(style: typography.book14, widthFactor: 0.8),
            ],
          ),
        ),
      ],
    );

    if (_kind == .business) {
      return Padding(padding: EdgeInsets.all(spacing.s8), child: row);
    }
    return Container(
      padding: EdgeInsets.all(spacing.s12),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: row,
    );
  }
}

enum _Kind { business, instructor, service }

/// A tab's first page loading: [item] repeated in the results list's own
/// padding and spacing.
class SearchResultsSkeleton extends StatelessWidget {
  const SearchResultsSkeleton({super.key, required this.item, this.itemCount = 6});

  final Widget item;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: context.spacing.s8,
          bottom: context.bottomInset + context.spacing.s24,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (context, index) => SizedBox(height: context.spacing.s12),
        itemBuilder: (context, index) => item,
      ),
    );
  }
}
