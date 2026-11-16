import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/pricing/components/promotion_display_utils.dart';
import 'package:coflow_users_v2/features/purchase/domain/entities/entities.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'purchase_badge_view.dart';
import 'purchase_style.dart';

/// A section title, with an optional value (usually a date) at its end.
class PurchaseSectionHeader extends StatelessWidget {
  const PurchaseSectionHeader({super.key, required this.title, this.trailing, this.suffix});

  final String title;

  /// Muted text right after [title], e.g. "(Applied In)".
  final String? suffix;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return Row(
      spacing: context.spacing.s12,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: title, style: typography.medium16.primary(context)),
                if (suffix case final suffix?)
                  TextSpan(text: ' $suffix', style: typography.book16.tertiary(context)),
              ],
            ),
          ),
        ),
        if (trailing case final trailing?)
          Text(trailing, style: typography.medium14.secondary(context)),
      ],
    );
  }
}

/// "Validity · 12 Day(s)".
class PurchaseValidityRow extends StatelessWidget {
  const PurchaseValidityRow({super.key, required this.days, required this.accent});

  final int days;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          context.l10n.myPurchases_validity,
          style: context.typography.medium16.primary(context),
        ),
        Text(
          context.l10n.facilityDetails_days(days),
          style: context.typography.medium16.withColor(accent),
        ),
      ],
    );
  }
}

/// A titled row of outlined chips: Access, or what a coupon applies on.
class PurchaseChipsSection extends StatelessWidget {
  const PurchaseChipsSection({
    super.key,
    required this.title,
    required this.labels,
    required this.accent,
  });

  final String title;
  final List<String> labels;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: .start,
      spacing: spacing.s12,
      children: [
        PurchaseSectionHeader(title: title),
        Wrap(
          spacing: spacing.s8,
          runSpacing: spacing.s8,
          children: [
            for (final label in labels)
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing.s12, vertical: spacing.s8),
                decoration: ShapeDecoration(
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(spacing.s24),
                    side: BorderSide(color: accent),
                  ),
                ),
                child: Text(label, style: context.typography.medium13.withColor(accent)),
              ),
          ],
        ),
      ],
    );
  }
}

/// The add-ons bought with a purchase, as bullets.
class PurchaseAddOnsSection extends StatelessWidget {
  const PurchaseAddOnsSection({super.key, required this.addOns});

  final List<PurchasedAddOnEntity> addOns;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: .start,
      spacing: spacing.s12,
      children: [
        PurchaseSectionHeader(title: context.l10n.myPurchases_addOns),
        Wrap(
          spacing: spacing.s24,
          runSpacing: spacing.s8,
          children: [
            for (final addOn in addOns)
              Row(
                mainAxisSize: .min,
                spacing: spacing.s8,
                children: [
                  CircleAvatar(backgroundColor: context.colors.textSecondary, radius: 2.5),
                  Text(addOn.name, style: context.typography.book14.secondary(context)),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

/// A dated block naming what a state left behind: "Expired · 1x Class Pass",
/// "Refunded", or the date a ticket was gifted.
class PurchaseEventSection extends StatelessWidget {
  const PurchaseEventSection({
    super.key,
    required this.title,
    required this.accent,
    this.date,
    this.ticket,
  });

  final String title;
  final Color accent;
  final DateTime? date;

  /// The tickets the event caught: what was left of them.
  final PurchasedTicketEntity? ticket;

  @override
  Widget build(BuildContext context) {
    final ticket = this.ticket;
    final count = switch (ticket) {
      null => null,
      PurchasedTicketEntity(unlimited: true) => '∞x',
      PurchasedTicketEntity(:final remaining?) when remaining > 0 => '${remaining}x',
      _ => null,
    };

    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s12,
      children: [
        PurchaseSectionHeader(
          title: title,
          trailing: date == null ? null : PurchaseDateFormat.sheet(context, date!),
        ),
        if (ticket != null && count != null)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '$count ', style: context.typography.bold14.withColor(accent)),
                TextSpan(text: ticket.name, style: context.typography.book14.secondary(context)),
              ],
            ),
          ),
      ],
    );
  }
}

/// "Promotion Information" (or "From Promotion" for a gift): the promotion's
/// name, then what it bundles or what buying it gets.
class PurchasePromotionSection extends StatelessWidget {
  const PurchasePromotionSection({
    super.key,
    required this.title,
    required this.promotion,
    required this.accent,
    this.date,
  });

