import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../domain/entities/entities.dart';
import '../../services/components/service_level_pill.dart';
import 'session_capacity_bar.dart';

/// One scheduled session: tinted card carrying the service name, its level and
/// audience pills, the instructors, and (Calendar only) the capacity bar.
class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.session, required this.showsCapacity});

  final FacilitySessionEntity session;
  final bool showsCapacity;

  @override
  Widget build(BuildContext context) {
    final accent = session.colorHex.toColorOrNull() ?? context.colors.skyBluePrimary;
    final capacity = session.capacity;
    final hasPills = session.level != null || session.isLadiesOnly;

    return Container(
      padding: EdgeInsets.all(context.spacing.s12),
      decoration: ShapeDecoration(
        // Pale shade of the session's own accent, derived from its lightness.
        color: accent.tintedSurface(),
        shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s8,
        children: [
          Text(
            session.name.toUpperCase(),
            style: context.typography.bold16.withColor(accent),
          ),
          if (hasPills)
            Wrap(
              spacing: context.spacing.s8,
              runSpacing: context.spacing.s4,
              children: [
                if (session.level case final level?) ServiceLevelPill(level: level, isFilled: true),
                if (session.isLadiesOnly) const _LadiesOnlyPill(),
              ],
            ),
          SizedBox(height: context.spacing.s16),
          if (session.instructorNames.isNotEmpty)
            _InstructorsRow(names: session.instructorNames, accent: accent),
          if (showsCapacity && capacity != null)
            SessionCapacityBar(capacity: capacity, accent: accent),
        ],
      ),
    );
  }
}

class _LadiesOnlyPill extends StatelessWidget {
  const _LadiesOnlyPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: const StadiumBorder(),
      ),
      child: Text(
        context.l10n.facilitySchedule_ladiesOnly.toUpperCase(),
        style: context.typography.medium11.withColor(context.colors.ladiesOnlyPrimary),
      ),
    );
  }
}

class _InstructorsRow extends StatelessWidget {
  const _InstructorsRow({required this.names, required this.accent});

  final List<String> names;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s8,
      children: [
        Icon(SolarIconsOutline.userId, size: 20, color: accent),
        Expanded(
          child: Text(
            names.join(', '),
            style: context.typography.medium14.withColor(accent),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
