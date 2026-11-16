import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// Placeholder for a day's timeline — the Calendar's reservations and a
/// facility's schedule both lay out the same way: rows split by dividers, each
/// a tinted card with its start and end times in a gutter beside it.
///
/// [withLogo] adds the facility row a reservation card opens with; a session
/// card opens straight on its name.
class CalendarTimelineSkeleton extends StatelessWidget {
  const CalendarTimelineSkeleton({super.key, this.count = 3, this.withLogo = false});

  final int count;
  final bool withLogo;

  /// Width of the time gutter, sized for `12:00 PM` — as in the timelines.
  static const double gutterWidth = 72;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        children: [
          for (var index = 0; index < count; index++) ...[
            if (index > 0) Divider(height: 1, color: context.colors.strokePrimary),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.spacing.s16),
              child: _Row(withLogo: withLogo),
            ),
          ],
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.withLogo});

  final bool withLogo;

  @override
  Widget build(BuildContext context) {
    final time = SkeletonText(
      style: context.typography.book14,
      width: 52,
      alignment: .center,
    );

    // As in the timelines: the card sizes the row, and the gutter stretches
    // to it so the end time sits on the card's bottom edge.
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: CalendarTimelineSkeleton.gutterWidth + context.spacing.s8,
          ),
          child: _Card(withLogo: withLogo),
        ),
        PositionedDirectional(
          start: 0,
          top: 0,
          bottom: 0,
          width: CalendarTimelineSkeleton.gutterWidth,
          child: Column(mainAxisAlignment: .spaceBetween, children: [time, time]),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.withLogo});

  final bool withLogo;

  static const double _logoSize = 32;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final spacing = context.spacing;

    // The card is a tinted surface; here it's the base bone, its contents
    // strong bones on top.
    return Stack(
      children: [
        const Positioned.fill(child: SkeletonBox(radius: 16)),
        Padding(
          padding: EdgeInsets.all(spacing.s12),
          child: Column(
            crossAxisAlignment: .start,
            spacing: spacing.s8,
            children: [
              if (withLogo) ...[
                Row(
                  spacing: spacing.s8,
                  children: [
                    const SkeletonCircle(size: _logoSize, tone: .strong),
                    Expanded(
                      child: SkeletonText(
                        style: typography.bold18,
                        widthFactor: 0.6,
                        tone: .strong,
                      ),
                    ),
                  ],
                ),
                SkeletonText(style: typography.book14, widthFactor: 0.45, tone: .strong),
              ] else
                SkeletonText(style: typography.bold16, widthFactor: 0.55, tone: .strong),
              SkeletonChip(
                style: typography.medium11,
                labelWidth: 56,
                padding: EdgeInsets.symmetric(horizontal: spacing.s8, vertical: spacing.s4),
                tone: .strong,
              ),
              SizedBox(height: spacing.s16),
              Row(
                spacing: spacing.s8,
                children: [
                  const SkeletonBox(width: 20, height: 20, radius: 6, tone: .strong),
                  Expanded(
                    child: SkeletonText(
                      style: typography.medium14,
                      widthFactor: 0.5,
                      tone: .strong,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
