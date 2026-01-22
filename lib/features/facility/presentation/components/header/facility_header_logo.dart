import 'package:flutter/material.dart';

import '../facility_data_provider.dart';
import 'facility_header.dart';

class FacilityHeaderLogo extends StatelessWidget {
  const FacilityHeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: FacilityHeader.logoImageRadius,
          decoration: BoxDecoration(
            color: facilityDataProvider.activityLineColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(FacilityHeader.containerBorderRadius),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Hero(
              tag: facilityDataProvider.facility.id,
              flightShuttleBuilder:
                  (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    return CircleAvatar(
                      radius: FacilityHeader.logoImageRadius,
                      backgroundImage: facilityDataProvider.logoImageProvider,
                    );
                  },
              child: CircleAvatar(
                radius: FacilityHeader.logoImageRadius,
                backgroundImage: facilityDataProvider.logoImageProvider,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
