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
    required this.onTrackToggled,
  });

  final SavedProfileEntity profile;
  final VoidCallback onTrackToggled;

  static const double _logoSize = 64;

  @override
  Widget build(BuildContext context) {
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
        // TODO: open the facility profile. `FacilityDetailsRoute` wants a whole
        // `CollapsedFacilityEntity`, which the saved list does not carry — wire
        // this up once the endpoint lands (either it returns the collapsed
        // facility, or the details route takes an id).
        onTap: null,
        child: Padding(
          padding: EdgeInsets.all(context.spacing.s12),
          child: Row(
            crossAxisAlignment: .start,
            spacing: context.spacing.s12,
            children: [
              _Logo(profile: profile),
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
                            profile.name,
                            style: context.typography.bold16.primary(context),
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                        ),
                        _LikeCount(count: profile.likeCount, accent: accent),
                      ],
                    ),
                    if (profile.isTemporarilyClosed)
                      Text(
                        context.l10n.facility_temporarilyClosed,
                        style: context.typography.book12.error(context),
                      ),
                    Text(
                      profile.description,
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
  const _Logo({required this.profile});

  final SavedProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.square(
        dimension: SavedProfileCard._logoSize,
        child: ShimmerImage(
          imageUrl: profile.logoUrl,
          width: SavedProfileCard._logoSize,
          height: SavedProfileCard._logoSize,
          borderRadius: SavedProfileCard._logoSize / 2,
          errorWidget: ColoredBox(
            color: context.colors.backgroundGrey,
            child: Center(
              child: Text(
                profile.name.characters.first.toUpperCase(),
                style: context.typography.bold18.tertiary(context),
              ),
            ),
          ),
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
