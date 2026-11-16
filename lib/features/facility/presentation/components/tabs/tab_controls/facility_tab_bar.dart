import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../facility_data_provider.dart';
import 'facility_tab_controller.dart';
import 'facility_utils.dart';

class FacilityTabBar extends StatelessWidget {
  const FacilityTabBar({super.key});

  /// Diameter of the selected-tab indicator dot.
  static const double _dotSize = 8;

  /// Thickness of the line closing the tab bar.
  static const double _lineThickness = 1;

  /// Bones standing in for the tabs after Profile while a preview resolves —
  /// most facilities have three more.
  static const int _placeholderTabs = 3;

  @override
  Widget build(BuildContext context) {
    final data = FacilityDataProvider.of(context);

    // A preview doesn't know its tabs until the profile is in: only Profile —
    // the one every facility has — is real, with bones for the rest while it
    // loads. If it fails, Profile alone, carrying the retry.
    final tabs = data.isResolved
        ? FacilityUtils.getFacilityTabs(context, data.facility)
        : [context.l10n.facilityDetails_profileTab];
    final placeholders =
        !data.isResolved &&
            !context.select((FacilityDetailsCubit cubit) => cubit.state.profileRequest.isError)
        ? _placeholderTabs
        : 0;

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
                      for (var i = 0; i < placeholders; i++) const Expanded(child: _TabBone()),
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
                  for (var i = 0; i < tabs.length + placeholders; i++)
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

/// A tab label's bone, in the label's own box.
class _TabBone extends StatelessWidget {
  const _TabBone();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.s8),
      child: Skeleton(
        child: SkeletonText(
          style: context.typography.medium14,
          widthFactor: 0.8,
          alignment: .center,
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
