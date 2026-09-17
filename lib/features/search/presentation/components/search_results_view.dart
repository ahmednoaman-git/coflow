import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/domain.dart';
import '../cubit/cubit.dart';
import 'search_business_tile.dart';
import 'search_instructor_tile.dart';
import 'search_message_view.dart';
import 'search_results_list.dart';
import 'search_results_shimmer.dart';
import 'search_service_tile.dart';

/// The results area: the list belonging to the selected tab, or the idle
/// prompt while the query is still too short.
class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          previous.selectedType != current.selectedType || previous.query != current.query,
      builder: (context, state) {
        return MainAnimatedSwitcher.scaleFade(
          child: KeyedSubtree(
            key: ValueKey(state.selectedType),
            child: switch (state.selectedType) {
              SearchType.business => const _BusinessResults(),
              SearchType.instructor => const _InstructorResults(),
              SearchType.service => const _ServiceResults(),
            },
          ),
        );
      },
    );
  }
}

/// Shown for a request that has never run — which, on this screen, means the
/// query is still under the backend's minimum length.
class _IdleView extends StatelessWidget {
  const _IdleView();

  @override
  Widget build(BuildContext context) {
    return SearchMessageView(
      icon: SolarIconsOutline.magnifier,
      message: context.l10n.search_minCharacters(SearchConstants.minQueryLength),
    );
  }
}

class _BusinessResults extends StatelessWidget {
  const _BusinessResults();

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<SearchCubit, SearchState, PaginatedEntity<CollapsedFacilityEntity>>(
      requestManagerGetter: (cubit) => cubit.businessesManager,
      initialBuilder: (context) => const _IdleView(),
      loadingBuilder: (context) => const SearchResultsShimmer(),
      onRetry: (cubit) => cubit.search(),
      successBuilder: (context, page) => SearchResultsList(
        page: page,
        onLoadMore: context.read<SearchCubit>().loadMore,
        itemBuilder: (context, facility) => SearchBusinessTile(
          facility: facility,
          query: context.read<SearchCubit>().state.query,
        ),
      ),
    );
  }
}

class _InstructorResults extends StatelessWidget {
  const _InstructorResults();

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<SearchCubit, SearchState, PaginatedEntity<SearchInstructorEntity>>(
      requestManagerGetter: (cubit) => cubit.instructorsManager,
      initialBuilder: (context) => const _IdleView(),
      loadingBuilder: (context) => const SearchResultsShimmer(),
      onRetry: (cubit) => cubit.search(),
      successBuilder: (context, page) => SearchResultsList(
        page: page,
        onLoadMore: context.read<SearchCubit>().loadMore,
        itemBuilder: (context, instructor) => SearchInstructorTile(
          instructor: instructor,
          query: context.read<SearchCubit>().state.query,
        ),
      ),
    );
  }
}

class _ServiceResults extends StatelessWidget {
  const _ServiceResults();

  @override
  Widget build(BuildContext context) {
    return AsyncHandler<SearchCubit, SearchState, PaginatedEntity<SearchServiceEntity>>(
      requestManagerGetter: (cubit) => cubit.servicesManager,
      initialBuilder: (context) => const _IdleView(),
      loadingBuilder: (context) => const SearchResultsShimmer(),
      onRetry: (cubit) => cubit.search(),
      successBuilder: (context, page) => SearchResultsList(
        page: page,
        onLoadMore: context.read<SearchCubit>().loadMore,
        itemBuilder: (context, result) => SearchServiceTile(
          result: result,
          query: context.read<SearchCubit>().state.query,
        ),
      ),
    );
  }
}
