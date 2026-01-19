import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:solar_icons/solar_icons.dart';

/// A bottom sheet for selecting a location (city or area).
///
/// This widget displays a list of cities and their areas, allowing the user
/// to select a specific location to filter content.
class LocationSelectorBottomSheet extends StatefulWidget {
  const LocationSelectorBottomSheet({
    super.key,
    required this.locations,
    required this.initialSelection,
    required this.onConfirm,
  });

  /// The available locations to choose from.
  final LocationsEntity locations;

  /// The currently selected location.
  final SelectedLocation initialSelection;

  /// Callback when user confirms selection.
  final ValueChanged<SelectedLocation> onConfirm;

  @override
  State<LocationSelectorBottomSheet> createState() => _LocationSelectorBottomSheetState();
}

class _LocationSelectorBottomSheetState extends State<LocationSelectorBottomSheet> {
  late SelectedLocation _selection;

  @override
  void initState() {
    super.initState();
    _selection = widget.initialSelection;
  }

  void _handleCitySelection(LocationCityEntity city) {
    setState(() {
      _selection = SelectedLocation(cityId: city.id, cityName: city.name);
    });
  }

  void _handleAreaSelection(LocationAreaEntity area, LocationCityEntity city) {
    setState(() {
      _selection = SelectedLocation(
        cityId: city.id,
        cityName: city.name,
        areaId: area.id,
        areaName: area.name,
      );
    });
  }

  void _handleClearSelection() {
    setState(() {
      _selection = const SelectedLocation();
    });
  }

  void _handleRemoteSelection() {
    setState(() {
      _selection = const SelectedLocation(isRemote: true);
    });
  }

  void _handleConfirm() {
    widget.onConfirm(_selection);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s24,
          vertical: context.spacing.s16,
        ),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          spacing: context.spacing.s16,
          children: [
            // Header with button
            _Header(onConfirm: _handleConfirm),
            // Divider
            _buildDivider(context),
            // Section title
            Text(
              context.l10n.selectGovernorateArea,
              style: context.typography.book12.secondary(context),
            ),
            // Cities and areas list
            _LocationsList(
              cities: widget.locations.cities,
              selection: _selection,
              onCitySelected: _handleCitySelection,
              onAreaSelected: _handleAreaSelection,
              onClearSelection: _handleClearSelection,
            ),
            // Remote option (if available)
            if (widget.locations.remoteCount > 0) ...[
              _buildDivider(context),
              _RemoteOption(
                count: widget.locations.remoteCount,
                isSelected: _selection.isRemote,
                onTap: _handleRemoteSelection,
              ),
            ],
            SizedBox(height: context.spacing.s8),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      color: context.colors.strokeSecondary,
      thickness: 1,
      height: context.spacing.s16,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s8,
      children: [
        Icon(
          SolarIconsOutline.mapPoint,
          size: 16,
          color: context.colors.signatureBlue,
        ),
        Expanded(
          child: Text(
            context.l10n.locations,
            style: context.typography.medium14.brand(context),
          ),
        ),
        MainButton(
          text: context.l10n.confirm,
          trailingIcon: SolarIconsOutline.checkCircle,
          onPressed: onConfirm,
          height: 32,
        ),
      ],
    );
  }
}

class _LocationsList extends StatelessWidget {
  const _LocationsList({
    required this.cities,
    required this.selection,
    required this.onCitySelected,
    required this.onAreaSelected,
    required this.onClearSelection,
  });

  final List<LocationCityEntity> cities;
  final SelectedLocation selection;
  final ValueChanged<LocationCityEntity> onCitySelected;
  final void Function(LocationAreaEntity, LocationCityEntity) onAreaSelected;
  final VoidCallback onClearSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        // "All" option
        _LocationItem(
          name: context.l10n.all,
          count: null,
          isSelected: selection.isEmpty,
          onTap: onClearSelection,
        ),
        Divider(
          color: context.colors.strokePrimary,
          thickness: 1,
          height: context.spacing.s16,
        ),
        // Cities
        for (int i = 0; i < cities.length; i++) ...[
          _LocationItem(
            name: cities[i].name,
            count: cities[i].facilityCount,
            isSelected: selection.cityId == cities[i].id && selection.areaId == null,
            onTap: () => onCitySelected(cities[i]),
          ),
          // Areas under this city
          if (cities[i].areas != null && cities[i].areas!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(left: context.spacing.s24),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  for (final area in cities[i].areas!)
                    _LocationItem(
                      name: area.name,
                      count: area.facilityCount,
                      isSelected: selection.areaId == area.id,
                      isArea: true,
                      onTap: () => onAreaSelected(area, cities[i]),
                    ),
                ],
              ),
            ),
          // Separator (only if not last item)
          if (i < cities.length - 1)
            Divider(
              color: context.colors.strokePrimary,
              thickness: 1,
              height: context.spacing.s16,
            ),
        ],
      ],
    );
  }
}

class _LocationItem extends StatelessWidget {
  const _LocationItem({
    required this.name,
    required this.count,
    required this.isSelected,
    required this.onTap,
    this.isArea = false,
  });

  final String name;
  final int? count;
  final bool isSelected;
  final bool isArea;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? context.colors.signatureBlue : context.colors.textSecondary;

    final textStyle = isArea ? context.typography.medium12 : context.typography.medium14;

    final displayText = count != null ? '$name ($count)' : name;

    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.spacing.s8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.spacing.s8,
          horizontal: context.spacing.s12,
        ),
        child: Row(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: 300.milliseconds,

                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    displayText,
                    key: ValueKey(displayText + isSelected.toString()),
                    style: textStyle.withColor(textColor),
                  ),
                ),
              ),
            ),
            MainAnimatedSwitcher.scaleFade(
              duration: 300.milliseconds,
              child: isSelected
                  ? Icon(
                      SolarIconsBold.checkCircle,
                      color: context.colors.signatureBlue,
                      size: 16,
                    )
                  : const SizedBox.shrink(),
            ),
            // if (isSelected)
            //   Icon(
            //     SolarIconsBold.checkCircle,
            //     color: context.colors.signatureBlue,
            //     size: 16,
            //   ),
          ],
        ),
      ),
    );
  }
}

class _RemoteOption extends StatelessWidget {
  const _RemoteOption({
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.spacing.s8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.spacing.s8,
          horizontal: context.spacing.s12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${context.l10n.remote} ($count)',
                style: isSelected
                    ? context.typography.medium12.brand(context)
                    : context.typography.medium12.secondary(context),
              ),
            ),
            if (isSelected)
              Icon(
                SolarIconsBold.checkCircle,
                color: context.colors.signatureBlue,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
