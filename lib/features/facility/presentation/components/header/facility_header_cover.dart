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
      child: ShimmerImage(
        imageUrl: facilityDataProvider.facility.coverUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
