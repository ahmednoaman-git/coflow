import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../../domain/entities/entities.dart';

/// A titled block in the slot sheet's body.
class SessionDetailsSection extends StatelessWidget {
  const SessionDetailsSection({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s24,
        vertical: context.spacing.s16,
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s16,
        children: [
          Text(title, style: context.typography.bold16.primary(context)),
          child,
        ],
      ),
    );
  }
}

/// Where the slot happens — the facility's own address, or the location picked
/// for the service when the facility-location toggle is off.
class SessionLocationSection extends StatelessWidget {
  const SessionLocationSection({super.key, required this.location});

  final SessionLocationEntity location;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SessionDetailsSection(
      title: location.isFacilityLocation
          ? l10n.facilitySchedule_facilityLocation
          : l10n.facilitySchedule_location,
      child: Row(
        spacing: context.spacing.s16,
        children: [
          Expanded(
            child: Text(
              location.address,
              style: context.typography.book14.secondary(context),
            ),
          ),
          if (location.mapUrl case final url? when url.trim().isNotEmpty)
            CircularButton(
              icon: SolarIconsOutline.squareArrowRightUp,
              onPressed: () async {
                final opened = await ExternalLauncher.openUrl(url);
                if (!opened && context.mounted) {
                  context.showErrorSnackBar(context.l10n.facilityDetails_linkFailed);
                }
              },
            ),
        ],
      ),
    );
  }
}

/// Free-text operational note from the facility (weather, gear, ...).
class SessionNoteSection extends StatelessWidget {
  const SessionNoteSection({super.key, required this.note});

  final String note;

  @override
  Widget build(BuildContext context) {
    return SessionDetailsSection(
      title: context.l10n.facilitySchedule_note,
      child: Text(note, style: context.typography.book14.secondary(context)),
    );
  }
}
