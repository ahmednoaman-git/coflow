import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder matching the timeline's gutter + card layout.
class CalendarShimmer extends StatelessWidget {
  const CalendarShimmer({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Column(
        spacing: context.spacing.s24,
        children: [
          for (var i = 0; i < count; i++) const _TimelineRowShimmer(),
        ],
      ),
    );
  }
}

class _TimelineRowShimmer extends StatelessWidget {
  const _TimelineRowShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        const SizedBox(
          width: 72,
          child: Column(
            crossAxisAlignment: .center,
            children: [ShimmerBox.dark(width: 56, height: 14, borderRadius: 4)],
          ),
        ),
        const Expanded(
          child: ShimmerBox(height: 140, borderRadius: 16),
        ),
      ],
    );
  }
}
