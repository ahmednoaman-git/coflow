import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';
import 'activity_line_facilities_list.dart';
import 'activity_line_facilities_tag_list.dart';
import 'facility_card.dart';

class ActivityLineFacilitiesBody extends StatefulWidget {
  const ActivityLineFacilitiesBody({super.key});

  @override
  State<ActivityLineFacilitiesBody> createState() => _ActivityLineFacilitiesBodyState();
}

class _ActivityLineFacilitiesBodyState extends State<ActivityLineFacilitiesBody> {
  final _scroll = ScrollController();
  bool _checkScheduled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_loadMoreIfNeeded);
  }

  void _loadMoreIfNeeded() {
    if (!mounted || !_scroll.hasClients || _scroll.position.extentAfter > 320) return;
    final cubit = context.read<ActivityLineFacilitiesCubit>();
    if (cubit.facilitiesManager.hasNextPage && !cubit.state.nextPageRequest.isError) {
      cubit.loadMore();
    }
  }

  void _checkAfterLayout() {
    if (_checkScheduled) return;
    _checkScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkScheduled = false;
      _loadMoreIfNeeded();
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivityLineFacilitiesCubit>();
    return BlocListener<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState>(
      listenWhen: (previous, current) =>
          previous.selectedTagId != current.selectedTagId ||
          previous.selectedLocation != current.selectedLocation,
      listener: (_, _) {
        if (_scroll.hasClients) _scroll.jumpTo(0);
      },
      child: LogoRefreshIndicator(
        onRefresh: cubit.refresh,
        child: NotificationListener<ScrollMetricsNotification>(
          onNotification: (notification) {
            if (notification.depth == 0) _checkAfterLayout();
            return false;
          },
          child: CustomScrollView(
            controller: _scroll,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: context.spacing.s12)),
              const ActivityLineFacilitiesTagList(),
              AsyncHandler<
                ActivityLineFacilitiesCubit,
                ActivityLineFacilitiesState,
                ActivityLineFacilitiesEntity
              >(
                requestManagerGetter: (cubit) => cubit.facilitiesManager.firstPageManager,
                sliver: true,
                skeletonBuilder: (context) => SliverPadding(
                  padding: ActivityLineFacilitiesList.padding(context),
                  sliver: const SliverToBoxAdapter(
                    child: _FacilityCardSkeletons(count: _firstPageSkeletons),
                  ),
                ),
                errorBuilder: (context, failure) => SliverToBoxAdapter(
                  child: InlineAsyncError(failure: failure, onRetry: cubit.refresh),
                ),
                successBuilder: (_, _) => const ActivityLineFacilitiesList(),
              ),
              SliverToBoxAdapter(
                child: AsyncHandler<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState, void>(
                  requestManagerGetter: (cubit) => cubit.facilitiesManager.nextPageManager,
                  // The next cards' skeletons, carrying on the list's rhythm
                  // right under its last card.
                  loadingBuilder: (context) => Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: context.spacing.s16,
                      end: context.spacing.s16,
                      bottom: context.spacing.s16,
                    ),
                    child: const _FacilityCardSkeletons(count: _nextPageSkeletons),
                  ),
                  successBuilder: (_, _) => const SizedBox.shrink(),
                  errorBuilder: (_, failure) =>
                      InlineAsyncError(failure: failure, onRetry: cubit.loadMore),
                ),
              ),
              const SliverBottomInset(),
            ],
          ),
        ),
      ),
    );
  }

  /// Enough to fill the screen under the tags.
  static const _firstPageSkeletons = 5;
  static const _nextPageSkeletons = 2;
}

/// [count] facility card skeletons, spaced like the list, sweeping together.
class _FacilityCardSkeletons extends StatelessWidget {
  const _FacilityCardSkeletons({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) => Skeleton(
    child: Column(
      spacing: ActivityLineFacilitiesList.gap(context),
      children: [for (var index = 0; index < count; index++) const FacilityCardSkeleton()],
    ),
  );
}
