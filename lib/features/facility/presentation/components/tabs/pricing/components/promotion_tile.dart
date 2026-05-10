import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../facility_data_provider.dart';

class PromotionTile extends StatelessWidget {
  const PromotionTile({super.key, required this.promotion});

  final FacilityPromotionEntity promotion;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return Container(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: EdgeInsets.all(context.spacing.s16),
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.spacing.s16,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        promotion.name,
                        style: context.typography.medium16.primary(context),
                      ),
                    ),
                    SizedBox(width: context.spacing.s12),
                    _ValueBadge(
                      text: promotion.trailingValueText,
                      backgroundColor: facilityData.activityLineBackground,
                      textColor: facilityData.activityLineColor,
                    ),
                  ],
                ),
                switch (promotion) {
                  final FacilityPromotionDiscountEntity discountPromotion => _DiscountPromotionBody(
                    promotion: discountPromotion,
                  ),
                  final FacilityPromotionPackageEntity packagePromotion => _PackagePromotionBody(
                    promotion: packagePromotion,
                  ),
                  final FacilityPromotionBuyGetEntity buyGetPromotion => _BuyGetPromotionBody(
                    promotion: buyGetPromotion,
                  ),
                },
              ],
            ),
          ),
          Divider(color: context.colors.strokeSecondary, height: 0),
          Padding(
            padding: EdgeInsets.all(context.spacing.s16),
            child: _PromotionFooter(promotion: promotion),
          ),
        ],
      ),
    );
  }
}

class _DiscountPromotionBody extends StatelessWidget {
  const _DiscountPromotionBody({required this.promotion});

  final FacilityPromotionDiscountEntity promotion;

  @override
  Widget build(BuildContext context) {
    return _SectionBlock(
      label: context.l10n.facilityDetails_appliedOn,
      child: Text(
        _localizedPromotionText(context, promotion.appliedOnText),
        style: context.typography.book14.primary(context),
      ),
    );
  }
}

class _PackagePromotionBody extends StatelessWidget {
  const _PackagePromotionBody({required this.promotion});

  final FacilityPromotionPackageEntity promotion;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final baseStyle = context.typography.book13.primary(context);
    final emphasisStyle = context.typography.book13
        .withWeight(FontWeight.w700)
        .withColor(facilityData.activityLineColor);

    return Text.rich(
      TextSpan(
        children: _buildTicketSummarySpans(
          context,
          promotion.tickets,
          textStyle: baseStyle,
          emphasisStyle: emphasisStyle,
        ),
      ),
    );
  }
}

class _BuyGetPromotionBody extends StatelessWidget {
  const _BuyGetPromotionBody({required this.promotion});

  final FacilityPromotionBuyGetEntity promotion;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final labelStyle = context.typography.medium14.withColor(facilityData.activityLineColor);
    final baseStyle = context.typography.book13.primary(context);
    final emphasisStyle = context.typography.book13
        .withWeight(FontWeight.w700)
        .withColor(context.colors.textPrimary);