  final String title;
  final FacilityPromotionEntity promotion;
  final Color accent;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final content = switch (promotion) {
      FacilityPromotionPackageEntity(:final tickets) => buildPackagePromotionOfferContent(
        context,
        tickets: tickets,
        accentColor: accent,
      ),
      FacilityPromotionBuyGetEntity(:final buyTickets, :final reward) =>
        buildBuyGetPromotionOfferContent(
          context,
          buyTickets: buyTickets,
          reward: reward,
          accentColor: accent,
        ),
      FacilityPromotionDiscountEntity(:final discountFor) => buildDiscountPromotionOfferContent(
        context,
        appliesOn: discountFor,
        accentColor: accent,
      ),
    };

    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s12,
      children: [
        PurchaseSectionHeader(
          title: title,
          trailing: date == null ? null : PurchaseDateFormat.sheet(context, date!),
        ),
        Text(promotion.name, style: context.typography.book14.secondary(context)),
        content,
      ],
    );
  }
}

/// "Purchase Invoice": the lines, the coupon, the total with whether it is
/// paid, and the refund when there was one.
class PurchaseInvoiceBlock extends StatelessWidget {
  const PurchaseInvoiceBlock({
    super.key,
    required this.purchase,
    required this.invoice,
    this.titleSuffix,
  });

  final UserPurchaseEntity purchase;
  final PurchaseInvoiceEntity invoice;

  /// "(Applied In)" on a used coupon's sheet.
  final String? titleSuffix;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final accent = colors.earthSunnyGoldPrimary;
    final createdAt = purchase.createdAt;
    final refundExtent = purchase.refundExtent;

    return Column(
      crossAxisAlignment: .stretch,
      spacing: context.spacing.s12,
      children: [
        PurchaseSectionHeader(
          title: l10n.purchase_invoiceTitle,
          suffix: titleSuffix,
          trailing: createdAt == null ? null : PurchaseDateFormat.sheet(context, createdAt),
        ),
        for (final line in invoice.lines)
          _AmountRow(
            label: Text.rich(
              TextSpan(
                children: [
                  if (line.quantity > 1)
                    TextSpan(
                      text: '${line.quantity}x ',
                      style: context.typography.medium14.withColor(accent),
                    ),
                  TextSpan(text: line.label, style: context.typography.book14.primary(context)),
                ],
              ),
            ),
            value: '+ ${line.amount.priceText(invoice.currency)}',
          ),
        if (invoice.hasCouponDiscount)
          _AmountRow(
            label: Text(
              l10n.purchase_couponDiscount,
              style: context.typography.book14.tertiary(context),
            ),
            value: '- ${invoice.couponDiscount.priceText(invoice.currency)}',
          ),
        Divider(height: 1, color: colors.strokeSecondary),
        _AmountRow(
          label: _LabelWithPill(
            label: l10n.purchase_totalAmount,
            pill: switch (purchase.paymentState) {
              PurchasePaymentState.due => const PurchaseBadgeView(badge: PurchaseBadge.due),
              PurchasePaymentState.paid => const PurchaseBadgeView(badge: PurchaseBadge.paid),
              PurchasePaymentState.free => null,
            },
          ),
          value: invoice.total.priceText(invoice.currency),
        ),
        if (refundExtent != null)
          _AmountRow(
            label: _LabelWithPill(
              label: l10n.myPurchases_refundAmount,
              pill: PurchaseRefundPill(extent: refundExtent),
            ),
            value: purchase.refundAmount.priceText(invoice.currency),
          ),
      ],
    );
  }
}

class _LabelWithPill extends StatelessWidget {
  const _LabelWithPill({required this.label, this.pill});

  final String label;
  final Widget? pill;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: .min,
    spacing: context.spacing.s8,
    children: [
      Flexible(child: Text(label, style: context.typography.book16.primary(context))),
      ?pill,
    ],
  );
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({required this.label, required this.value});

  final Widget label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s12,
      children: [
        Expanded(
          child: Align(alignment: AlignmentDirectional.centerStart, child: label),
        ),
        Text(
          value,
          style: context.typography.medium16.withColor(context.colors.earthSunnyGoldPrimary),
        ),
      ],
    );
  }
}
