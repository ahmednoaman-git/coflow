import 'package:flutter/material.dart';

import '../../../../../facility/presentation/components/facility_data_provider.dart';
import 'facility_tab_controller.dart';
import 'facility_utils.dart';

class FacilitySelectedTab extends StatelessWidget {
  const FacilitySelectedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final facility = FacilityDataProvider.of(context).facility;

    final tabWidgets = FacilityUtils.getFacilityTabWidgets(facility);

    final selectedTab = FacilityTabController.of(context).selectedTab;

    return tabWidgets[selectedTab].sliver;
  }
}

/// Extension to convert a widget to a sliver.
extension on Widget {
  Widget get sliver => SliverToBoxAdapter(child: this);
}
