import 'package:flutter/material.dart';

import 'header/facility_header.dart';
import 'header/facility_header_controls.dart';
import 'tabs/tab_controls/facility_selected_tab.dart';
import 'tabs/tab_controls/facility_tab_controller.dart';

class FacilityScreenBody extends StatefulWidget {
  const FacilityScreenBody({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  State<FacilityScreenBody> createState() => _FacilityScreenBodyState();
}

class _FacilityScreenBodyState extends State<FacilityScreenBody> {
  int _tabIndex = 0;

  void _setTabIndex(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FacilityTabController(
          selectedTab: _tabIndex,
          setSelectedTab: _setTabIndex,
          child: CustomScrollView(
            controller: widget._scrollController,
            slivers: const [
              FacilityHeader(),
              FacilitySelectedTab(),
              SliverFillRemaining(),
            ],
          ),
        ),
        const FacilityHeaderControls(),
      ],
    );
  }
}
