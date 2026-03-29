import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../page_section.dart';

/// Operating hours section for facility profile.
class OperatingHoursSection extends StatelessWidget {
  const OperatingHoursSection({super.key, required this.operations});

  final List<OperatingHoursEntity> operations;

  @override
  Widget build(BuildContext context) {
    if (operations.isEmpty) {
      return const SizedBox.shrink();
    }

    return PageSection(
      title: context.l10n.facilityDetails_operatingHoursSectionTitle,
      svgIconPath: Assets.svgs.hours.path,
      children: [
        Column(
          spacing: context.spacing.s16,
          children: [
            for (final operation in operations) _buildOperation(context, operation),
          ],
        ),
      ],
    );
  }

  Widget _buildOperation(BuildContext context, OperatingHoursEntity operation) {
    return Row(
      children: [
        Expanded(
          child: Text(
            operation.days.join(' - '),
            style: context.typography.medium12.tertiary(context),
          ),
        ),
        Text(
          '${_militaryToStandard(operation.fromTime)} - ${_militaryToStandard(operation.toTime)}',
          style: context.typography.medium12
              .secondary(context)
              .copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  String _militaryToStandard(String time) {
    final parts = time.split(':');
    if (parts.isEmpty) return time;
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts.length > 1 ? parts[1] : '00';
    final suffix = hour >= 12 ? 'PM' : 'AM';
    final standardHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$standardHour:$minute $suffix';
  }
}
