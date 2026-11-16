import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../cubit/cubit.dart';
import 'purchase_facility_section.dart';
import 'user_purchase_sheet.dart';
import 'user_purchases_empty_state.dart';
import 'user_purchases_skeleton.dart';

/// Body of Purchases / Gifts: the Current / History switch, then the tab's
/// facilities, each with its cards.
class UserPurchasesScreenBody extends StatelessWidget {
  const UserPurchasesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserPurchasesCubit>();
    final period = context.select((UserPurchasesCubit cubit) => cubit.state.period);
    final spacing = context.spacing;

    return LogoRefreshIndicator(
      onRefresh: cubit.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(spacing.s16, spacing.s24, spacing.s16, spacing.s24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: spacing.s24,
                children: [
                  _PeriodSelector(period: period, onSelected: cubit.selectPeriod),
                  // Keyed by tab so each keeps its own fade-in and skeleton.
                  KeyedSubtree(
                    key: ValueKey(period),
                    child:
                        AsyncHandler<
                          UserPurchasesCubit,
                          UserPurchasesState,
                          List<UserPurchaseEntity>
                        >(
                          requestManagerGetter: (cubit) => cubit.managerFor(period),
                          skeletonBuilder: (_) => const UserPurchasesSkeleton(),
                          errorBuilder: (context, failure) => InlineAsyncError(
                            failure: failure,
                            onRetry: () => cubit.managerFor(period).refresh(),
                          ),
                          onBackgroundError: (context, failure) =>
                              context.showErrorSnackBar(failure.message),
                          successBuilder: (context, purchases) => purchases.isEmpty
                              ? UserPurchasesEmptyState(category: cubit.category, period: period)
                              : _GroupedList(
                                  groups: PurchaseGrouping.byFacility(purchases),
                                  category: cubit.category,
                                  period: period,
                                ),
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}

class _PeriodSelector extends StatelessWidget {
  const _PeriodSelector({required this.period, required this.onSelected});

  final UserPurchasePeriod period;
  final ValueChanged<UserPurchasePeriod> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return EzSlidingSelector<UserPurchasePeriod>(
      segments: [
        EzSlidingSegment(
          value: UserPurchasePeriod.current,
          label: l10n.myPurchases_current.toUpperCase(),
        ),
        EzSlidingSegment(
          value: UserPurchasePeriod.history,
          label: l10n.myPurchases_history.toUpperCase(),
        ),
      ],
      selectedValue: period,
      onValueChanged: onSelected,
      trackColor: context.colors.backgroundGreyTwo,
      thumbColor: context.colors.backgroundWhite,
      selectedTextStyle: context.typography.bold14.primary(context),
      unselectedTextStyle: context.typography.medium14.tertiary(context),
    );
  }
}

class _GroupedList extends StatelessWidget {
  const _GroupedList({required this.groups, required this.category, required this.period});

  final List<PurchaseFacilityGroupEntity> groups;
  final UserPurchaseCategory category;
  final UserPurchasePeriod period;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: context.spacing.s32,
      children: [
        for (final group in groups)
          PurchaseFacilitySection(
            key: ValueKey(group.facilityId),
            group: group,
            category: category,
            period: period,
            onOpen: (purchase, ticket) => _open(context, purchase, ticket),
          ),
      ],
    );
  }

  Future<void> _open(
    BuildContext context,
    UserPurchaseEntity purchase,
    PurchasedTicketEntity? ticket,
  ) async {
    final cubit = context.read<UserPurchasesCubit>();
    final cancelled = await showUserPurchaseSheet(
      context,
      purchase: purchase,
      ticket: ticket,
      category: category,
      period: period,
    );
    if ((cancelled ?? false) && !cubit.isClosed) await cubit.refreshAll();
  }
}
