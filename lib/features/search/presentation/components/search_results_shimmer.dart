import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder rows shown while a tab's request is in flight.
class SearchResultsShimmer extends StatelessWidget {
  const SearchResultsShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: context.spacing.s8,
          bottom: context.bottomInset + context.spacing.s24,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (context, index) => SizedBox(height: context.spacing.s12),
        itemBuilder: (context, index) => const _RowPlaceholder(),
      ),
    );
  }
}

class _RowPlaceholder extends StatelessWidget {
  const _RowPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s12,
      children: [
        const ShimmerBox(width: 56, height: 56, borderRadius: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: context.spacing.s8,
            children: const [
              ShimmerBox(width: 160, height: 14, borderRadius: 4),
              ShimmerBox(width: 110, height: 12, borderRadius: 4),
            ],
          ),
        ),
      ],
    );
  }
}
