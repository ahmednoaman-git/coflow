import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/support_requests_cubit.dart';
import '../cubit/support_requests_state.dart';
import 'create_support_request_dialog.dart';
import 'support_request_card.dart';
import 'support_request_sheet.dart';

/// Body of Support Requests: the requests, newest first, loading further pages
/// near the end, then the "Support Request" button under them (as in the
/// design).
class SupportRequestsBody extends StatefulWidget {
  const SupportRequestsBody({super.key});

  @override
  State<SupportRequestsBody> createState() => _SupportRequestsBodyState();
}

class _SupportRequestsBodyState extends State<SupportRequestsBody> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_loadMoreIfNeeded);
  }

  void _loadMoreIfNeeded() {
    if (!mounted || !_scroll.hasClients || _scroll.position.extentAfter > 320) return;
    final cubit = context.read<SupportRequestsCubit>();
    if (cubit.requestsManager.hasNextPage && !cubit.state.nextPageRequest.isError) {
      cubit.loadMore();
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupportRequestsCubit>();
    final padding = EdgeInsets.symmetric(horizontal: context.spacing.s24);

    return LogoRefreshIndicator(
      onRefresh: cubit.refresh,
      child: CustomScrollView(
        controller: _scroll,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: context.spacing.s24)),
          SliverPadding(
            padding: padding,
            sliver: SliverToBoxAdapter(
              child:
                  AsyncHandler<
                    SupportRequestsCubit,
                    SupportRequestsState,
                    PaginatedEntity<SupportRequestEntity>
                  >(
                    requestManagerGetter: (cubit) => cubit.requestsManager.firstPageManager,
                    skeletonBuilder: (_) => const SupportRequestCardSkeletons(),
                    errorBuilder: (context, failure) =>
                        InlineAsyncError(failure: failure, onRetry: cubit.refresh),
                    successBuilder: (context, page) {
                      if (page.isEmpty) {
                        return EmptyStateView(
                          icon: SolarIconsOutline.chatRoundDots,
                          title: context.l10n.support_empty,
                          hint: context.l10n.support_emptyHint,
                        );
                      }
                      return Column(
                        spacing: context.spacing.s16,
                        children: [
                          for (final request in page.items)
                            SupportRequestCard(
                              request: request,
                              onTap: () => SupportRequestSheet.show(context, request),
                            ),
                        ],
                      );
                    },
                  ),
            ),
          ),
          SliverPadding(
            padding: padding,
            sliver: SliverToBoxAdapter(
              child: AsyncHandler<SupportRequestsCubit, SupportRequestsState, void>(
                requestManagerGetter: (cubit) => cubit.requestsManager.nextPageManager,
                loadingBuilder: (_) => Padding(
                  padding: EdgeInsets.only(top: context.spacing.s16),
                  child: const SupportRequestCardSkeletons(count: 2),
                ),
                successBuilder: (_, _) => const SizedBox.shrink(),
                errorBuilder: (_, failure) =>
                    InlineAsyncError(failure: failure, onRetry: cubit.loadMore),
              ),
            ),
          ),
          SliverPadding(
            padding: padding.copyWith(top: context.spacing.s24, bottom: context.spacing.s24),
            sliver: SliverToBoxAdapter(
              child: MainButton(
                text: context.l10n.support_newRequest,
                leadingIcon: SolarIconsOutline.addCircle,
                height: 48,
                onPressed: () => CreateSupportRequestDialog.show(context),
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}
