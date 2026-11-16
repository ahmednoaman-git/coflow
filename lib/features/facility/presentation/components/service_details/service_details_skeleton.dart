import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder for [ServiceDetailsSections] while the details load: two
/// sections — a title over a paragraph — split by the same divider.
class ServiceDetailsSkeleton extends StatelessWidget {
  const ServiceDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    Widget section({required double titleWidth, required int lines}) => Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        SkeletonText(style: typography.bold16, width: titleWidth),
        SkeletonText(style: typography.book14, lines: lines),
      ],
    );

    return Skeleton(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          section(titleWidth: 110, lines: 3),
          Divider(height: context.spacing.s32, color: context.colors.strokePrimary),
          section(titleWidth: 90, lines: 2),
        ],
      ),
    );
  }
}
