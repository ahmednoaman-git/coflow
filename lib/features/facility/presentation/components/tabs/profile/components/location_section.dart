import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../facility_data_provider.dart';
import '../../../page_section.dart';
import 'facility_map_preview.dart';

/// Location section for facility profile.
///
/// Renders one of two cards depending on how the facility operates: a fixed
/// address gets its written address plus a pinned map, a remote facility gets
/// the list of places it travels to. Both offer the same "Link" affordance when
/// the facility saved one.
class LocationSection extends StatelessWidget {
  const LocationSection({super.key, required this.location});

  final FacilityLocationEntity? location;

  @override
  Widget build(BuildContext context) {
    final location = this.location;
    if (location == null || location.isEmpty) return const SizedBox.shrink();

    return switch (location) {
      FacilityAddressLocation() => _AddressLocation(location: location),
      FacilityRemoteLocation() => _RemoteLocation(location: location),
    };
  }
}

class _AddressLocation extends StatelessWidget {
  const _AddressLocation({required this.location});

  final FacilityAddressLocation location;

  @override
  Widget build(BuildContext context) {
    final parts = <String>[
      ?location.addressLine,
      ?location.areaName,
      ?location.cityName,
      ?location.countryName,
    ].where((part) => part.trim().isNotEmpty).toList();

    return PageSection(
      title: context.l10n.facilityDetails_addressLocationSectionTitle,
      svgIconPath: Assets.svgs.location.path,
      trailing: _LocationLinkButton(url: location.link),
      children: [
        if (parts.isNotEmpty)
          Text(
            parts.join(', '),
            style: context.typography.medium12.secondary(context),
          ),
        if (location.hasCoordinates)
          FacilityMapPreview(
            latitude: location.latitude!,
            longitude: location.longitude!,
            mapUrl: location.mapUrl,
            pinColor: FacilityDataProvider.of(context).activityLineColor,
          ),
      ],
    );
  }
}

class _RemoteLocation extends StatelessWidget {
  const _RemoteLocation({required this.location});

  final FacilityRemoteLocation location;

  @override
  Widget build(BuildContext context) {
    return PageSection(
      title: context.l10n.facilityDetails_remoteLocationSectionTitle,
      svgIconPath: Assets.svgs.location.path,
      trailing: _LocationLinkButton(url: location.link),
      children: [
        if (location.coverage.isNotEmpty)
          Column(
            crossAxisAlignment: .stretch,
            spacing: context.spacing.s8,
            children: [
              Text(
                context.l10n.facilityDetails_operatingIn,
                style: context.typography.medium12.tertiary(context),
              ),
              for (final coverage in location.coverage) _CoverageCard(coverage: coverage),
            ],
          ),
      ],
    );
  }
}

/// One governorate the facility travels to: its name over the areas it covers,
/// each area a chip in the activity line's colours — or a single "All areas"
/// chip when it covers the whole place.
class _CoverageCard extends StatelessWidget {
  const _CoverageCard({required this.coverage});

  final FacilityCoverageEntity coverage;

  @override
  Widget build(BuildContext context) {
    final coversAll = coverage.coversAll || coverage.areas.isEmpty;

    return Container(
      padding: EdgeInsets.all(context.spacing.s12),
      decoration: ShapeDecoration(
        color: context.colors.backgroundGrey,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s12),
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s8,
        children: [
          Text(coverage.label, style: context.typography.medium14.primary(context)),
          Wrap(
            spacing: context.spacing.s8,
            runSpacing: context.spacing.s8,
            children: [
              if (coversAll)
                _AreaChip(label: context.l10n.facilityDetails_coverageAll, isEmphasised: true)
              else
                for (final area in coverage.areas) _AreaChip(label: area),
            ],
          ),
        ],
      ),
    );
  }
}

/// An area pill. The "All areas" pill is filled with the accent so a
/// whole-governorate entry reads differently from a list of named areas.
class _AreaChip extends StatelessWidget {
  const _AreaChip({required this.label, this.isEmphasised = false});

  final String label;
  final bool isEmphasised;

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final accent = facilityData.activityLineColor;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.s12,
        vertical: context.spacing.s4,
      ),
      decoration: ShapeDecoration(
        color: isEmphasised ? accent : facilityData.activityLineBackground,
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: context.typography.medium12.withColor(
          isEmphasised ? context.colors.textWhite : accent,
        ),
      ),
    );
  }
}

/// The pill that hands the location off to an external map or booking page.
/// Renders nothing when the facility never saved a link.
class _LocationLinkButton extends StatelessWidget {
  const _LocationLinkButton({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final url = this.url;
    if (url == null) return const SizedBox.shrink();

    final accent = FacilityDataProvider.of(context).activityLineColor;

    return Container(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: context.colors.backgroundWhite,
        shadows: context.shadows.sm,
      ),
      child: TappableScale(
        borderRadius: BorderRadius.circular(20),
        splashColor: accent.withValues(alpha: 0.1),
        onTap: () async {
          final opened = await ExternalLauncher.openUrl(url);
          if (!opened && context.mounted) {
            context.showErrorSnackBar(context.l10n.facilityDetails_linkFailed);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s12,
            vertical: context.spacing.s8,
          ),
          child: Row(
            mainAxisSize: .min,
            spacing: context.spacing.s8,
            children: [
              Text(
                context.l10n.facilityDetails_locationLink,
                style: context.typography.medium12.primary(context),
              ),
              Icon(SolarIconsOutline.arrowRightUp, size: 16, color: accent),
            ],
          ),
        ),
      ),
    );
  }
}
