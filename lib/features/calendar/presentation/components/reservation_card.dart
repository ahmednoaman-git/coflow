import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';

/// One booked slot: tinted card led by the facility it belongs to, then the
/// service name, its level pill, and the instructors.
///
/// The facility line is what separates this from the facility Schedule tab's
/// card — the Calendar spans facilities, so a slot is meaningless without it.
class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key, required this.reservation});

  final ReservationEntity reservation;

  @override
  Widget build(BuildContext context) {
    final accent = reservation.colorHex.toColorOrNull() ?? context.colors.skyBluePrimary;

    return Container(
      padding: EdgeInsets.all(context.spacing.s12),
      decoration: ShapeDecoration(
        // Pale shade of the slot's own accent, derived from its lightness.
        color: accent.tintedSurface(),
        shape: RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s8,
        children: [
          _FacilityRow(
            name: reservation.facilityName,
            logoUrl: reservation.facilityLogoUrl,
            accent: accent,
          ),
          Text(
            reservation.serviceName.toUpperCase(),
            style: context.typography.book14.withColor(accent),
          ),
          if (reservation.level case final level?) _LevelPill(level: level, fallback: accent),
          SizedBox(height: context.spacing.s16),
          if (reservation.instructorNames.isNotEmpty)
            _InstructorsRow(names: reservation.instructorNames, accent: accent),
        ],
      ),
    );
  }
}

class _FacilityRow extends StatelessWidget {
  const _FacilityRow({required this.name, required this.logoUrl, required this.accent});

  final String name;
  final String? logoUrl;
  final Color accent;

  static const double _logoSize = 32;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s8,
      children: [
        ShimmerImage(
          imageUrl: logoUrl,
          width: _logoSize,
          height: _logoSize,
          borderRadius: _logoSize / 2,
          errorWidget: _LogoFallback(name: name),
        ),
        Expanded(
          child: Text(
            name,
            style: context.typography.bold18.withColor(accent),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Facilities without a logo show their initial on the brand panel colour, so
/// the row keeps its shape either way.
class _LogoFallback extends StatelessWidget {
  const _LogoFallback({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _FacilityRow._logoSize,
      height: _FacilityRow._logoSize,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: context.colors.signatureBlue,
        shape: const CircleBorder(),
      ),
      child: Text(
        name.isEmpty ? '' : name.characters.first.toUpperCase(),
        style: context.typography.bold16.inverse(context),
      ),
    );
  }
}

class _LevelPill extends StatelessWidget {
  const _LevelPill({required this.level, required this.fallback});

  final ReservationLevelEntity level;

  /// Used when the facility sent a level without a colour.
  final Color fallback;

  @override
  Widget build(BuildContext context) {
    final color = level.colorHex.toColorOrNull() ?? fallback;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s8,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        // Light shade of the accent, not the pale translucent tint used on
        // white backgrounds — the card surface is already a paler shade of the
        // same colour.
        color: color.levelBadgeSurface,
        shape: const StadiumBorder(),
      ),
      child: Text(
        level.name.toUpperCase(),
        style: context.typography.medium11.withColor(context.colors.textWhite),
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
            overflow: .ellipsis,
          ),
        ),
      ],
    );
  }
}
