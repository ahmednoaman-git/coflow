import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';

/// Horizontal scrollable list of tags for filtering facilities.
class ActivityLineFacilitiesTagList extends StatelessWidget {
  const ActivityLineFacilitiesTagList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState>(
      buildWhen: (previous, current) =>
          previous.tags != current.tags ||
          previous.selectedTagIds != current.selectedTagIds ||
          previous.facilities.length != current.facilities.length,
      builder: (context, state) {
        if (state.tags.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        return SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
            child: Row(
              children: [
                // "All" tag
                _TagChip(
                  tag: TagWithCountEntity(
                    id: 0,
                    name: context.l10n.all,
                    count: state.facilities.length,
                  ),
                  isSelected: state.selectedTagIds.isEmpty,
                  onTap: () => context.read<ActivityLineFacilitiesCubit>().clearSelectedTags(),
                ),
                // Dynamic tags
                for (final tag in state.tags) ...[
                  SizedBox(width: context.spacing.s8),
                  _TagChip(
                    tag: tag,
                    isSelected: state.selectedTagIds.contains(tag.id),
                    onTap: () =>
                        context.read<ActivityLineFacilitiesCubit>().handleTagSelection(tag.id),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.tag,
    required this.isSelected,
    required this.onTap,
  });

  final TagWithCountEntity tag;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityLineFacilitiesCubit>();
    final (primaryColor, secondaryColor) = cubit.state.activityLine.getColors(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastEaseInToSlowEaseOut,
      constraints: const BoxConstraints(minWidth: 100),
      decoration: ShapeDecoration(
        color: isSelected ? primaryColor : secondaryColor,
        shape: const StadiumBorder(),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s12,
            vertical: context.spacing.s8,
          ),
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastEaseInToSlowEaseOut,
              style: context.typography.medium14.copyWith(
                color: isSelected ? context.colors.textWhite : primaryColor,
              ),
              child: Text('${tag.name} (${tag.count})'),
            ),
          ),
        ),
      ),
    );
  }
}
