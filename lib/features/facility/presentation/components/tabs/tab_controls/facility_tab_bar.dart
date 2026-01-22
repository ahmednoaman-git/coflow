import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../facility_data_provider.dart';
import 'facility_tab_controller.dart';
import 'facility_utils.dart';

class FacilityTabBar extends StatelessWidget {
  const FacilityTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final facility = FacilityDataProvider.of(context).facility;

    final tabs = FacilityUtils.getFacilityTabs(context, facility);

    final index = FacilityTabController.of(context).selectedTab;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: context.spacing.s8 + 4,
            child: ColoredBox(color: context.colors.backgroundWhite),
          ),
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: Divider(indent: 0, endIndent: 0, color: context.colors.strokePrimary),
          ),
          Padding(
            padding: EdgeInsets.all(context.spacing.s8),
            child: Row(
              spacing: context.spacing.s16,
              children: [
                for (var i = 0; i < tabs.length; i++)
                  Expanded(
                    child: _buildTabButton(
                      context,
                      title: tabs[i],
                      isSelected: i == index,
                      index: i,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required int index,
  }) {
    return Column(
      spacing: context.spacing.s8,
      crossAxisAlignment: .stretch,
      children: [
        TappableScale(
          onTap: () {
            FacilityTabController.of(context).setSelectedTab(index);
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: context.spacing.s8),
            child: Text(
              title,
              style: context.typography.medium14.copyWith(
                color: isSelected
                    ? context.colors.textPrimary
                    : context.colors.textTertiary,
              ),
              textAlign: .center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isSelected ? context.colors.textPrimary : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
