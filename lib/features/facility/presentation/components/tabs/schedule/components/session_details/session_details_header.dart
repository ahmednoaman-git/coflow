import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../../domain/entities/entities.dart';

/// The tinted top of the slot sheet: name, day + date, time range,
/// instructors, level and ladies-only tags.
class SessionDetailsHeader extends StatelessWidget {
  const SessionDetailsHeader({super.key, required this.session, required this.accent});

  final FacilitySessionDetailsEntity session;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final level = session.level;
    final hasTags = level != null || session.isLadiesOnly;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s24,
        vertical: context.spacing.s24,
      ),
      color: accent.tintedSurface(),
      child: Column(
        spacing: context.spacing.s8,
        children: [
          Text(
            session.name.toUpperCase(),
            style: context.typography.bold20.withColor(accent),
            textAlign: .center,
          ),
          Text(
            _dayLabel(context),
            style: context.typography.medium16.withColor(accent),
          ),
          Text(
            '${CalendarDateFormat.time(context, session.startsAt)}'
            ' - ${CalendarDateFormat.time(context, session.endsAt)}',
            style: context.typography.medium16.withColor(accent),
          ),
          if (session.instructorNames.isNotEmpty)
            Row(
              mainAxisAlignment: .center,
              spacing: context.spacing.s8,
              children: [
                Icon(SolarIconsOutline.userId, size: 20, color: accent),
                Flexible(
                  child: Text(
                    session.instructorNames.join(', '),
                    style: context.typography.medium16.withColor(accent),
                  ),
                ),
              ],
            ),
          if (hasTags)
            Padding(
              padding: EdgeInsets.only(top: context.spacing.s4),
              child: Wrap(
                alignment: .center,
                spacing: context.spacing.s8,
                runSpacing: context.spacing.s8,
                children: [
                  if (level != null) _HeaderTag(label: _levelLabel(context, level), color: accent),
                  if (session.isLadiesOnly)
                    _HeaderTag(
                      label: context.l10n.facilitySchedule_ladiesOnly.toUpperCase(),
                      color: context.colors.ladiesOnlyPrimary,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// `Sunday 1/1` — weekday plus a numeric day/month.
  String _dayLabel(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final weekday = CalendarDateFormat.weekdayName(context, session.startsAt);

    return '$weekday ${DateFormat('d/M', locale).format(session.startsAt)}';
  }

  String _levelLabel(BuildContext context, FacilityServiceLevel level) => switch (level) {
    FacilityServiceLevelCustom(:final name) => name.toUpperCase(),
    FacilityServiceLevelAll() => context.l10n.facilityDetails_allLevels.toUpperCase(),
  };
}

/// White pill with coloured text — the sheet's tag treatment, distinct from
/// the tinted pills on the timeline card.
class _HeaderTag extends StatelessWidget {
  const _HeaderTag({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s16,
        vertical: context.spacing.s8,
      ),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: const StadiumBorder(),
      ),
      child: Text(label, style: context.typography.medium13.withColor(color)),
    );
  }
}
