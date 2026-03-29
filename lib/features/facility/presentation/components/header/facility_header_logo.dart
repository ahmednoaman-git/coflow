import 'package:coflow_users_v2/core/presentation/widgets/shimmer_image.dart';
import 'package:flutter/material.dart';

import '../facility_data_provider.dart';
import 'facility_header.dart';

class FacilityHeaderLogo extends StatelessWidget {
  const FacilityHeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);
    final logoRadius = FacilityHeader.logoImageRadius;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: logoRadius,
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
                    return ClipOval(
                      child: SizedBox(
                        width: logoRadius * 2,
                        height: logoRadius * 2,
                        child: ShimmerImage(
                          imageUrl: facilityDataProvider.facility.logoUrl,
                          width: logoRadius * 2,
                          height: logoRadius * 2,
                          borderRadius: 100,
                        ),
                      ),
                    );
                  },
              child: ClipOval(
                child: SizedBox(
                  width: logoRadius * 2,
                  height: logoRadius * 2,
                  child: ShimmerImage(
                    imageUrl: facilityDataProvider.facility.logoUrl,
                    width: logoRadius * 2,
                    height: logoRadius * 2,
                    borderRadius: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
