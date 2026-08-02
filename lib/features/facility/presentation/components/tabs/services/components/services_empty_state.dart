import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/enums/enums.dart';

class ServicesEmptyState extends StatelessWidget {
  const ServicesEmptyState({super.key, required this.type});

  final FacilityServiceType type;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = switch (type) {
      FacilityServiceType.activity => l10n.facilityDetails_noActivities,
      FacilityServiceType.flow => l10n.facilityDetails_noFlows,
      FacilityServiceType.course => l10n.facilityDetails_noCourses,
    };

    return Padding(
      padding: EdgeInsets.all(context.spacing.s32),
      child: Text(
        message,
        style: context.typography.medium14.tertiary(context),
        textAlign: .center,
      ),
    );
  }
}