    return Column(
      spacing: context.spacing.s8,
      crossAxisAlignment: .start,
      children: [
        Text.rich(
          _buildInlineLabelTextSpan(
            label: context.l10n.facilityDetails_buy,
            labelStyle: labelStyle,
            contentSpans: _buildTicketSummarySpans(
              context,
              promotion.buyTickets,
              textStyle: baseStyle,
              emphasisStyle: emphasisStyle,
            ),
          ),
        ),
        Text.rich(
          _buildInlineLabelTextSpan(
            label: context.l10n.facilityDetails_get,
            labelStyle: labelStyle,
            contentSpans: _buildRewardSpans(
              context,
              promotion.reward,
              textStyle: baseStyle,
              emphasisStyle: emphasisStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class _PromotionFooter extends StatelessWidget {
  const _PromotionFooter({required this.promotion});

  final FacilityPromotionEntity promotion;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: context.spacing.s4,
            children: [
              Icon(
                SolarIconsOutline.calendar,
                size: 20,
                color: facilityData.activityLineColor,
              ),
              Expanded(
                child: Text(
                  AppDateUtils.formatDateFromContext(context, promotion.endDate),
                  style: context.typography.book13.secondary(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (promotion.remainingCountOrNull case final remainingCount?)
          Expanded(
            child: Row(
              spacing: context.spacing.s4,
              children: [
                Icon(
                  SolarIconsOutline.sale,
                  size: 22,
                  color: facilityData.activityLineColor,
                ),
                Text(
                  '$remainingCount ${context.l10n.facilityDetails_remaining}',
                  style: context.typography.book13.secondary(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        Icon(
          promotion.isLiked ? SolarIconsBold.heart : SolarIconsOutline.heart,
          color: promotion.isLiked ? facilityData.activityLineColor : context.colors.textDisabled,
          size: 20,
        ),
      ],
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);

    return Column(
      spacing: context.spacing.s4,
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style: context.typography.medium14.withColor(facilityData.activityLineColor),
        ),
        child,
      ],
    );
  }
}

class _ValueBadge extends StatelessWidget {
  const _ValueBadge({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.typography.medium16.withColor(textColor),
    );
  }
}

TextSpan _buildInlineLabelTextSpan({
  required String label,
  required TextStyle labelStyle,
  required List<InlineSpan> contentSpans,
}) {
  return TextSpan(
    children: [
      TextSpan(text: '$label ', style: labelStyle),
      ...contentSpans,
    ],
  );
}

List<InlineSpan> _buildTicketSummarySpans(
  BuildContext context,
  List<FacilityPromotionTicketLineEntity> tickets, {
  required TextStyle textStyle,
  required TextStyle emphasisStyle,
}) {
  if (tickets.isEmpty) {
    return [TextSpan(text: context.l10n.facilityDetails_unknown, style: textStyle)];
  }

  final spans = <InlineSpan>[];

  for (var i = 0; i < tickets.length; i++) {
    if (i > 0) {
      spans.add(TextSpan(text: ' + ', style: emphasisStyle));
    }

    spans.addAll(
      _buildTicketLineSpans(
        context,
        tickets[i],
        textStyle: textStyle,
        emphasisStyle: emphasisStyle,
      ),
    );
  }

  return spans;
}

List<InlineSpan> _buildTicketLineSpans(
  BuildContext context,
  FacilityPromotionTicketLineEntity ticket, {
  required TextStyle textStyle,
  required TextStyle emphasisStyle,
}) {
  final name = ticket.name == facilityPromotionFallbackTicketName
      ? context.l10n.facilityDetails_ticketFallbackLabel
      : ticket.name;
  final quantityText = switch ((ticket.unlimited, ticket.count)) {
    (true, _) => context.l10n.facilityDetails_unlimited,
    (false, final count?) => '$count x',
    (false, null) => null,
  };

  if (quantityText == null || quantityText.isEmpty) {
    return [TextSpan(text: name, style: textStyle)];
  }

  return [
    TextSpan(text: '$quantityText ', style: emphasisStyle),
    TextSpan(text: name, style: textStyle),
  ];
}

List<InlineSpan> _buildRewardSpans(
  BuildContext context,
  FacilityPromotionRewardEntity reward, {
  required TextStyle textStyle,
  required TextStyle emphasisStyle,
}) {
  return switch (reward) {
    FacilityPromotionGiftRewardEntity(:final giftName) => [
      TextSpan(text: giftName, style: textStyle),
    ],
    FacilityPromotionTicketRewardEntity(:final tickets) => _buildTicketSummarySpans(
      context,
      tickets,
      textStyle: textStyle,
      emphasisStyle: emphasisStyle,
    ),
    FacilityPromotionCouponRewardEntity(:final coupons) => _buildCouponSpans(
      context,
      coupons,
      textStyle: textStyle,
      emphasisStyle: emphasisStyle,
    ),
  };
}

List<InlineSpan> _buildCouponSpans(
  BuildContext context,
  List<FacilityPromotionCouponEntity> coupons, {
  required TextStyle textStyle,
  required TextStyle emphasisStyle,
}) {
  if (coupons.isEmpty) {
    return [TextSpan(text: context.l10n.facilityDetails_unknown, style: textStyle)];
  }

  final spans = <InlineSpan>[];

  for (var i = 0; i < coupons.length; i++) {
    if (i > 0) {
      spans.add(TextSpan(text: ' + ', style: emphasisStyle));
    }

    final coupon = coupons[i];
    spans.add(TextSpan(text: '${coupon.percentageText} ', style: emphasisStyle));
    spans.add(
      TextSpan(
        text: _localizedPromotionText(context, coupon.appliesOnText),
        style: textStyle,
      ),
    );
  }

  return spans;
}

String _localizedPromotionText(BuildContext context, String value) {
  return switch (value) {
    facilityPromotionDiscountFallbackAppliedOnText =>
      context.l10n.facilityDetails_promotionAppliedOnFallback,
    facilityPromotionUnknownAppliesOnText => context.l10n.facilityDetails_unknown,
    _ => value,
  };
}
