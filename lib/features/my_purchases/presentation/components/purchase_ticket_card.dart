import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/pricing/components/ticket_tile.dart'
    show TicketPainter;
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// One card in the Purchases and Gifts lists: a ticket stub with the count and
/// ticket glyph, a perforation, then the name, status, date and footer.
///
/// Drawn with the facility Pricing tab's [TicketPainter], so a bought ticket
/// looks like the ticket it was bought from. The card grows with its text
/// rather than clipping it at large text sizes.
class PurchaseTicketCard extends StatelessWidget {
  const PurchaseTicketCard({
    super.key,
    required this.title,
    required this.accent,
    this.countLabel,
    this.badge,
    this.date,
    this.footer,
    this.addOnsCount = 0,
    this.onTap,
  });

  final String title;
  final Color accent;

  /// `12x` or `∞` above the glyph; none for a coupon.
  final String? countLabel;

  /// The status chip at the title's end.
  final Widget? badge;

  /// The purchase date, already formatted.
  final String? date;

  /// The line under the date: validity, or when a coupon was applied.
  final String? footer;
  final int addOnsCount;
  final VoidCallback? onTap;

  static const double minHeight = 104;
  static const double stubWidth = 104;
  static const double _perforationWidth = 14;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final typography = context.typography;
    final addOns = addOnsCount > 0 ? _AddOnsPill(count: addOnsCount) : null;
    final hasFooter = footer != null;

    return TappableScale(
      onTap: onTap,
      scaleChildOnly: true,
      child: Stack(
        children: [
          // The painter lays the stub out on the left; mirror it in RTL so it
          // stays under the stub, which the row puts on the right.
          Positioned.fill(
            child: Transform.flip(
              flipX: context.isRTL,
              child: CustomPaint(
                painter: TicketPainter(
                  context: context,
                  iconBoxWidth: stubWidth,
                  middleSectionWidth: _perforationWidth,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: minHeight),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  SizedBox(
                    width: stubWidth,
                    child: Column(
                      mainAxisAlignment: .center,
                      spacing: spacing.s4,
                      children: [
                        if (countLabel case final count?)
                          Text(count, style: typography.book16.withColor(accent)),
                        Assets.svgs.ticket.svg(
                          width: 32,
                          height: 32,
                          colorFilter: accent.colorFilter,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: _perforationWidth),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        spacing.s4,
                        spacing.s16,
                        spacing.s16,
                        spacing.s16,
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .spaceBetween,
                        spacing: spacing.s12,
                        children: [
                          Row(
                            crossAxisAlignment: .start,
                            spacing: spacing.s8,
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: typography.medium14.primary(context),
                                  maxLines: 2,
                                  overflow: .ellipsis,
                                ),
                              ),
                              ?badge,
                            ],
                          ),
                          Column(
                            crossAxisAlignment: .start,
                            spacing: spacing.s8,
                            children: [
                              Row(
                                spacing: spacing.s8,
                                children: [
                                  if (date case final date?) ...[
                                    Icon(
                                      SolarIconsOutline.calendar,
                                      size: 18,
                                      color: context.colors.textSecondary,
                                    ),
                                    Expanded(
                                      child: Text(
                                        date,
                                        style: typography.medium14.primary(context),
                                      ),
                                    ),
                                  ] else
                                    const Spacer(),
                                  if (!hasFooter) ?addOns,
                                ],
                              ),
                              if (hasFooter) ...[
                                Divider(height: 1, color: context.colors.strokeSecondary),
                                Row(
                                  spacing: spacing.s8,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        footer!,
                                        style: typography.book12.tertiary(context),
                                      ),
                                    ),
                                    ?addOns,
                                  ],
                                ),
                              ],
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
        ],
      ),
    );
  }
}

class _AddOnsPill extends StatelessWidget {
  const _AddOnsPill({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.s8, vertical: context.spacing.s4),
      decoration: ShapeDecoration(
        color: context.colors.backgroundGrey,
        shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(context.spacing.s24)),
      ),
      child: Text(
        context.l10n.myPurchases_addOnsCount(count),
        style: context.typography.medium12.primary(context),
      ),
    );
  }
}
