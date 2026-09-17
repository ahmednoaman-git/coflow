import 'dart:math';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../domain/entities/entities.dart';

/// How full a session is: a stadium track filled to `booked / total`, with the
/// count riding inside the fill, against its trailing edge.
///
/// The count re-centres over the whole track when there is no fill to sit in
/// (empty) or when the fill covers everything (full). A fill too narrow to
/// hold the count widens to fit it, so a barely-booked session still reads as
/// a pill rather than a sliver.
///
/// A fully booked session gives up part of the row to its waitlist count.
class SessionCapacityBar extends StatelessWidget {
  const SessionCapacityBar({super.key, required this.capacity, required this.accent});

  final FacilitySessionCapacityEntity capacity;
  final Color accent;

  /// Identifies the filled portion of the track (used by tests).
  static const Key fillKey = Key('session-capacity-fill');

  static const double height = 24;
  static const double _iconSize = 14;

  @override
  Widget build(BuildContext context) {
    if (!capacity.hasWaitlist) return _buildTrack(context);

    return Row(
      spacing: context.spacing.s8,
      children: [
        Expanded(child: _buildTrack(context)),
        _WaitlistLabel(count: capacity.waitlistCount, accent: accent),
      ],
    );
  }

  Widget _buildTrack(BuildContext context) {
    final labelStyle = _labelStyle(context);
    final gap = context.spacing.s4;

    // Keeps the count clear of the fill's rounded cap.
    final endPadding = context.spacing.s12;

    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth;

        // Measured rather than estimated so the fill is never a hair too
        // narrow for the count it carries.
        final labelWidth = gap + _iconSize + gap + _countWidth(context, labelStyle) + endPadding;

        final fillWidth = capacity.booked <= 0
            ? 0.0
            : min(max(trackWidth * capacity.fillFraction, labelWidth), trackWidth);

        final isCentered = fillWidth <= 0 || fillWidth >= trackWidth;

        // A centred label only lands on the fill when the fill reaches the
        // middle of the track; otherwise it sits on the white part.
        final isLabelOnFill = !isCentered || fillWidth > trackWidth / 2;

        final label = _CapacityLabel(
          capacity: capacity,
          style: labelStyle,
          color: isLabelOnFill
              ? (accent.prefersDarkForeground
                    ? context.colors.textPrimary
                    : context.colors.textWhite)
              : accent,
        );

        final fillDecoration = ShapeDecoration(color: accent, shape: const StadiumBorder());

        return SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: context.colors.backgroundWhite,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              if (isCentered) ...[
                if (fillWidth > 0)
                  Positioned.fill(
                    child: DecoratedBox(key: fillKey, decoration: fillDecoration),
                  ),
                Center(child: label),
              ] else
                PositionedDirectional(
                  start: 0,
                  top: 0,
                  bottom: 0,
                  width: fillWidth,
                  child: DecoratedBox(
                    key: fillKey,
                    decoration: fillDecoration,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: endPadding),
                      child: Align(alignment: .centerEnd, child: label),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  TextStyle _labelStyle(BuildContext context) => context.typography.medium12;

  double _countWidth(BuildContext context, TextStyle style) {
    final painter = TextPainter(
      text: TextSpan(text: _countText, style: style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();

    return painter.width;
  }

  String get _countText => '${capacity.booked}/${capacity.total}';
}

/// `5 waiting` — shown next to a full bar.
class _WaitlistLabel extends StatelessWidget {
  const _WaitlistLabel({required this.count, required this.accent});

  final int count;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: context.spacing.s4,
      children: [
        Icon(SolarIconsOutline.stopwatch, size: SessionCapacityBar._iconSize, color: accent),
        Text(
          context.l10n.facilitySchedule_waitingCount(count),
          style: context.typography.medium12.withColor(accent),
        ),
      ],
    );
  }
}

class _CapacityLabel extends StatelessWidget {
  const _CapacityLabel({
    required this.capacity,
    required this.style,
    required this.color,
  });

  final FacilitySessionCapacityEntity capacity;
  final TextStyle style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      spacing: context.spacing.s4,
      children: [
        Icon(
          SolarIconsOutline.usersGroupRounded,
          size: SessionCapacityBar._iconSize,
          color: color,
        ),
        Text('${capacity.booked}/${capacity.total}', style: style.withColor(color)),
      ],
    );
  }
}
