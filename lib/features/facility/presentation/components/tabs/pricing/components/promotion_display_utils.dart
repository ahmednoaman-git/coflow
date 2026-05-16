import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';

Widget buildDiscountPromotionOfferContent(
  BuildContext context, {
  required FacilityPromotionAppliesOn appliesOn,
  required Color accentColor,
}) {
  final labelStyle = _promotionLabelStyle(context, accentColor);
  final bodyStyle = _promotionBodyStyle(context);

  return Text.rich(
    buildPromotionInlineLabelTextSpan(
      label: context.l10n.facilityDetails_appliedOn,
      labelStyle: labelStyle,
      contentSpans: [
        TextSpan(
          text: localizedPromotionAppliesOn(context, appliesOn),
          style: bodyStyle,
        ),
      ],
    ),
  );
}

Widget buildPackagePromotionOfferContent(
  BuildContext context, {
  required List<FacilityPromotionTicketLineEntity> tickets,
  required Color accentColor,
}) {
  final bodyStyle = _promotionBodyStyle(context);

  return Text.rich(
    TextSpan(
      children: buildPromotionTicketSummarySpans(
        context,
        tickets,
        textStyle: bodyStyle,
        valueStyle: _promotionAccentValueStyle(context, accentColor),
        separatorStyle: bodyStyle,
      ),
    ),
  );
}

Widget buildBuyGetPromotionOfferContent(
  BuildContext context, {
  required List<FacilityPromotionTicketLineEntity> buyTickets,
  required FacilityPromotionRewardEntity reward,
  required Color accentColor,
}) {
  final labelStyle = _promotionLabelStyle(context, accentColor);
  final bodyStyle = _promotionBodyStyle(context);
  final valueStyle = _promotionPrimaryValueStyle(context);

  return Column(
    spacing: context.spacing.s8,
    crossAxisAlignment: .start,
    children: [
      Text.rich(
        buildPromotionInlineLabelTextSpan(
          label: context.l10n.facilityDetails_buy,
          labelStyle: labelStyle,
          contentSpans: buildPromotionTicketSummarySpans(
            context,
            buyTickets,
            textStyle: bodyStyle,
            valueStyle: valueStyle,
            separatorStyle: bodyStyle,
          ),
        ),
      ),
      Text.rich(
        buildPromotionInlineLabelTextSpan(
          label: context.l10n.facilityDetails_get,
          labelStyle: labelStyle,
          contentSpans: buildPromotionRewardSpans(
            context,
            reward,
            textStyle: bodyStyle,
            valueStyle: valueStyle,
            separatorStyle: bodyStyle,
          ),
        ),
      ),
    ],
  );
}

