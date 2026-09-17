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
            previous.allFacilitiesTotal != current.allFacilitiesTotal,
        builder: (context, state) {
          if (state.tags.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
          final cubit = context.read<ActivityLineFacilitiesCubit>();
          return SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
              child: Row(
                spacing: context.spacing.s8,
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
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.name,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });
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
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s16,
          vertical: context.spacing.s8,
        ),
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
