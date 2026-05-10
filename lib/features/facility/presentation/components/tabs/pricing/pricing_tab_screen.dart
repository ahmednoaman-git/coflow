import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/pricing/components/pricing_tab_selector.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/facility_promotions.dart';
import 'components/facility_tickets.dart';

class PricingTabScreen extends StatefulWidget {
  const PricingTabScreen({super.key});

  @override
  State<PricingTabScreen> createState() => _PricingTabScreenState();
}

class _PricingTabScreenState extends State<PricingTabScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<FacilityDetailsCubit>();

    switch (cubit.state.selectedPricingTab) {
      case FacilityPricingTab.tickets:
        cubit.ensureTicketsLoaded();
      case FacilityPricingTab.promotions:
        cubit.ensurePromotionsLoaded();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: Column(
        spacing: context.spacing.s16,
        children: [
          PricingTabSelector(
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
                FacilityPricingTab.promotions => const FacilityPromotions(),
              };
            },
          ),
        ],
      ),
    );
  }
}
