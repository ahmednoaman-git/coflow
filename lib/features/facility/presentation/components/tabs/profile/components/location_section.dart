import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../page_section.dart';

/// Location section for facility profile.
class LocationSection extends StatelessWidget {
  const LocationSection({super.key, required this.location});

  final LocationEntity? location;

  @override
  Widget build(BuildContext context) {
    if (location == null) {
      return const SizedBox.shrink();
    }

    final parts = <String>[
      if (location!.address != null && location!.address!.isNotEmpty) location!.address!,
      if (location!.cityName != null && location!.cityName!.isNotEmpty) location!.cityName!,
      if (location!.areaName != null && location!.areaName!.isNotEmpty) location!.areaName!,
    ];

    if (parts.isEmpty) {
      return const SizedBox.shrink();
    }

    return PageSection(
      title: context.l10n.facilityDetails_locationSectionTitle,
      svgIconPath: Assets.svgs.location.path,
      children: [
        Text(
          parts.join(', '),
          style: context.typography.medium12.secondary(context),
        ),
      ],
    );
  }
}
