import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../facility_data_provider.dart';
import 'facility_tab_controller.dart';
import 'facility_utils.dart';

class FacilityTabBar extends StatelessWidget {
  const FacilityTabBar({super.key});

  /// Diameter of the selected-tab indicator dot.
  static const double _dotSize = 8;

  /// Thickness of the line closing the tab bar.
  static const double _lineThickness = 1;

  @override
  Widget build(BuildContext context) {
    final facility = FacilityDataProvider.of(context).facility;

    final tabs = FacilityUtils.getFacilityTabs(context, facility);

    final index = FacilityTabController.of(context).selectedTab;

    final horizontalPadding = EdgeInsets.symmetric(horizontal: context.spacing.s8);

    return SizedBox(
      width: double.infinity,
      // The dot straddles the line, so its lower half paints outside the bar.
      child: Stack(
        clipBehavior: .none,
        children: [
          ColoredBox(
            color: context.colors.backgroundWhite,
            child: Column(
              mainAxisSize: .min,
              children: [
                Padding(
                  padding: horizontalPadding + EdgeInsets.symmetric(vertical: context.spacing.s8),
                  child: Row(
                    spacing: context.spacing.s16,
                    children: [
                      for (var i = 0; i < tabs.length; i++)
                        Expanded(
                          child: _TabLabel(
                            title: tabs[i],
                            isSelected: i == index,
                            index: i,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(height: _lineThickness, color: context.colors.strokePrimary),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            // Centers the dot on the line: half a dot up from the line's centre.
            bottom: _lineThickness / 2 - _dotSize / 2,
            child: Padding(
              padding: horizontalPadding,
              child: Row(
                spacing: context.spacing.s16,
                children: [
                  for (var i = 0; i < tabs.length; i++)
                    Expanded(child: _TabDot(isSelected: i == index)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({required this.title, required this.isSelected, required this.index});

  final String title;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TappableScale(
      onTap: () => FacilityTabController.of(context).setSelectedTab(index),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spacing.s8),
        child: Text(
          title,
          style: context.typography.medium14.copyWith(
            color: isSelected ? context.colors.textPrimary : context.colors.textTertiary,
          ),
          textAlign: .center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _TabDot extends StatelessWidget {
  const _TabDot({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: FacilityTabBar._dotSize,
        height: FacilityTabBar._dotSize,
        decoration: BoxDecoration(
          color: isSelected ? context.colors.textPrimary : Colors.transparent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
