import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../facility_data_provider.dart';
import 'facility_data_pinned_header.dart';
import 'facility_header_cover.dart';
import 'facility_header_logo.dart';
import 'facility_header_top_gradient.dart';

class FacilityHeader extends StatelessWidget {
  const FacilityHeader({super.key});

  static const double logoImageRadius = 46;
  static const double containerBorderRadius = 20;
  static const double coverImageHeight = 500;

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);
    final topPadding = MediaQuery.paddingOf(context).top;
    final logoSectionPosition = topPadding + coverImageHeight - containerBorderRadius;
    final pinnedHeaderPosition = logoSectionPosition + logoImageRadius;

    return SliverStack(
      children: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: coverImageHeight,
          flexibleSpace: const FacilityHeaderCover(),
          backgroundColor: facilityDataProvider.activityLineColor,
          elevation: 0,
        ),
        const SliverPositioned(
          top: 0,
          left: 0,
          right: 0,
          child: FacilityHeaderTopGradient(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: pinnedHeaderPosition),
          sliver: FacilityDataPinnedHeader(position: pinnedHeaderPosition),
        ),
        SliverPositioned(
          top: logoSectionPosition,
          left: 0,
          right: 0,
          child: const FacilityHeaderLogo(),
        ),
      ],
    );
  }
}
