import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../facility_data_provider.dart';

class FacilityHeaderCover extends StatelessWidget {
  const FacilityHeaderCover({super.key});

  @override
  Widget build(BuildContext context) {
    final facilityDataProvider = FacilityDataProvider.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      // Fills the app bar's whole height, cropping as needed: left to its own
      // size, the image keeps its aspect ratio, and a landscape cover stops
      // short of the logo with the activity line's colour showing below it.
      child: SizedBox.expand(
        child: ShimmerImage(
          imageUrl: facilityDataProvider.facility.coverUrl,
          fit: BoxFit.cover,
          fallback: ImageFallback.cover(accent: facilityDataProvider.activityLineColor),
        ),
      ),
    );
  }
}
