import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../page_section.dart';

/// Amenities section for facility profile.
class AmenitiesSection extends StatelessWidget {
  const AmenitiesSection({super.key, required this.amenities});

  final List<AmenityEntity> amenities;

  @override
  Widget build(BuildContext context) {
    if (amenities.isEmpty) {
      return const SizedBox.shrink();
    }

    return PageSection(
      title: context.l10n.facilityDetails_amenitiesSectionTitle,
      svgIconPath: Assets.svgs.amenities.path,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: context.spacing.s16,
            children: [
              for (final amenity in amenities) _buildAmenity(context, amenity: amenity),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAmenity(BuildContext context, {required AmenityEntity amenity}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Column(
        children: [
          ShimmerImage(
            imageUrl: amenity.iconUrl,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
          Text(
            amenity.name,
            style: context.typography.medium12.tertiary(context),
          ),
        ],
      ),
    );
  }
}
