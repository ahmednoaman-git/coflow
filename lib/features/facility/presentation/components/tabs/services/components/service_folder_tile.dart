import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/enums/enums.dart';
import 'service_tile.dart';

/// An expandable folder of services. Expansion state is local and
/// independent of sibling folders.
class ServiceFolderTile extends StatefulWidget {
  const ServiceFolderTile({
    super.key,
    required this.folder,
    required this.type,
    this.initiallyExpanded = false,
  });

  final FacilityServiceFolderEntity folder;
  final FacilityServiceType type;
  final bool initiallyExpanded;

  @override
  State<ServiceFolderTile> createState() => _ServiceFolderTileState();
}

class _ServiceFolderTileState extends State<ServiceFolderTile> {
  late bool _expanded = widget.initiallyExpanded;

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.colors.backgroundGrey,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          TappableScale(
            onTap: _toggle,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.all(context.spacing.s12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.facilityDetails_folderTitle(
                        widget.folder.name,
                        widget.folder.services.length,
                      ),
                      style: context.typography.medium14.primary(context),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Icon(
                      SolarIconsOutline.altArrowDown,
                      size: 20,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              child: _expanded
                  ? Padding(
                      key: const ValueKey(true),
                      padding: EdgeInsets.fromLTRB(
                        context.spacing.s12,
                        0,
                        context.spacing.s12,
                        context.spacing.s12,
                      ),
                      child: Column(
                        spacing: context.spacing.s8,
                        children: [
                          for (final service in widget.folder.services)
                            ServiceTile(service: service, type: widget.type),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey(false)),
            ),
          ),
        ],
      ),
    );
  }
}