TextSpan buildPromotionInlineLabelTextSpan({
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

List<InlineSpan> buildPromotionTicketSummarySpans(
  BuildContext context,
  List<FacilityPromotionTicketLineEntity> tickets, {
  required TextStyle textStyle,
  required TextStyle valueStyle,
  required TextStyle separatorStyle,
}) {
  if (tickets.isEmpty) {
    return [TextSpan(text: context.l10n.facilityDetails_unknown, style: textStyle)];
  }

  final spans = <InlineSpan>[];

  for (var i = 0; i < tickets.length; i++) {
    if (i > 0) {
      spans.add(TextSpan(text: ' + ', style: separatorStyle));
    }

    spans.addAll(
      _buildPromotionTicketLineSpans(
        context,
        tickets[i],
        textStyle: textStyle,
        valueStyle: valueStyle,
      ),
    );
  }

  return spans;
}

List<InlineSpan> buildPromotionRewardSpans(
  BuildContext context,
  FacilityPromotionRewardEntity reward, {
  required TextStyle textStyle,
  required TextStyle valueStyle,
  required TextStyle separatorStyle,
}) {
  return switch (reward) {
    FacilityPromotionGiftRewardEntity(:final giftName) => [
      TextSpan(text: giftName, style: textStyle),
    ],
    FacilityPromotionTicketRewardEntity(:final tickets) => buildPromotionTicketSummarySpans(
      context,
      tickets,
      textStyle: textStyle,
      valueStyle: valueStyle,
      separatorStyle: separatorStyle,
    ),
    FacilityPromotionCouponRewardEntity(:final coupons) => _buildPromotionCouponSpans(
      context,
      coupons,
      textStyle: textStyle,
      valueStyle: valueStyle,
      separatorStyle: separatorStyle,
    ),
  };
}

String localizedPromotionAppliesOn(
  BuildContext context,
  FacilityPromotionAppliesOn appliesOn,
) {
  return switch (appliesOn) {
    FacilityPromotionAppliesOn.tickets => context.l10n.facilityDetails_promotionAppliedOnTickets,
    FacilityPromotionAppliesOn.promotions =>
      context.l10n.facilityDetails_promotionAppliedOnPromotions,
    FacilityPromotionAppliesOn.packages => context.l10n.facilityDetails_promotionAppliedOnPackages,
    FacilityPromotionAppliesOn.purchases =>
      context.l10n.facilityDetails_promotionAppliedOnPurchases,
    FacilityPromotionAppliesOn.allTickets =>
      context.l10n.facilityDetails_promotionAppliedOnAllTickets,
    FacilityPromotionAppliesOn.allPromotions =>
      context.l10n.facilityDetails_promotionAppliedOnAllPromotions,
    FacilityPromotionAppliesOn.allPackages =>
      context.l10n.facilityDetails_promotionAppliedOnAllPackages,
    FacilityPromotionAppliesOn.allPurchases =>
      context.l10n.facilityDetails_promotionAppliedOnAllPurchases,
    FacilityPromotionAppliesOn.unknown => context.l10n.facilityDetails_unknown,
  };
}

List<InlineSpan> _buildPromotionTicketLineSpans(
  BuildContext context,
  FacilityPromotionTicketLineEntity ticket, {
  required TextStyle textStyle,
  required TextStyle valueStyle,
}) {
  final name = ticket.name == facilityPromotionFallbackTicketName
      ? context.l10n.facilityDetails_ticketFallbackLabel
      : ticket.name;
  final quantityText = switch ((ticket.unlimited, ticket.count)) {
    (true, _) => context.l10n.facilityDetails_unlimited,
    (false, final count?) => '${count}x',
    (false, null) => null,
  };

  if (quantityText == null || quantityText.isEmpty) {
    return [TextSpan(text: name, style: textStyle)];
  }

  return [
    TextSpan(text: '$quantityText ', style: valueStyle),
    TextSpan(text: name, style: textStyle),
  ];
}

List<InlineSpan> _buildPromotionCouponSpans(
  BuildContext context,
  List<FacilityPromotionCouponEntity> coupons, {
  required TextStyle textStyle,
  required TextStyle valueStyle,
  required TextStyle separatorStyle,
}) {
  if (coupons.isEmpty) {
    return [TextSpan(text: context.l10n.facilityDetails_unknown, style: textStyle)];
  }

  final spans = <InlineSpan>[];

  for (var i = 0; i < coupons.length; i++) {
    if (i > 0) {
      spans.add(TextSpan(text: ' + ', style: separatorStyle));
    }

    final coupon = coupons[i];
    spans.add(TextSpan(text: '${coupon.percentageText} ', style: valueStyle));
    spans.add(
      TextSpan(
        text: localizedPromotionAppliesOn(context, coupon.appliesOn),
        style: textStyle,
      ),
    );
  }

  return spans;
}

TextStyle _promotionLabelStyle(BuildContext context, Color accentColor) {
  return context.typography.bold14.withColor(accentColor);
}

TextStyle _promotionBodyStyle(BuildContext context) {
  return context.typography.book14.secondary(context);
}

TextStyle _promotionPrimaryValueStyle(BuildContext context) {
  return context.typography.bold14.primary(context);
}

TextStyle _promotionAccentValueStyle(BuildContext context, Color accentColor) {
  return context.typography.bold14.withColor(accentColor);
}
