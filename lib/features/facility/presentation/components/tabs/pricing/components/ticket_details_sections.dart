import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';

import 'ticket_details_bottom_sheet.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketDetails = TicketDetailsProvider.of(context);
    final accentColor = ticketDetails.facilityData.activityLineColor;
    final ticketData = ticketDetails.data;

    return Column(
      spacing: context.spacing.s16,
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              spacing: context.spacing.s8,
              children: [
                Assets.svgs.cash.svg(
                  width: 24,
                  height: 24,
                  colorFilter: context.colors.textPrimary.colorFilter,
                ),
                Text(
                  context.l10n.facilityDetails_ticketPrice,
                  style: context.typography.medium14.primary(context),
                ),
              ],
            ),
            Expanded(
              child: Text(
                '${ticketData.currency} ${ticketData.discountPrice ?? ticketData.price}',
                textAlign: .end,
                style: context.typography.medium14
                    .primary(context)
                    .copyWith(
                      color: accentColor,
                    ),
              ),
            ),
          ],
        ),
        if (ticketData.addOns.isNotEmpty)
          AddOnsSection(
            addOns: ticketData.addOns,
            currency: ticketData.currency,
          ),
      ],
    );
  }
}

class AddOnsSection extends StatelessWidget {
  const AddOnsSection({
    super.key,
    required this.addOns,
    required this.currency,
  });

  final List<AddOnEntity> addOns;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
      child: Column(
        spacing: context.spacing.s8,
        crossAxisAlignment: .start,
        children: [
          Text(
            context.l10n.facilityDetails_addOns,
            style: context.typography.medium12.secondary(context),
          ),
          _buildAddOnList(context),
        ],
      ),
    );
  }

  Widget _buildAddOnList(BuildContext context) {
    final accent = TicketDetailsProvider.of(context).facilityData.activityLineColor;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.s8),
      child: Column(
        spacing: context.spacing.s8,
        crossAxisAlignment: .start,
        children: [
          for (final addOn in addOns)
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  spacing: context.spacing.s4,
                  children: [
                    CircleAvatar(
                      backgroundColor: context.colors.textTertiary,
                      radius: 2,
                    ),
                    Text(
                      addOn.name,
                      style: context.typography.book12.tertiary(context),
                    ),
                  ],
                ),
                Text(
                  '$currency ${addOn.price}',
                  style: context.typography.book12
                      .secondary(context)
                      .copyWith(
                        color: accent,
                      ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class AccessSection extends StatelessWidget {
  const AccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketDetails = TicketDetailsProvider.of(context);
    final accentColor = ticketDetails.facilityData.activityLineColor;
    final services = ticketDetails.data.services;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.l10n.facilityDetails_access,
          style: context.typography.medium14.primary(context),
        ),
        SizedBox(height: context.spacing.s8),
        Wrap(
          spacing: context.spacing.s8,
          runSpacing: context.spacing.s8,
          children: services.map((service) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.s8,
                vertical: context.spacing.s8,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: accentColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                service.name,
                style: context.typography.book12
                    .primary(context)
                    .copyWith(
                      color: accentColor,
                    ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ConditionsSection extends StatelessWidget {
  const ConditionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketDetails = TicketDetailsProvider.of(context);
    final conditions = ticketDetails.data.conditions;

    return Column(
      spacing: context.spacing.s8,
      crossAxisAlignment: .start,
      children: [
        Text(
          context.l10n.facilityDetails_conditions,
          style: context.typography.medium14.primary(context),
        ),
        Text(
          conditions.isNotEmpty ? conditions : '-',
          style: context.typography.book12.tertiary(context),
        ),
      ],
    );
  }
}

class ValidityAndPurchaseSection extends StatelessWidget {
  const ValidityAndPurchaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketDetails = TicketDetailsProvider.of(context);
    final accentColor = ticketDetails.facilityData.activityLineColor;
    final l10n = context.l10n;

    return Column(
      spacing: context.spacing.s24,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              l10n.facilityDetails_validity,
              style: context.typography.medium14.primary(context),
            ),
            Text(
              ticketDetails.data.validityText(l10n),
              style: context.typography.medium14
                  .primary(context)
                  .copyWith(
                    color: accentColor,
                  ),
            ),
          ],
        ),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: MainButton(
            backgroundColor: accentColor,
            text: l10n.facilityDetails_purchase,
            onPressed: () {
              // Close the bottom sheet
              Navigator.pop(context);

              // TODO: Navigate to the purchase screen
            },
          ),
        ),
      ],
    );
  }
}
