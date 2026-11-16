import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';

class ActivityLineFacilitiesTagList extends StatelessWidget {
  const ActivityLineFacilitiesTagList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState>(
        buildWhen: (previous, current) =>
            previous.tags != current.tags ||
            previous.selectedTagId != current.selectedTagId ||
            previous.allFacilitiesTotal != current.allFacilitiesTotal ||
            _awaitingTags(previous) != _awaitingTags(current),
        builder: (context, state) {
          final cubit = context.read<ActivityLineFacilitiesCubit>();
          return SliverToBoxAdapter(
            child: SkeletonSwitcher(
              loading: _awaitingTags(state),
              skeleton: const _TagRowSkeleton(),
              child: state.tags.isEmpty
                  ? const SizedBox.shrink()
                  : _TagRow(
                      children: [
                        _TagChip(
                          name: context.l10n.all,
                          count: state.allFacilitiesTotal,
                          isSelected: state.selectedTagId == null,
                          onTap: cubit.clearSelectedTags,
                        ),
                        for (final tag in state.tags)
                          _TagChip(
                            name: tag.name,
                            count: tag.count,
                            isSelected: state.selectedTagId == tag.id,
                            onTap: () => cubit.handleTagSelection(tag.id),
                          ),
                      ],
                    ),
            ),
          );
        },
      );

  /// The tags come with the first page; until it lands there's a row to hold.
  static bool _awaitingTags(ActivityLineFacilitiesState state) =>
      state.tags.isEmpty &&
      switch (state.facilitiesRequest) {
        AsyncIdle() || AsyncLoading() => true,
        _ => false,
      };
}

/// The scrolling row the chips — or their skeletons — sit in.
class _TagRow extends StatelessWidget {
  const _TagRow({required this.children, this.scrollable = true});

  final List<Widget> children;
  final bool scrollable;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: scrollable ? null : const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
    child: Row(spacing: context.spacing.s8, children: children),
  );
}

/// Chip skeletons the size of [_TagChip]s, with "All" first.
class _TagRowSkeleton extends StatelessWidget {
  const _TagRowSkeleton();

  static const List<double> _labelWidths = [44, 96, 112, 84, 72];

  @override
  Widget build(BuildContext context) => Skeleton(
    child: _TagRow(
      scrollable: false,
      children: [
        for (final width in _labelWidths)
          SkeletonChip(
            style: context.typography.medium14,
            labelWidth: width,
            padding: _TagChip.padding(context),
          ),
      ],
    ),
  );
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.name,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  /// Around the label; shared with [_TagRowSkeleton].
  static EdgeInsets padding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: context.spacing.s16, vertical: context.spacing.s8);

  final String name;
  final int? count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final (primary, secondary) = context
        .read<ActivityLineFacilitiesCubit>()
        .state
        .activityLine
        .getColors(context);
    final radius = BorderRadius.circular(context.spacing.s24);
    return TappableScale(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        decoration: ShapeDecoration(
          color: isSelected ? primary : secondary,
          shape: RoundedSuperellipseBorder(borderRadius: radius),
        ),
        padding: padding(context),
        child: Text(
          count == null ? name : '$name ($count)',
          style: context.typography.medium14.withColor(
            isSelected ? context.colors.textWhite : primary,
          ),
        ),
      ),
    );
  }
}
