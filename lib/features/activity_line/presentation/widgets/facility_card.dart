import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import 'tag_chip_single_row_with_overflow.dart';

/// Card displaying a collapsed facility.
class FacilityCard extends StatelessWidget {
  const FacilityCard({super.key, required this.facility});

  final CollapsedFacilityEntity facility;

  static const double logoSize = 56;

  @override
  Widget build(BuildContext context) {
    return FacilityCardSurface(
      child: TappableScale(
        borderRadius: BorderRadius.circular(context.spacing.s16),
        onTap: () {
          context.router.push(
            FacilityDetailsRoute(facility: facility),
          );
        },
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
    return ClipOval(
      child: SizedBox(
        width: logoSize,
        height: logoSize,
        child: ShimmerImage(
          imageUrl: facility.logoUrl,
          width: logoSize,
          height: logoSize,
          borderRadius: 100,
          fallback: ImageFallback.business(
            facility.name,
            accent: facility.activityLine.getColors(context).$1,
          ),
        ),
      ),
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
            context.l10n.facility_temporarilyClosed,
            style: context.typography.book10.error(context),
          ),
        // Description
        Text(
          facility.description.capitalize(),
          style: context.typography.book12.secondary(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Icons, then where the facility is
        SizedBox(height: context.spacing.s4),
        Row(
          spacing: context.spacing.s8,
          children: [
            FacilityCardIconSection(facility: facility),
            if (facility.locationLabel case final location?)
              Flexible(child: _LocationLabel(location)),
          ],
        ),
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

/// `📍 Maadi, Cairo`, sized to sit on the same line as the feature icons.
class _LocationLabel extends StatelessWidget {
  const _LocationLabel(this.location);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: context.spacing.s4,
      children: [
        Assets.svgs.location.svg(
          width: 16,
          height: 16,
          colorFilter: context.colors.textSecondary.colorFilter,
        ),
        Flexible(
          child: Text(
            location,
            style: context.typography.book12.secondary(context),
            maxLines: 1,
            overflow: .ellipsis,
          ),
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
        for (final icon in icons) Icon(icon, size: 16, color: context.colors.textSecondary),
      ],
    );
  }

  /// Gets icon paths based on subscription status and payment type.
  ///
  /// | Subscription | Payment Type | Icons |
  /// Feature icons displayed on the facility card, derived from
  /// [AccountType] features and [PaymentType].
  List<IconData> _getIcons() {
    final features = facility.accountType.features(facility.subscriptionStatus);
    if (features.isEmpty) return const [];

    return [
      if (facility.paymentType == PaymentType.directPurchase) SolarIconsOutline.banknote,
      if (features.contains(FacilityFeature.onlinePayment) &&
          (facility.paymentType == PaymentType.fullOnline ||
              facility.paymentType == PaymentType.depositOnline))
        SolarIconsOutline.card,
      if (features.contains(FacilityFeature.calendar)) SolarIconsOutline.calendar,
      if (features.contains(FacilityFeature.schedule)) SolarIconsOutline.calendar,
      if (features.contains(FacilityFeature.purchasing)) SolarIconsOutline.tagPrice,
    ];
  }
}

extension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

/// A facility card's surface — its fill, outline, corners and shadow — shared
/// by [FacilityCard] and [FacilityCardSkeleton] so the two line up exactly.
class FacilityCardSurface extends StatelessWidget {
  const FacilityCardSurface({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: child,
    );
  }
}

/// Placeholder for a [FacilityCard]: its surface and layout, with bones for
/// the logo, name, description, feature icons, location and tags.
///
/// Wrap a group of these in one `Skeleton` so they sweep together.
class FacilityCardSkeleton extends StatelessWidget {
  const FacilityCardSkeleton({super.key});

  static const List<double> _tagLabelWidths = [52, 68, 44];

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final spacing = context.spacing;

    return FacilityCardSurface(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(spacing.s12),
            child: Row(
              spacing: spacing.s12,
              children: [
                const SkeletonCircle(size: FacilityCard.logoSize),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      SkeletonText(style: typography.medium14, widthFactor: 0.55),
                      SkeletonText(style: typography.book12, widthFactor: 0.85),
                      SizedBox(height: spacing.s4),
                      Row(
                        spacing: spacing.s8,
                        children: [
                          Row(
                            spacing: spacing.s4,
                            children: [
                              for (var index = 0; index < 3; index++)
                                const SkeletonBox(width: 16, height: 16, radius: 4),
                            ],
                          ),
                          SkeletonText(style: typography.book12, width: 96),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: context.colors.strokePrimary),
          Padding(
            padding: EdgeInsets.all(spacing.s12),
            child: Row(
              spacing: TagChipSingleRowWithOverflow.chipSpacing,
              children: [
                for (final width in _tagLabelWidths)
                  SkeletonChip(
                    style: typography.book10,
                    labelWidth: width,
                    padding: TagChipSingleRowWithOverflow.chipPadding,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
