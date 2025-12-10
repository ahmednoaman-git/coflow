import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A segment option for the segmented control
class EzSegment<T> {
  final T value;
  final String label;
  final IconData? icon;

  const EzSegment({required this.value, required this.label, this.icon});
}

/// A custom segmented control widget with iOS-like design.
///
/// This widget provides a multi-option selector with smooth animations
/// and theme-aware styling matching the CoFlow design system.
///
/// Example:
/// ```dart
/// EzSegmentedControl<int>(
///   segments: [
///     EzSegment(value: 1, label: 'School', icon: LucideIcons.school),
///     EzSegment(value: 2, label: 'Delivery', icon: LucideIcons.truck),
///   ],
///   selectedValue: 1,
///   onValueChanged: (value) => print('Selected: $value'),
/// )
/// ```
class EzSegmentedControl<T> extends StatelessWidget {
  /// List of segments to display
  final List<EzSegment<T>> segments;

  /// Currently selected value
  final T selectedValue;

  /// Callback when selection changes
  final ValueChanged<T> onValueChanged;

  /// Height of the segmented control
  final double height;

  const EzSegmentedControl({
    super.key,
    required this.segments,
    required this.selectedValue,
    required this.onValueChanged,
    this.height = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: context.colors.strokePrimary, width: 1.0),
        ),
        color: context.colors.backgroundTwo,
      ),
      padding: EdgeInsets.all(context.spacing.s4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final segmentWidth = constraints.maxWidth / segments.length;
          final selectedIndex = segments.indexWhere(
            (s) => s.value == selectedValue,
          );

          return Stack(
            children: [
              // Animated selection indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: selectedIndex * segmentWidth,
                top: 0,
                bottom: 0,
                width: segmentWidth,
                child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: context.colors.backgroundWhite,
                    shadows: context.shadows.sm,
                  ),
                ),
              ),
              // Segments
              Row(
                children: segments.map((segment) {
                  final isSelected = segment.value == selectedValue;
                  return Expanded(
                    child: _SegmentButton(
                      segment: segment,
                      isSelected: isSelected,
                      onTap: () => onValueChanged(segment.value),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SegmentButton<T> extends StatelessWidget {
  final EzSegment<T> segment;
  final bool isSelected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.segment,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.spacing.s8,
          children: [
            if (segment.icon != null)
              Icon(
                segment.icon,
                size: 16,
                color: isSelected
                    ? context.colors.textPrimary
                    : context.colors.textTertiary,
              ),
            Text(
              segment.label,
              style: isSelected
                  ? context.typography.medium14.primary(context)
                  : context.typography.medium14.tertiary(context),
            ),
          ],
        ),
      ),
    );
  }
}
