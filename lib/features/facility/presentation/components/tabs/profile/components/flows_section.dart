import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../facility_data_provider.dart';
import '../../../page_section.dart';

/// Flows section for facility profile.
///
/// Currently backed by the facility `tags` list.
class FlowsSection extends StatelessWidget {
  const FlowsSection({super.key, required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return const SizedBox.shrink();
    }

    final facilityDataProvider = FacilityDataProvider.of(context);

    return PageSection(
      title: context.l10n.facilityDetails_flowsSectionTitle,
      svgIconPath: Assets.svgs.flows.path,
      children: [
        Align(
          alignment: .centerLeft,
          child: Wrap(
            spacing: context.spacing.s8,
            runSpacing: context.spacing.s8,
            children: [
              for (final tag in tags)
                _TagChip(tag: tag, facilityDataProvider: facilityDataProvider),
            ],
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.tag, required this.facilityDataProvider});

  final String tag;
  final FacilityDataProvider facilityDataProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        color: facilityDataProvider.activityLineBackground,
        shape: const StadiumBorder(),
      ),
      child: Text(
        tag,
        style: context.typography.book10
            .secondary(context)
            .copyWith(
              color: facilityDataProvider.activityLineColor.withValues(alpha: 0.75),
            ),
      ),
    );
  }
}
