import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/core/domain/entities/activity_line_entity.dart' as core;
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

/// Business profile card widget displaying cover, logo, name, and location.
class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.profile, this.onTap});

  /// Profile entity to display.
  final ProfileEntity profile;

  /// Callback when card is tapped.
  final VoidCallback? onTap;

  static const double width = 180;
  static const double height = 240;
  static const double radius = 24;
  static const double logoSize = 32;

  @override
  Widget build(BuildContext context) {
    final (accent, _) = core.ActivityLineEntity.fromId(profile.activityLine.id).getColors(context);

    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          // Same corners as the clip below, so the shadow follows the card.
          shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(radius)),
          shadows: context.shadows.md,
        ),
        child: ClipRSuperellipse(
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Cover image
              ShimmerImage(
                imageUrl: profile.cover,
                fit: BoxFit.cover,
                fallback: ImageFallback.cover(accent: accent),
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                    stops: const [0.4, 1.0],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: EdgeInsets.all(context.spacing.s12),
                child: Column(
                  mainAxisAlignment: .end,
                  crossAxisAlignment: .center,
                  children: [
                    // Logo
                    Container(
                      width: logoSize,
                      height: logoSize,
                      decoration: ShapeDecoration(
                        color: context.colors.backgroundWhite,
                        shape: RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.circular(
                            context.spacing.s8,
                          ),
                        ),
                      ),
                      child: ClipRSuperellipse(
                        borderRadius: BorderRadius.circular(context.spacing.s8),
                        child: ShimmerImage(
                          imageUrl: profile.logo,
                          width: logoSize,
                          height: logoSize,
                          fit: BoxFit.cover,
                          fallback: ImageFallback.business(profile.name, accent: accent),
                        ),
                      ),
                    ),
                    SizedBox(height: context.spacing.s8),
                    // Name
                    Text(
                      profile.name,
                      style: context.typography.medium14.inverse(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.spacing.s4),
                    // Location
                    if (profile.area != null || profile.city != null)
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: context.colors.textWhite.withValues(
                              alpha: 0.8,
                            ),
                          ),
                          SizedBox(width: context.spacing.s4),
                          Flexible(
                            child: Text(
                              _buildLocationText(),
                              style: context.typography.book12.copyWith(
                                color: context.colors.textWhite.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildLocationText() {
    final parts = <String>[];
    if (profile.area != null) parts.add(profile.area!.name);
    if (profile.city != null) parts.add(profile.city!.name);
    return parts.join(', ');
  }
}

/// Placeholder for a [BusinessCard] while the home request loads: the card's
/// own size and corners, with bones where its logo, name and location sit.
class BusinessCardSkeleton extends StatelessWidget {
  const BusinessCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: BusinessCard.width,
      height: BusinessCard.height,
      child: Stack(
        fit: .expand,
        children: [
          const SkeletonBox(radius: BusinessCard.radius),
          Padding(
            padding: EdgeInsets.all(context.spacing.s12),
            child: Column(
              mainAxisAlignment: .end,
              children: [
                SkeletonBox(
                  width: BusinessCard.logoSize,
                  height: BusinessCard.logoSize,
                  radius: context.spacing.s8,
                  tone: .strong,
                ),
                SizedBox(height: context.spacing.s8),
                SkeletonText(
                  style: context.typography.medium14,
                  width: 96,
                  alignment: .center,
                  tone: .strong,
                ),
                SizedBox(height: context.spacing.s4),
                SkeletonText(
                  style: context.typography.book12,
                  width: 120,
                  alignment: .center,
                  tone: .strong,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
