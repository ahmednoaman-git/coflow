import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import 'search_highlighted_text.dart';

/// A business result: round logo, name and tagline. Opens the facility.
class SearchBusinessTile extends StatelessWidget {
  const SearchBusinessTile({super.key, required this.facility, required this.query});

  final CollapsedFacilityEntity facility;
  final String query;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s12),
      onTap: () => context.router.push(FacilityDetailsRoute(facility: facility)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s8,
          vertical: context.spacing.s8,
        ),
        child: Row(
          spacing: context.spacing.s12,
          children: [
            ShimmerImage(
              imageUrl: facility.logoUrl,
              width: 48,
              height: 48,
              borderRadius: 100,
              errorWidget: Icon(
                SolarIconsOutline.buildings,
                color: context.colors.textTertiary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                spacing: context.spacing.s4,
                children: [
                  SearchHighlightedText(
                    text: facility.name,
                    query: query,
                    style: context.typography.medium16.primary(context),
                  ),
                  Text(
                    facility.description,
                    style: context.typography.book14.tertiary(context),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
