import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../facility_data_provider.dart';
import '../tabs/tab_controls/facility_tab_bar.dart';
import 'facility_header_controls.dart';

class FacilityDataPinnedHeader extends StatelessWidget {
  const FacilityDataPinnedHeader({super.key, required this.position});

  final double position;

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      child: Column(
        children: [
          AnimatedSafeAreaHeaderAppBar(position: position),
          const FacilityTabBar(),
        ],
      ),
    );
  }
}

class AnimatedSafeAreaHeaderAppBar extends StatelessWidget {
  const AnimatedSafeAreaHeaderAppBar({super.key, required this.position});

  final double position;

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);
    final topPadding = MediaQuery.paddingOf(context).top;
    final double safeAreaCalculationStartOffset = position - topPadding;
    final double safeAreaCalculationEndOffset = position;

    return AnimatedBuilder(
      animation: facilityDataProvider.scrollController,
      builder: (context, child) {
        final clampedOffset = facilityDataProvider.scrollController.offset.clamp(
          safeAreaCalculationStartOffset,
          safeAreaCalculationEndOffset,
        );

        final safeAreaScaleProgress =
            (clampedOffset - safeAreaCalculationStartOffset) /
            (safeAreaCalculationEndOffset - safeAreaCalculationStartOffset);

        return HeaderAppBar(safeAreaScaleProgress: safeAreaScaleProgress);
      },
    );
  }
}

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key, required this.safeAreaScaleProgress});

  final double safeAreaScaleProgress;

  static const double containerContentHeight = 90;

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);
    final topPadding = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: containerContentHeight + topPadding * safeAreaScaleProgress,
        color: facilityDataProvider.activityLineColor,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: containerContentHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: safeAreaScaleProgress > 0
                    ? FacilityHeaderControls.controlEdgeInsets
                    : 0,
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    facilityDataProvider.facility.name,
                    style: context.typography.bold20.inverse(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.spacing.s4),
                  Text(
                    facilityDataProvider.facility.description,
                    style: context.typography.book14.inverse(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
