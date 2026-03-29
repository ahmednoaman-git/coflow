import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../../../../facility/presentation/components/facility_data_provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profile});

  final FacilityProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);

    return Column(
      spacing: context.spacing.s8,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                profile.name,
                style: context.typography.medium16.primary(context),
              ),
            ),
            if (profile.likesCount != null && profile.likesCount! > 0)
              Row(
                spacing: context.spacing.s8,
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    color: context.colors.energyCherryPrimary,
                    size: 24,
                  ),
                  Text(
                    profile.likesCount.toString(),
                    style: context.typography.medium14
                        .primary(context)
                        .copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                _buildSubtitle(),
                style: context.typography.medium12.secondary(context),
              ),
            ),
            if (profile.mainBranch != null)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spacing.s8,
                  vertical: context.spacing.s4,
                ),
                decoration: ShapeDecoration(
                  color: facilityDataProvider.activityLineBackground,
                  shape: const StadiumBorder(),
                ),
                child: Row(
                  spacing: context.spacing.s4,
                  children: [
                    Assets.svgs.branch.svg(
                      colorFilter: facilityDataProvider.activityLineColor.colorFilter,
                      width: 14,
                      height: 14,
                    ),
                    Text(
                      profile.mainBranch!.name,
                      style: context.typography.book10.secondary(context),
                    ),
                  ],
                ),
              ),
          ],
        ),
        if (profile.bio != null && profile.bio!.isNotEmpty)
          AnimatedReadMoreText(
            profile.bio!,
            maxLines: 15,
            readMoreText: context.l10n.facilityDetails_seeMore,
            readLessText: context.l10n.facilityDetails_seeLess,
            textStyle: context.typography.medium12.tertiary(context),
            buttonTextStyle: context.typography.medium12
                .primary(context)
                .copyWith(
                  fontWeight: FontWeight.w700,
                  color: facilityDataProvider.activityLineColor,
                ),
            animationDuration: const Duration(milliseconds: 200),
            animationCurve: Curves.easeOutCirc,
          ),
      ],
    );
  }

  String _buildSubtitle() {
    final parts = <String>[];
    if (profile.title != null && profile.title!.isNotEmpty) {
      parts.add(profile.title!);
    }
    if (profile.year != null && profile.year!.isNotEmpty) {
      parts.add(profile.year!);
    }
    return parts.join(' . ');
  }
}
