import 'package:flutter/material.dart';

import '../../../activity_line/domain/entities/entities.dart';

/// Provides facility data down the widget tree.
///
/// This allows child widgets to access the current facility data,
/// activity line colors, logo image provider, and scroll controller
/// without passing them through constructor parameters.
class FacilityDataProvider extends InheritedWidget {
  const FacilityDataProvider({
    super.key,
    required this.scrollController,
    required this.facility,
    required this.activityLineColor,
    required this.activityLineBackground,
    this.isResolved = true,
    required super.child,
  });

  final ScrollController scrollController;
  final CollapsedFacilityEntity facility;
  final Color activityLineColor;
  final Color activityLineBackground;

  /// False while [facility] is a preview still waiting on its account type
  /// and subscription — see `FacilityDetailsState.isResolved`.
  final bool isResolved;

  /// Creates a FacilityDataProvider from an existing one, with a new child.
  /// Useful for passing the provider to modals/bottom sheets.
  factory FacilityDataProvider.fromFacilityDataProvider({
    required FacilityDataProvider facilityDataProvider,
    required Widget child,
  }) {
    return FacilityDataProvider(
      scrollController: facilityDataProvider.scrollController,
      facility: facilityDataProvider.facility,
      activityLineColor: facilityDataProvider.activityLineColor,
      activityLineBackground: facilityDataProvider.activityLineBackground,
      isResolved: facilityDataProvider.isResolved,
      child: child,
    );
  }

  static FacilityDataProvider of(BuildContext context) {
    final facilityDataProvider = context.dependOnInheritedWidgetOfExactType<FacilityDataProvider>();
    if (facilityDataProvider == null) {
      throw Exception('FacilityDataProvider not found in context');
    }
    return facilityDataProvider;
  }

  static FacilityDataProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FacilityDataProvider>();
  }

  @override
  bool updateShouldNotify(covariant FacilityDataProvider oldWidget) {
    return oldWidget.facility != facility || oldWidget.isResolved != isResolved;
  }
}
