import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import 'facility_tickets.dart';
import 'ticket_tile.dart';

/// Shimmer placeholder that exactly matches [TicketTile] dimensions.
class TicketShimmer extends StatelessWidget {
  const TicketShimmer({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    const middleSectionWidth = 14.0;
    final iconBoxWidth = FacilityTicketsList.ticketHeight;

    return Shimmer(
      child: CustomPaint(
        size: size,
        painter: TicketPainter(
          context: context,
          iconBoxWidth: iconBoxWidth,
          middleSectionWidth: middleSectionWidth,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              // Icon placeholder
              SizedBox(
                width: iconBoxWidth,
                height: size.height,
                child: const Center(
                  child: ShimmerBox.dark(width: 32, height: 32, borderRadius: 8),
                ),
              ),
              const SizedBox(width: middleSectionWidth),
              // Content placeholders
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(context.spacing.s16),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      // Title placeholder
                      const ShimmerBox.dark(width: 140, height: 14, borderRadius: 4),
                      SizedBox(height: context.spacing.s4),
                      // Subtitle placeholder
                      const ShimmerBox.dark(width: 90, height: 12, borderRadius: 4),
                      const Spacer(),
                      // Price row
                      Row(
                        children: [
                          const ShimmerBox.dark(width: 40, height: 14, borderRadius: 4),
                          const Spacer(),
                          const ShimmerBox.dark(width: 70, height: 14, borderRadius: 4),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows multiple [TicketShimmer] placeholders as a loading state.
class TicketShimmerList extends StatelessWidget {
  const TicketShimmerList({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ticketWidth = constraints.maxWidth.clamp(200, 480).toDouble();
        final size = Size(ticketWidth, FacilityTicketsList.ticketHeight);

        return Column(
          spacing: context.spacing.s16,
          children: [
            for (var i = 0; i < count; i++) TicketShimmer(size: size),
          ],
        );
      },
    );
  }
}
