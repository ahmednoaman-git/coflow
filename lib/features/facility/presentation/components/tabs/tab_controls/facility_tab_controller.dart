import 'package:flutter/material.dart';

class FacilityTabController extends InheritedWidget {
  const FacilityTabController({
    super.key,
    required this.selectedTab,
    required this.setSelectedTab,
    required super.child,
  });

  final int selectedTab;
  final void Function(int) setSelectedTab;

  static FacilityTabController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FacilityTabController>()!;
  }

  @override
  bool updateShouldNotify(FacilityTabController oldWidget) {
    return selectedTab != oldWidget.selectedTab;
  }
}
