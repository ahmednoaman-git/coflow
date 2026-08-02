import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Shimmer placeholder for the service details sections while loading.
class ServiceDetailsShimmer extends StatelessWidget {
  const ServiceDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: Shimmer(
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: context.spacing.s16,
          children: [
            const ShimmerBox.dark(height: 12),
            const ShimmerBox.dark(height: 12),
            const SizedBox(
              width: 200,
              child: ShimmerBox.dark(height: 12),
            ),
            SizedBox(height: context.spacing.s16),
            const ShimmerBox.dark(height: 12),
            const ShimmerBox.dark(height: 12),
          ],
        ),
      ),
    );
  }
}
