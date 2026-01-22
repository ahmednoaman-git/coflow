import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

/// Business profile card widget displaying cover, logo, name, and location.
class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.profile, this.onTap});

  /// Profile entity to display.
  final ProfileEntity profile;

  /// Callback when card is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 240,
        decoration: ShapeDecoration(
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
          ),
          shadows: context.shadows.md,
        ),
        child: ClipRSuperellipse(
          borderRadius: BorderRadius.circular(context.spacing.s24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Cover image
              ShimmerImage(imageUrl: profile.cover, fit: BoxFit.cover),
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
                      width: 32,
                      height: 32,
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
                          fit: BoxFit.cover,
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
