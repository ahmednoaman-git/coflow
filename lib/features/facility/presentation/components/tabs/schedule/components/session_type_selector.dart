import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/enums/enums.dart';

/// Activities/Courses switch shown when a facility schedules more than one
/// listing type (Pro accounts).
class SessionTypeSelector extends StatelessWidget {
  const SessionTypeSelector({
    super.key,
    required this.types,
    required this.selectedType,
    required this.onTypeSelected,
  });

  final List<FacilityServiceType> types;
  final FacilityServiceType selectedType;
  final ValueChanged<FacilityServiceType> onTypeSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return EzSlidingSelector<FacilityServiceType>(
      segments: [
        for (final type in types)
          EzSlidingSegment(
            value: type,
            label: switch (type) {
              FacilityServiceType.flow => l10n.facilityDetails_flowsTab,
              FacilityServiceType.activity => l10n.facilityDetails_activitiesTab,
              FacilityServiceType.course => l10n.facilityDetails_coursesTab,
            }.toUpperCase(),
          ),
      ],
      selectedValue: selectedType,
      onValueChanged: onTypeSelected,
      trackColor: context.colors.backgroundGreyTwo,
      thumbColor: context.colors.backgroundWhite,
      selectedTextStyle: context.typography.bold14.primary(context),
      unselectedTextStyle: context.typography.medium14.tertiary(context),
    );
  }
}
