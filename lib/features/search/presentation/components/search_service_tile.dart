import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/domain.dart';
import 'search_highlighted_text.dart';

/// A service result: thumbnail, service name, and a subtitle crediting the
/// facility that offers it plus the listing type, tinted with the facility's
/// activity line.
class SearchServiceTile extends StatelessWidget {
  const SearchServiceTile({super.key, required this.result, required this.query});

  final SearchServiceEntity result;
  final String query;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s16),
      onTap: result.type == null ? null : () => _openDetails(context, result.type!),
      child: Container(
        padding: EdgeInsets.all(context.spacing.s12),
        decoration: ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
            side: BorderSide(color: context.colors.strokePrimary),
          ),
          shadows: context.shadows.sm,
        ),
        child: Row(
          spacing: context.spacing.s12,
          children: [
            ShimmerImage(
              imageUrl: result.service.imageUrl,
              width: 56,
              height: 56,
              borderRadius: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                spacing: context.spacing.s8,
                children: [
                  SearchHighlightedText(
                    text: result.service.name,
                    query: query,
                    style: context.typography.medium16.primary(context),
                  ),
                  _FacilityCredit(result: result),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDetails(BuildContext context, FacilityServiceType type) {
    context.router.push(
      FacilityServiceDetailsRoute(
        service: result.service,
        type: type,
        facility: result.facility,
      ),
    );
  }
}

/// `<logo> Facility name · Type`, with the type in the activity line's colour.
class _FacilityCredit extends StatelessWidget {
  const _FacilityCredit({required this.result});

  final SearchServiceEntity result;

  @override
  Widget build(BuildContext context) {
    final (activityLineColor, _) = result.facility.activityLine.getColors(context);
    final typeLabel = switch (result.type) {
      FacilityServiceType.activity => context.l10n.search_typeActivity,
      FacilityServiceType.flow => context.l10n.search_typeFlow,
      FacilityServiceType.course => context.l10n.search_typeCourse,
      null => null,
    };

    return Row(
      spacing: context.spacing.s4,
      children: [
        ShimmerImage(
          imageUrl: result.facility.logoUrl,
          width: 20,
          height: 20,
          borderRadius: 100,
          errorWidget: Icon(
            SolarIconsOutline.buildings,
            size: 12,
            color: context.colors.textTertiary,
          ),
        ),
        Flexible(
          child: Text(
            result.facility.name,
            style: context.typography.book13.secondary(context),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ),
        if (typeLabel != null) ...[
          Text('•', style: context.typography.book13.tertiary(context)),
          Text(
            typeLabel,
            style: context.typography.book13.withColor(activityLineColor),
          ),
        ],
      ],
    );
  }
}
