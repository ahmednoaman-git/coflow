import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'facility_tickets.dart';
import 'ticket_tile.dart';

/// Placeholder for a [TicketTile]: the same painted ticket and sections, with
/// bones for the icon, name, access line and price row.
class TicketSkeleton extends StatelessWidget {
  const TicketSkeleton({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    const middleSectionWidth = 14.0;
    final iconBoxWidth = FacilityTicketsList.ticketHeight;
    final typography = context.typography;

    return CustomPaint(
      size: size,
      painter: TicketPainter(
        context: context,
        iconBoxWidth: iconBoxWidth,
        middleSectionWidth: middleSectionWidth,
      ),
      child: SizedBox.fromSize(
        size: size,
        child: Row(
          children: [
            SizedBox(
              width: iconBoxWidth,
              child: const Center(child: SkeletonBox(width: 32, height: 32, radius: 8)),
            ),
            const SizedBox(width: middleSectionWidth),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.spacing.s16),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    SkeletonText(style: typography.medium14, widthFactor: 0.6),
                    SkeletonText(style: typography.book12, widthFactor: 0.4),
                    const Spacer(),
                    Row(
                      children: [
                        SkeletonText(style: typography.medium14, width: 40),
                        const Spacer(),
                        SkeletonText(style: typography.medium14, width: 72),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// [count] [TicketSkeleton]s, sized and spaced like [FacilityTicketsList].
class TicketSkeletonList extends StatelessWidget {
  const TicketSkeletonList({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ticketWidth = constraints.maxWidth.clamp(200, 480).toDouble();
        final size = Size(ticketWidth, FacilityTicketsList.ticketHeight);

        return Skeleton(
          child: Column(
            spacing: context.spacing.s16,
            children: [for (var i = 0; i < count; i++) TicketSkeleton(size: size)],
          ),
        );
      },
    );
  }
}
