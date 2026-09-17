import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../cubit/activity_line_facilities_cubit.dart';
import '../cubit/activity_line_facilities_state.dart';
import 'activity_line_facilities_list.dart';
import 'activity_line_facilities_tag_list.dart';

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
      child: RefreshIndicator(
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
                initialBuilder: _loading,
                loadingBuilder: _loading,
                errorBuilder: (context, failure) => SliverToBoxAdapter(
                  child: _PageError(failure: failure, onRetry: cubit.refresh),
                ),
                successBuilder: (_, _) => const ActivityLineFacilitiesList(),
              ),
              SliverToBoxAdapter(
                child: AsyncHandler<ActivityLineFacilitiesCubit, ActivityLineFacilitiesState, void>(
                  requestManagerGetter: (cubit) => cubit.facilitiesManager.nextPageManager,
                  loadingBuilder: (context) => Padding(
                    padding: EdgeInsets.all(context.spacing.s24),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  successBuilder: (_, _) => const SizedBox.shrink(),
                  errorBuilder: (_, failure) =>
                      _PageError(failure: failure, onRetry: cubit.loadMore),
                ),
              ),
              const SliverBottomInset(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loading(BuildContext context) => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(context.spacing.s24),
      child: const Center(child: CircularProgressIndicator()),
    ),
  );
}

class _PageError extends StatelessWidget {
  const _PageError({required this.failure, required this.onRetry});
  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(context.spacing.s24),
    child: Column(
      spacing: context.spacing.s12,
      children: [
        Text(failure.message, style: context.typography.book14.secondary(context)),
        MainButton(text: context.l10n.retry, onPressed: onRetry),
      ],
    ),
  );
}
