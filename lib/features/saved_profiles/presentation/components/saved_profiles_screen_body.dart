import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import 'activity_line_filter_bar.dart';
import 'saved_profile_card.dart';
import 'saved_profiles_empty_state.dart';
import 'saved_profiles_skeleton.dart';
import 'swipe_to_unsave.dart';

/// Body of the Profiles screen: the activity-line filter, then the saved cards.
class SavedProfilesScreenBody extends StatelessWidget {
  const SavedProfilesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedProfilesCubit, SavedProfilesState>(
      builder: (context, state) {
        final cubit = context.read<SavedProfilesCubit>();

        return LogoRefreshIndicator(
          onRefresh: cubit.refresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  context.spacing.s16,
                  context.spacing.s24,
                  context.spacing.s16,
                  context.spacing.s24,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: context.spacing.s16,
                    children: [
                      ActivityLineFilterBar(
                        selectedLine: state.selectedLine,
                        onLineSelected: cubit.selectLine,
                      ),
                      AsyncHandler<
                        SavedProfilesCubit,
                        SavedProfilesState,
                        List<SavedProfileEntity>
                      >(
                        requestManagerGetter: (cubit) => cubit.profilesManager,
                        skeletonBuilder: (_) => const SavedProfilesSkeleton(),
                        onRetry: (cubit) => cubit.refresh(),
                        // A failed refresh, unsave or bell keeps the list on
                        // screen (the card or bell put back), so this is the
                        // only thing that says why it didn't take.
                        onBackgroundError: (context, failure) =>
                            context.showErrorSnackBar(failure.message),
                        // The filtered list comes off the state rather than the
                        // request, which always holds everything the user saved.
                        successBuilder: (context, _) => state.visibleProfiles.isEmpty
                            ? SavedProfilesEmptyState(isFiltered: state.isFiltered)
                            : _SavedProfilesList(profiles: state.visibleProfiles),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverBottomInset(),
            ],
          ),
        );
      },
    );
  }
}

class _SavedProfilesList extends StatelessWidget {
  const _SavedProfilesList({required this.profiles});

  final List<SavedProfileEntity> profiles;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SavedProfilesCubit>();

    return Column(
      spacing: context.spacing.s16,
      children: [
        for (final profile in profiles)
          SwipeToUnsave(
            key: cubit.dismissKeyOf(profile),
            dismissKey: cubit.dismissKeyOf(profile),
            onUnsave: () async => cubit.unsave(profile),
            onUnsaved: () {
              // Said at once: the card is already gone, and comes back with an
              // error if the server refuses.
              context.showInfoSnackBar(context.l10n.savedProfiles_unsaved);
              cubit.removeUnsaved(profile);
            },
            child: SavedProfileCard(
              profile: profile,
              onTap: () => _openFacility(context, profile),
              onTrackToggled: () => cubit.toggleTracking(profile),
            ),
          ),
      ],
    );
  }

  /// Opens the facility's profile, then re-reads the list on the way back —
  /// the user may have unsaved it from there.
  Future<void> _openFacility(BuildContext context, SavedProfileEntity profile) async {
    final cubit = context.read<SavedProfilesCubit>();
    await context.router.push<void>(FacilityDetailsRoute(facility: profile.facility));
    await cubit.refresh();
  }
}
