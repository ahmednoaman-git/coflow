import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../page_section.dart';

/// Team section for facility profile.
class ProfileTeamSection extends StatelessWidget {
  const ProfileTeamSection({super.key, required this.teamMembers});

  final List<TeamMemberEntity> teamMembers;

  @override
  Widget build(BuildContext context) {
    if (teamMembers.isEmpty) {
      return const SizedBox.shrink();
    }

    return PageSection(
      title: context.l10n.facilityDetails_teamSectionTitle,
      svgIconPath: Assets.svgs.team.path,
      children: [
        GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: context.spacing.s16,
          crossAxisSpacing: context.spacing.s16,
          children: [
            for (final teamMember in teamMembers)
              Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ShimmerImage(
                        imageUrl: teamMember.imageUrl,
                        borderRadius: context.spacing.s16,
                      ),
                    ),
                  ),
                  SizedBox(height: context.spacing.s4),
                  Text(
                    teamMember.name,
                    style: context.typography.medium14.brand(context),
                    textAlign: .center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    teamMember.title,
                    style: context.typography.medium12.tertiary(context),
                    textAlign: .center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
