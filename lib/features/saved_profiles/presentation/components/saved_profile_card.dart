import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import 'saved_profile_track_button.dart';

/// One saved facility: logo, name and likes, status, headline, the branch it is
/// shown for, and the track-updates toggle.
///
/// Every accent on the card — heart, branch chip, toggle — comes from the
/// facility's activity line, so a mixed list stays readable by colour alone.
class SavedProfileCard extends StatelessWidget {
  const SavedProfileCard({
    super.key,
    required this.profile,
    required this.onTap,
    required this.onTrackToggled,
  });

  final SavedProfileEntity profile;

  /// Opens the facility's profile.
  final VoidCallback onTap;

  final VoidCallback onTrackToggled;

  static const double logoSize = 64;

  @override
  Widget build(BuildContext context) {
    final facility = profile.facility;
    final (accent, accentContainer) = profile.activityLine.getColors(context);
    final radius = BorderRadius.circular(context.spacing.s16);

    return Container(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: radius,
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.sm,
      ),
      child: TappableScale(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s12),
          child: Row(
            crossAxisAlignment: .start,
            spacing: context.spacing.s12,
            children: [
              _Logo(name: facility.name, logoUrl: facility.logoUrl, accent: accent),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: context.spacing.s4,
                  children: [
                    Row(
                      crossAxisAlignment: .start,
                      spacing: context.spacing.s8,
                      children: [
                        Expanded(
                          child: Text(
                            facility.name,
                            style: context.typography.bold16.primary(context),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ),
                        _LikeCount(count: facility.likeCount ?? 0, accent: accent),
                      ],
                    ),
                    if (profile.isTemporarilyClosed)
                      Text(
                        context.l10n.facility_temporarilyClosed,
                        style: context.typography.book12.error(context),
                      ),
                    Text(
                      facility.description,
                      style: context.typography.book14.secondary(context),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    Row(
                      children: [
                        // Expanded rather than a Spacer alongside: a Spacer
                        // would claim half the free space and clip the label
                        // long before it needs to be.
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: profile.branchLabel == null
                                ? const SizedBox.shrink()
                                : _BranchChip(
                                    label: profile.branchLabel!,
                                    accent: accent,
                                    accentContainer: accentContainer,
                                  ),
                          ),
                        ),
                        SavedProfileTrackButton(
                          isTracked: profile.isTracked,
                          accent: accent,
                          accentContainer: accentContainer,
                          onTap: onTrackToggled,
                          semanticLabel: profile.isTracked
                              ? context.l10n.savedProfiles_trackingUpdates
                              : context.l10n.savedProfiles_trackUpdates,
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
}

class _Logo extends StatelessWidget {
  const _Logo({required this.name, required this.logoUrl, required this.accent});

  final String name;
  final String? logoUrl;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.square(
        dimension: SavedProfileCard.logoSize,
        child: ShimmerImage(
          imageUrl: logoUrl,
          width: SavedProfileCard.logoSize,
          height: SavedProfileCard.logoSize,
          borderRadius: SavedProfileCard.logoSize / 2,
          fallback: ImageFallback.business(name, accent: accent),
        ),
      ),
    );
  }
}

class _LikeCount extends StatelessWidget {
  const _LikeCount({required this.count, required this.accent});

  final int count;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    return Row(
      mainAxisSize: .min,
      spacing: context.spacing.s4,
      children: [
        Icon(SolarIconsBold.heart, color: accent, size: 20),
        Text(count.toString(), style: context.typography.medium14.primary(context)),
      ],
    );
  }
}

/// The branch this card is shown for, tinted to the activity line.
class _BranchChip extends StatelessWidget {
  const _BranchChip({
    required this.label,
    required this.accent,
    required this.accentContainer,
  });

  final String label;
  final Color accent;
  final Color accentContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(color: accentContainer, shape: const StadiumBorder()),
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: context.spacing.s4,
        children: [
          Assets.svgs.location.svg(width: 16, height: 16, colorFilter: accent.colorFilter),
          Flexible(
            child: Text(
              label,
              style: context.typography.medium12.withColor(accent),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
