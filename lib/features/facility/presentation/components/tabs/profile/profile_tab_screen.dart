import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../facility/domain/entities/entities.dart';
import '../../../../../facility/presentation/cubit/cubit.dart';
import 'components/profile_header.dart';

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
              padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
              child: ProfileHeader(profile: profile),
            ),
            Divider(color: context.colors.strokePrimary),
            // ProfileTeamSection, OperatingHoursSection, etc. would need
            // more data from FacilityProfileEntity - for now show placeholder
            _buildComingSoonSection(context, context.l10n.facilityDetails_teamSectionTitle),
            Divider(color: context.colors.strokePrimary),
            _buildComingSoonSection(
              context,
              context.l10n.facilityDetails_operatingHoursSectionTitle,
            ),
            Divider(color: context.colors.strokePrimary),
            _buildComingSoonSection(context, context.l10n.facilityDetails_locationSectionTitle),
            Divider(color: context.colors.strokePrimary),
            _buildComingSoonSection(context, context.l10n.facilityDetails_branchesSectionTitle),
            Divider(color: context.colors.strokePrimary),
            _buildComingSoonSection(context, context.l10n.facilityDetails_languagesSectionTitle),
            Divider(color: context.colors.strokePrimary),
            _buildComingSoonSection(context, context.l10n.facilityDetails_amenitiesSectionTitle),
            Divider(color: context.colors.strokePrimary),
            _buildComingSoonSection(context, context.l10n.facilityDetails_actionsSectionTitle),
          ],
        );
      },
      onRetry: (cubit) => cubit.refreshProfile(),
    );
  }

  Widget _buildComingSoonSection(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: Row(
        children: [
          Text(title, style: context.typography.medium14.primary(context)),
          const Spacer(),
          Text(
            context.l10n.facilityDetails_comingSoon,
            style: context.typography.book12.tertiary(context),
          ),
        ],
      ),
    );
  }
}
