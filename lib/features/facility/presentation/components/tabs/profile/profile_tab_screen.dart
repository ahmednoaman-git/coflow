import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../facility/domain/entities/entities.dart';
import '../../../../../facility/presentation/cubit/cubit.dart';
import 'components/actions_section.dart';
import 'components/amenities_section.dart';
import 'components/branches_section.dart';
import 'components/flows_section.dart';
import 'components/languages_section.dart';
import 'components/location_section.dart';
import 'components/operating_hours_section.dart';
import 'components/profile_header.dart';
import 'components/profile_team_section.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<FacilityDetailsCubit, FacilityDetailsState, FacilityProfileEntity>(
      requestManagerGetter: (cubit) => cubit.profileManager,
      successBuilder: (context, profile) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.s24,
                vertical: context.spacing.s32,
              ),
              child: ProfileHeader(profile: profile),
            ),
            _buildDivider(context),
            ProfileTeamSection(teamMembers: profile.teamMembers),
            if (profile.teamMembers.isNotEmpty) _buildDivider(context),
            OperatingHoursSection(operations: profile.operatingHours),
            if (profile.operatingHours.isNotEmpty) _buildDivider(context),
            LocationSection(location: profile.location),
            if (profile.location != null) _buildDivider(context),
            BranchesSection(branches: profile.branches),
            if (profile.branches.isNotEmpty) _buildDivider(context),
            LanguagesSection(languages: profile.languages),
            if (profile.languages.isNotEmpty) _buildDivider(context),
            FlowsSection(tags: profile.tags),
            if (profile.tags.isNotEmpty) _buildDivider(context),
            AmenitiesSection(amenities: profile.amenities),
            if (profile.amenities.isNotEmpty) _buildDivider(context),
            ActionsSection(contacts: profile.reservationContacts),
          ],
        );
      },
      onRetry: (cubit) => cubit.refreshProfile(),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      color: context.colors.strokePrimary,
      height: 1,
      thickness: 1,
    );
  }
}
