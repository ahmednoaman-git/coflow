import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/facility_tickets.dart';

class PricingTabScreen extends StatelessWidget {
  const PricingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: Column(
        spacing: context.spacing.s16,
        children: [
          _PricingTabSelector(
            selectedTab: context.select<FacilityDetailsCubit, FacilityPricingTab>(
              (cubit) => cubit.state.selectedPricingTab,
            ),
            onTabSelected: (tab) {
              context.read<FacilityDetailsCubit>().setSelectedPricingTab(tab);
            },
          ),
          Builder(
            builder: (context) {
              final selectedTab = context.select<FacilityDetailsCubit, FacilityPricingTab>(
                (cubit) => cubit.state.selectedPricingTab,
              );

              return switch (selectedTab) {
                FacilityPricingTab.tickets => const FacilityTickets(),
                FacilityPricingTab.promotions => _buildPromotionsPlaceholder(context),
              };
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionsPlaceholder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s32),
      child: Text(
        context.l10n.facilityDetails_comingSoon,
        style: context.typography.medium14.tertiary(context),
        textAlign: .center,
      ),
    );
  }
}

class _PricingTabSelector extends StatelessWidget {
  const _PricingTabSelector({
    required this.selectedTab,
    required this.onTabSelected,
  });

  final FacilityPricingTab selectedTab;
  final void Function(FacilityPricingTab) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CupertinoSlidingSegmentedControl<FacilityPricingTab>(
      groupValue: selectedTab,
      children: {
        FacilityPricingTab.tickets: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
          child: Text(l10n.facilityDetails_tickets.toUpperCase()),
        ),
        FacilityPricingTab.promotions: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
          child: Text(l10n.facilityDetails_promotions.toUpperCase()),
        ),
      },
      onValueChanged: (value) {
        if (value != null) {
          onTabSelected(value);
        }
      },
    );
  }
}
