import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:solar_icons/solar_icons.dart';

/// A flat, non-interactive map showing where a facility sits.
///
/// Deliberately inert: panning inside a card that lives in a scrolling profile
/// fights the scroll, so the whole preview is one tap target that hands off to
/// the facility's own maps link (or a coordinate search when it has none).
class FacilityMapPreview extends StatelessWidget {
  const FacilityMapPreview({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.pinColor,
    this.mapUrl,
  });

  final double latitude;
  final double longitude;

  /// Tinted with the activity line, so the pin matches the rest of the profile.
  final Color pinColor;

  /// The facility's shareable maps link, when it saved one.
  final String? mapUrl;

  static const double _height = 200;
  static const double _zoom = 14.5;

  @override
  Widget build(BuildContext context) {
    final center = LatLng(latitude, longitude);

    return TappableScale(
      borderRadius: BorderRadius.circular(context.spacing.s16),
      onTap: () => _openExternally(context),
      child: Container(
        height: _height,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: context.colors.backgroundGrey,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
            side: BorderSide(color: context.colors.strokePrimary),
          ),
        ),
        child: Stack(
          fit: .expand,
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: center,
                initialZoom: _zoom,
                // The card is a picture, not a map the user drives.
                interactionOptions: const InteractionOptions(flags: InteractiveFlag.none),
              ),
              children: [
                // TODO(infra): openstreetmap.org's public tiles are fine for
                // development but its usage policy rules them out for a
                // shipped app — point this at a paid tile provider (or a
                // Google Maps widget) before release. Nothing else changes.
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'co.coflow.users',
                  tileProvider: NetworkTileProvider(),
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: center,
                      width: 40,
                      height: 40,
                      // Anchor the pin's tip on the coordinate, not its middle.
                      alignment: Alignment.topCenter,
                      child: Icon(SolarIconsBold.mapPoint, color: pinColor, size: 32),
                    ),
                  ],
                ),
              ],
            ),
            // OpenStreetMap's terms require visible attribution on every map.
            PositionedDirectional(
              bottom: 0,
              end: 0,
              child: ColoredBox(
                color: context.colors.backgroundWhite.withValues(alpha: 0.75),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spacing.s4,
                    vertical: 2,
                  ),
                  child: Text(
                    '© OpenStreetMap',
                    style: context.typography.book10.tertiary(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openExternally(BuildContext context) async {
    final link = mapUrl?.trim();
    final opened = await (link != null && link.isNotEmpty
        ? ExternalLauncher.openUrl(link)
        : ExternalLauncher.openUrl(
            'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
          ));

    if (!opened && context.mounted) {
      context.showErrorSnackBar(context.l10n.facilityDetails_linkFailed);
    }
  }
}
