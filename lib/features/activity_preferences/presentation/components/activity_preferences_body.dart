import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/activity_preferences_cubit.dart';
import '../cubit/activity_preferences_state.dart';
import 'preference_line_section.dart';

/// Body of Preferences: a lead-in, a section per activity line, and Save
/// pinned under them (enabled once something changed).
class ActivityPreferencesBody extends StatelessWidget {
  const ActivityPreferencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityPreferencesCubit>();

    return Column(
      children: [
        Expanded(
          child: LogoRefreshIndicator(
            onRefresh: cubit.refresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(context.spacing.s24),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: context.spacing.s24,
                      children: [
                        Text(
                          context.l10n.preferences_subtitle,
                          style: context.typography.book14.tertiary(context),
                        ),
                        AsyncHandler<
                          ActivityPreferencesCubit,
                          ActivityPreferencesState,
                          ActivityPreferencesEntity
                        >(
                          requestManagerGetter: (cubit) => cubit.preferencesManager,
                          skeletonBuilder: (_) => const _Skeleton(),
                          onRetry: (cubit) => cubit.refresh(),
                          onBackgroundError: (context, failure) =>
                              context.showErrorSnackBar(failure.message),
                          successBuilder: (context, preferences) {
                            if (preferences.lines.isEmpty) {
                              return EmptyStateView(
                                icon: SolarIconsOutline.tuning,
                                title: context.l10n.preferences_empty,
                              );
                            }
                            return BlocSelector<
                              ActivityPreferencesCubit,
                              ActivityPreferencesState,
                              Set<int>
                            >(
                              selector: (state) => state.selectedTagIds,
                              builder: (context, selected) => Column(
                                crossAxisAlignment: .stretch,
                                spacing: context.spacing.s32,
                                children: [
                                  for (final line in preferences.lines)
                                    PreferenceLineSection(
                                      line: line,
                                      selectedTagIds: selected,
                                      onToggle: cubit.toggle,
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const _SaveBar(),
      ],
    );
  }
}

class _SaveBar extends StatelessWidget {
  const _SaveBar();

  @override
  Widget build(BuildContext context) {
    final (canSave, needsAPick) = context.select<ActivityPreferencesCubit, (bool, bool)>(
      (cubit) => (cubit.state.canSave, cubit.state.needsAPick),
    );

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: Border(top: BorderSide(color: context.colors.strokePrimary)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.spacing.s24,
          context.spacing.s16,
          context.spacing.s24,
          context.bottomInset + context.spacing.s16,
        ),
        child: Column(
          mainAxisSize: .min,
          spacing: context.spacing.s8,
          children: [
            if (needsAPick)
              Text(
                context.l10n.preferences_pickAtLeastOne,
                textAlign: .center,
                style: context.typography.book13.tertiary(context),
              ),
            AsyncHandler<ActivityPreferencesCubit, ActivityPreferencesState, void>.loadingDependent(
              requestManagerGetter: (cubit) => cubit.saveManager,
              onSuccess: (context, _) =>
                  context.showSuccessSnackBar(context.l10n.preferences_saved),
              onError: (context, failure) => context.showErrorSnackBar(failure.message),
              builder: (context, isSaving) => MainButton(
                text: context.l10n.preferences_save,
                height: 48,
                isLoading: isSaving,
                isDisabled: !canSave,
                onPressed: canSave && !isSaving
                    ? () => context.read<ActivityPreferencesCubit>().save()
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton();

  static const List<List<double>> _chips = [
    [72, 84, 90, 80, 96],
    [64, 90, 80, 56, 110, 84, 72],
    [92, 96],
    [44, 64, 120, 84, 40, 76],
  ];

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: context.spacing.s32,
        children: [for (final widths in _chips) PreferenceLineSectionSkeleton(chipWidths: widths)],
      ),
    );
  }
}
