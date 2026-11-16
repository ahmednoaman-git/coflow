import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/domain.dart';
import 'purchase_badge_view.dart';
import 'purchase_style.dart';
import 'purchase_ticket_card.dart';

/// Opens a purchase's sheet, on [ticket] when the card stands for one.
typedef OpenPurchase = void Function(UserPurchaseEntity purchase, PurchasedTicketEntity? ticket);

/// One facility's purchases: a header with its logo, name and count that
/// folds the cards away, then a card per ticket — under the promotion's name
/// for promotion purchases.
class PurchaseFacilitySection extends StatefulWidget {
  const PurchaseFacilitySection({
    super.key,
    required this.group,
    required this.category,
    required this.period,
    required this.onOpen,
  });

  final PurchaseFacilityGroupEntity group;
  final UserPurchaseCategory category;
  final UserPurchasePeriod period;
  final OpenPurchase onOpen;

  static const double logoSize = 48;

  @override
  State<PurchaseFacilitySection> createState() => _PurchaseFacilitySectionState();
}

class _PurchaseFacilitySectionState extends State<PurchaseFacilitySection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final group = widget.group;
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        _Header(
          group: group,
          isExpanded: _isExpanded,
          onTap: () => setState(() => _isExpanded = !_isExpanded),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          alignment: AlignmentDirectional.topCenter,
          child: _isExpanded
              ? Padding(
                  padding: EdgeInsets.only(top: spacing.s16),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    spacing: spacing.s16,
                    children: [
                      for (final purchase in group.purchases)
                        _PurchaseEntry(
                          purchase: purchase,
                          category: widget.category,
                          period: widget.period,
                          onOpen: widget.onOpen,
                        ),
                    ],
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.group, required this.isExpanded, required this.onTap});

  final PurchaseFacilityGroupEntity group;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final (accent, _) =
        group.facility?.activityLine.getColors(context) ?? (context.colors.signatureBlue, null);

    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(PurchaseFacilitySection.logoSize / 2),
      child: Row(
        spacing: context.spacing.s12,
        children: [
          ShimmerImage(
            imageUrl: group.facility?.logoUrl,
            width: PurchaseFacilitySection.logoSize,
            height: PurchaseFacilitySection.logoSize,
            borderRadius: PurchaseFacilitySection.logoSize / 2,
            fallback: ImageFallback.business(group.facilityName, accent: accent),
          ),
          Expanded(
            child: Text(
              '${group.facilityName} (${group.purchases.length})',
              style: context.typography.book18.primary(context),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          AnimatedRotation(
            turns: isExpanded ? 0 : 0.5,
            duration: const Duration(milliseconds: 220),
            child: Icon(
              SolarIconsOutline.altArrowUp,
              size: 24,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// A purchase's cards: one per ticket, under the promotion's name when it was
/// bought as one. A gifted coupon is a single card.
class _PurchaseEntry extends StatelessWidget {
  const _PurchaseEntry({
    required this.purchase,
    required this.category,
    required this.period,
    required this.onOpen,
  });

  final UserPurchaseEntity purchase;
  final UserPurchaseCategory category;
  final UserPurchasePeriod period;
  final OpenPurchase onOpen;

  @override
  Widget build(BuildContext context) {
    final coupon = purchase.coupon;
    if (purchase.kind == PurchaseKind.coupon || coupon != null) {
      return _couponCard(context, coupon);
    }

    // A row the API sent without its tickets (brief F2) still gets a card,
    // named after the purchase, without counts.
    final cards = purchase.tickets.isEmpty
        ? [_ticketCard(context, null)]
        : [for (final ticket in purchase.tickets) _ticketCard(context, ticket)];

    if (!purchase.kind.isPromotion) {
      return Column(crossAxisAlignment: .stretch, spacing: context.spacing.s16, children: cards);
    }

    return Column(
      crossAxisAlignment: .stretch,
      spacing: context.spacing.s16,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: context.spacing.s16),
          child: Text(
            '${purchase.promotionName} (${cards.length})',
            style: context.typography.book16.primary(context),
          ),
        ),
        ...cards,
      ],
    );
  }

  Widget _ticketCard(BuildContext context, PurchasedTicketEntity? ticket) {
    final validityDays = purchase.validityDaysOf(ticket);
    final showValidity =
        period == UserPurchasePeriod.current &&
        validityDays != null &&
        !(ticket?.isUsedUp ?? false);

    return PurchaseTicketCard(
      title: ticket?.name ?? purchase.name,
      accent: category.accent(context),
      countLabel: ticket == null ? null : purchaseTicketCountLabel(ticket),
      // Gifts carry no chip in their lists; a purchase's says where it stands.
      badge: switch (purchase.badge) {
        final badge? when category == UserPurchaseCategory.purchases => PurchaseBadgeView(
          badge: badge,
        ),
        _ => null,
      },
      date: _date(context, purchase.createdAt),
      footer: showValidity ? context.l10n.myPurchases_validFor(validityDays) : null,
      addOnsCount: purchase.addOns.length,
      onTap: () => onOpen(purchase, ticket),
    );
  }

  Widget _couponCard(BuildContext context, GiftCouponEntity? coupon) {
    final appliedAt = purchase.appliedPurchase?.createdAt;
    final validityDays = coupon?.validityDays;

    final footer = switch (period) {
      UserPurchasePeriod.current when validityDays != null => context.l10n.myPurchases_validFor(
        validityDays,
      ),
      // No link to the purchase it was applied to (brief F7): no date to show.
      UserPurchasePeriod.history when appliedAt != null => context.l10n.myPurchases_applied(
        PurchaseDateFormat.card(context, appliedAt),
      ),
      _ => null,
    };

    return PurchaseTicketCard(
      title: coupon == null ? purchase.name : couponPercentLabel(coupon),
      accent: category.accent(context),
      date: _date(context, purchase.createdAt),
      footer: footer,
      onTap: () => onOpen(purchase, null),
    );
  }

  String? _date(BuildContext context, DateTime? date) =>
      date == null ? null : PurchaseDateFormat.card(context, date);
}
