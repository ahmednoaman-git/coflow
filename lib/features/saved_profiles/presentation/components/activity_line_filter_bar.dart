import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The row of activity-line chips above the saved list.
///
/// Starts on "All" — no chip selected — and tapping the selected chip returns
/// there, so the filter never traps the user on one line.
///
/// The glyphs keep the colours baked into their assets rather than being tinted
/// from the theme: they are the brand marks for the four lines, and they read
/// the same on the grey and the navy chip.
class ActivityLineFilterBar extends StatelessWidget {
  const ActivityLineFilterBar({
    super.key,
    required this.selectedLine,
    required this.onLineSelected,
  });

  /// The line being filtered on, or null for "All".
  final ActivityLineEntity? selectedLine;

  final ValueChanged<ActivityLineEntity> onLineSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.spacing.s8,
      children: [
        for (final line in ActivityLineEntity.all)
          Expanded(
            child: _LineChip(
              line: line,
              isSelected: line == selectedLine,
              onTap: () => onLineSelected(line),
            ),
          ),
      ],
    );
  }
}

class _LineChip extends StatelessWidget {
  const _LineChip({required this.line, required this.isSelected, required this.onTap});

  final ActivityLineEntity line;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _height = 44;
  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.spacing.s16);

    return Semantics(
      button: true,
      selected: isSelected,
      label: line.getName(context.l10n),
      child: SizedBox(
        height: _height,
        child: TappableScale(
          onTap: onTap,
          borderRadius: radius,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastEaseInToSlowEaseOut,
            decoration: ShapeDecoration(
              color: isSelected ? context.colors.signatureBlue : context.colors.backgroundGreyTwo,
              shape: RoundedSuperellipseBorder(borderRadius: radius),
            ),
            child: Center(
              child: SvgPicture.asset(line.iconPath, width: _iconSize, height: _iconSize),
            ),
          ),
        ),
      ),
    );
  }
}
