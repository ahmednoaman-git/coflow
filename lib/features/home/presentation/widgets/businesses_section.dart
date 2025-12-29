import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import 'business_card.dart';

/// Section displaying businesses in a horizontal scrolling list.
class BusinessesSection extends StatelessWidget {
  const BusinessesSection({
    super.key,
    required this.profiles,
    this.onBusinessTap,
    this.onFilterTap,
  });

  /// List of business profiles to display.
  final List<ProfileEntity> profiles;

  /// Callback when a business card is tapped.
  final void Function(ProfileEntity)? onBusinessTap;

  /// Callback when the filter button is tapped.
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.businesses,
                style: context.typography.bold18.primary(context),
              ),
              // Filter button
              GestureDetector(
                onTap: onFilterTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spacing.s12,
                    vertical: context.spacing.s8,
                  ),
                  decoration: ShapeDecoration(
                    color: context.colors.signatureBlue,
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(context.spacing.s24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: context.spacing.s4,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: context.colors.textWhite,
                      ),
                      Text(
                        context.l10n.allLocation('Egypt'),
                        style: context.typography.medium12.inverse(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.spacing.s16),
        // Horizontal list
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.spacing.s24),
            itemCount: profiles.length,
            separatorBuilder: (_, _) => SizedBox(width: context.spacing.s12),
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return BusinessCard(
                profile: profile,
                onTap: () => onBusinessTap?.call(profile),
              );
            },
          ),
        ),
      ],
    );
  }
}
