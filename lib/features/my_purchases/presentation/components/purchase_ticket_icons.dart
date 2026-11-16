import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

/// The row of ticket glyphs under a sheet's title: one per ticket bought,
/// available ones in the accent and used ones in [usedColor]. An unlimited
/// ticket shows `∞` and one glyph.
class PurchaseTicketIcons extends StatelessWidget {
  const PurchaseTicketIcons({
    super.key,
    required this.ticket,
    required this.color,
    required this.usedColor,
  });

  final PurchasedTicketEntity ticket;
  final Color color;
  final Color usedColor;

  /// Glyphs drawn before the rest collapse into a `+N` count, so a large pack
  /// can't push the sheet's content off screen.
  static const int maxIcons = 30;

  @override
  Widget build(BuildContext context) {
    final total = ticket.iconCount;
    final used = ticket.usedIconCount;
    final shown = total.clamp(0, maxIcons);
    // Used tickets go last, as in the design; when capped, keep the split.
    final shownUsed = total == 0 ? 0 : (used * shown / total).round();

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: context.spacing.s4,
      runSpacing: context.spacing.s8,
      children: [
        if (ticket.unlimited) Text('∞', style: context.typography.bold20.withColor(color)),
        for (var i = 0; i < shown; i++)
          RotatedBox(
            quarterTurns: 1,
            child: Assets.svgs.ticket.svg(
              width: 26,
              height: 26,
              colorFilter: (i >= shown - shownUsed ? usedColor : color).colorFilter,
            ),
          ),
        if (total > shown)
          Text(
            '+${total - shown}',
            style: context.typography.medium14.withColor(color),
          ),
      ],
    );
  }
}

/// Just the glyph, for a coupon's sheet.
class PurchaseSingleTicketIcon extends StatelessWidget {
  const PurchaseSingleTicketIcon({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => RotatedBox(
    quarterTurns: 1,
    child: Assets.svgs.ticket.svg(width: 26, height: 26, colorFilter: color.colorFilter),
  );
}
