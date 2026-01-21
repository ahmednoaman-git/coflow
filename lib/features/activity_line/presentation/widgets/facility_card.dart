import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import 'tag_chip_single_row_with_overflow.dart';

/// Card displaying a collapsed facility.
class FacilityCard extends StatelessWidget {
  const FacilityCard({super.key, required this.facility});

  final CollapsedFacilityEntity facility;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to facility details screen
        },
        borderRadius: BorderRadius.circular(context.spacing.s16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.spacing.s12),
              child: Row(
                children: [
                  // Logo
                  _buildLogo(context),
                  SizedBox(width: context.spacing.s12),
                  // Info section
                  Expanded(child: _buildInfoSection(context)),
                  // Like indicator
                  if (facility.likeCount != null && facility.likeCount! > 0)
                    _buildLikeIndicator(context),
                ],
              ),
            ),
            // Tags section
            if (facility.tags.isNotEmpty) ...[
              Divider(height: 1, color: context.colors.strokePrimary),
              Padding(
                padding: EdgeInsets.all(context.spacing.s12),
                child: TagChipSingleRowWithOverflow(
                  tags: facility.tags,
                  activityLine: facility.activityLine,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: ShapeDecoration(
        shape: const CircleBorder(),
        color: context.colors.backgroundGrey,
        image: facility.logoUrl != null
            ? DecorationImage(
                image: NetworkImage(facility.logoUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: facility.logoUrl == null
          ? Icon(
              Icons.business_rounded,
              color: context.colors.textTertiary,
            )
          : null,
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        Text(
          facility.name.capitalize(),
          style: context.typography.medium14.primary(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Status message (if temporarily closed)
        if (facility.status == FacilityStatus.temporarilyClosed)
          Text(
            'Temporarily Closed', // TODO: Localize
            style: context.typography.book10.error(context),
          ),
        // Description
        Text(
          facility.description.capitalize(),
          style: context.typography.book12.secondary(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Icons
        SizedBox(height: context.spacing.s4),
        FacilityCardIconSection(facility: facility),
      ],
    );
  }

  Widget _buildLikeIndicator(BuildContext context) {
    final (primaryColor, _) = facility.activityLine.getColors(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: context.spacing.s4,
      children: [
        Icon(Icons.favorite_rounded, color: primaryColor, size: 20),
        Text(
          facility.likeCount.toString(),
          style: context.typography.book12.primary(context),
        ),
      ],
    );
  }
}

/// Displays icons based on facility subscription and payment status.
class FacilityCardIconSection extends StatelessWidget {
  const FacilityCardIconSection({super.key, required this.facility});

  final CollapsedFacilityEntity facility;

  @override
  Widget build(BuildContext context) {
    final icons = _getIcons();
    if (icons.isEmpty) return const SizedBox.shrink();

    return Row(
      spacing: context.spacing.s4,
      children: [
        for (final icon in icons)
          Icon(
            icon,
            size: 16,
            color: context.colors.textTertiary,
          ),
      ],
    );
  }

  /// Gets icon paths based on subscription status and payment type.
  ///
  /// | Subscription | Payment Type | Icons |
  /// |---|---|---|
  /// | basic | * | percentage |
  /// | trial | * | (none) |
  /// | active | directPurchase | cash, calendar, percentage |
  /// | active | fullOnline/deposit | creditCard, calendar, percentage |
  /// | inactive | * | percentage |
  List<IconData> _getIcons() {
    // Choose Solar Outline icons matching the design
    // - percentage/tag: discount indicator
    // - banknote: cash payment
    // - calendar: scheduled payments / subscription
    // - card: credit card / online payment

    final percentage = SolarIconsOutline.tagPrice;
    final cash = SolarIconsOutline.banknote;
    final calendar = SolarIconsOutline.calendar;
    final card = SolarIconsOutline.card;

    return switch (facility.subscriptionStatus) {
      SubscriptionStatus.basic => [percentage],
      SubscriptionStatus.trial => [],
      SubscriptionStatus.active => switch (facility.paymentType) {
        PaymentType.directPurchase => [cash, calendar, percentage],
        PaymentType.fullOnline || PaymentType.depositOnline => [card, calendar, percentage],
        _ => [percentage],
      },
      SubscriptionStatus.inactive => [percentage],
    };
  }
}

extension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
