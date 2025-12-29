import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Activity line chip widget displaying Sky, Sea, Earth, or Energy.
/// Designed as a square button for use in a grid layout.
class ActivityLineChip extends StatelessWidget {
  const ActivityLineChip({
    super.key,
    required this.name,
    required this.isSelected,
    this.onTap,
  });

  /// Activity line name (Sky, Sea, Earth, Energy).
  final String name;

  /// Whether this chip is selected.
  final bool isSelected;

  /// Callback when chip is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: ShapeDecoration(
          color: isSelected
              ? context.colors.signatureBlue
              : context.colors.backgroundWhite,
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
            side: BorderSide(
              color: isSelected
                  ? context.colors.signatureBlue
                  : context.colors.strokePrimary,
            ),
          ),
          shadows: context.shadows.sm,
        ),
        child: Column(
          mainAxisAlignment: .center,
          spacing: context.spacing.s8,
          children: [
            _buildIcon(context),
            Text(
              _getLocalizedName(context),
              style: context.typography.medium12.copyWith(
                color: isSelected
                    ? context.colors.textWhite
                    : context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final color = isSelected
        ? context.colors.textWhite
        : _getActivityLineColor(context);

    final svgAsset = _getSvgAsset();
    return SvgPicture.asset(
      svgAsset,
      width: 28,
      height: 28,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  String _getSvgAsset() {
    return switch (name.toLowerCase()) {
      'sky' => Assets.svgs.sky.path,
      'sea' => Assets.svgs.sea.path,
      'earth' => Assets.svgs.earth.path,
      'energy' => Assets.svgs.energy.path,
      _ => Assets.svgs.sky.path,
    };
  }

  Color _getActivityLineColor(BuildContext context) {
    return switch (name.toLowerCase()) {
      'sky' => context.colors.skyBluePrimary,
      'sea' => context.colors.seaCaribbeanPrimary,
      'earth' => context.colors.earthSunnyGoldPrimary,
      'energy' => context.colors.energyCherryPrimary,
      _ => context.colors.signatureBlue,
    };
  }

  String _getLocalizedName(BuildContext context) {
    return switch (name.toLowerCase()) {
      'sky' => context.l10n.sky,
      'sea' => context.l10n.sea,
      'earth' => context.l10n.earth,
      'energy' => context.l10n.energy,
      _ => name,
    };
  }
}
