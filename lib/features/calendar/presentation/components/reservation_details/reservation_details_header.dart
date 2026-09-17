import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../domain/entities/entities.dart';

/// The tinted top of the reservation sheet: the facility, then the slot name,
/// day + date, time range, instructors and level.
///
/// The facility comes first because the Calendar spans facilities — on the
/// facility's own Schedule tab it would be redundant.
class ReservationDetailsHeader extends StatelessWidget {
  const ReservationDetailsHeader({
    super.key,
    required this.reservation,
    required this.accent,
  });

  final ReservationDetailsEntity reservation;
  final Color accent;

  static const double _logoSize = 56;

  @override
  Widget build(BuildContext context) {
    final slot = reservation.slot;
    final level = slot.level;
    final hasTags = level != null || slot.isLadiesOnly;

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
          _FacilityLogo(
            name: reservation.facilityName,
            logoUrl: reservation.facilityLogoUrl,
          ),
          Text(
            reservation.facilityName,
            style: context.typography.bold20.withColor(accent),
            textAlign: .center,
          ),
          Text(
            slot.name.toUpperCase(),
            style: context.typography.bold18.withColor(accent),
            textAlign: .center,
          ),
          Text(
            _dayLabel(context),
            style: context.typography.medium16.withColor(accent),
          ),
          Text(
            '${CalendarDateFormat.time(context, slot.startsAt)}'
            ' - ${CalendarDateFormat.time(context, slot.endsAt)}',
            style: context.typography.medium16.withColor(accent),
          ),
          if (slot.instructorNames.isNotEmpty)
            Row(
              mainAxisAlignment: .center,
              spacing: context.spacing.s8,
              children: [
                Icon(SolarIconsOutline.userId, size: 20, color: accent),
                Flexible(
                  child: Text(
                    slot.instructorNames.join(', '),
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
                  if (slot.isLadiesOnly)
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
    final weekday = CalendarDateFormat.weekdayName(context, reservation.slot.startsAt);

    return '$weekday ${DateFormat('d/M', locale).format(reservation.slot.startsAt)}';
  }

  String _levelLabel(BuildContext context, FacilityServiceLevel level) => switch (level) {
    FacilityServiceLevelCustom(:final name) => name.toUpperCase(),
    FacilityServiceLevelAll() => context.l10n.facilityDetails_allLevels.toUpperCase(),
  };
}

class _FacilityLogo extends StatelessWidget {
  const _FacilityLogo({required this.name, required this.logoUrl});

  final String name;
  final String? logoUrl;

  @override
  Widget build(BuildContext context) {
    return ShimmerImage(
      imageUrl: logoUrl,
      width: ReservationDetailsHeader._logoSize,
      height: ReservationDetailsHeader._logoSize,
      borderRadius: ReservationDetailsHeader._logoSize / 2,
      errorWidget: Container(
        width: ReservationDetailsHeader._logoSize,
        height: ReservationDetailsHeader._logoSize,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: context.colors.signatureBlue,
          shape: const CircleBorder(),
        ),
        child: Text(
          name.isEmpty ? '' : name.characters.first.toUpperCase(),
          style: context.typography.bold20.inverse(context),
        ),
      ),
    );
  }
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
