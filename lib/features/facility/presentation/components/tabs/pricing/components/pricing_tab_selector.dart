import 'dart:math';

import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/components.dart';
import 'package:coflow_users_v2/features/facility/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

class PricingTabSelector extends StatefulWidget {
  const PricingTabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final FacilityPricingTab selectedTab;
  final void Function(FacilityPricingTab) onTabSelected;

  @override
  State<PricingTabSelector> createState() => _PricingTabSelectorState();
}

class _PricingTabSelectorState extends State<PricingTabSelector>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// 0.0 = tickets (left), 1.0 = promotions (right)
  double _dragPosition = 0.0;
  bool _isDragging = false;

  static const double _outerPadding = 8.0;
  static const double _innerHeight = 32.0;
  static const double _velocityThreshold = 300.0;

  @override
  void initState() {
    super.initState();
    _dragPosition = widget.selectedTab == FacilityPricingTab.tickets ? 0.0 : 1.0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void didUpdateWidget(PricingTabSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTab != widget.selectedTab && !_isDragging) {
      _animateTo(widget.selectedTab == FacilityPricingTab.tickets ? 0.0 : 1.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateTo(double target) {
    final start = _dragPosition;
    final animation = Tween(begin: start, end: target).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    animation.addListener(() {
      setState(() => _dragPosition = animation.value);
    });
    _controller
      ..reset()
      ..forward();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _isDragging = true;
    _controller.stop();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details, double trackWidth) {
    if (trackWidth <= 0) return;
    final delta = details.primaryDelta! / trackWidth;
    setState(() {
      _dragPosition = (_dragPosition + delta).clamp(0.0, 1.0);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _isDragging = false;
    final velocity = details.primaryVelocity ?? 0.0;

    final target = switch ((velocity.abs() > _velocityThreshold, _dragPosition > 0.5)) {
      (true, _) => velocity > 0 ? FacilityPricingTab.promotions : FacilityPricingTab.tickets,
      (false, true) => FacilityPricingTab.promotions,
      (false, false) => FacilityPricingTab.tickets,
    };

    final targetPosition = target == FacilityPricingTab.tickets ? 0.0 : 1.0;
    _animateTo(targetPosition);

    if (target != widget.selectedTab) {
      widget.onTabSelected(target);
    }
  }

  void _onTap(FacilityPricingTab tab) {
    if (tab == widget.selectedTab) return;
    widget.onTabSelected(tab);
  }

  @override
  Widget build(BuildContext context) {
    final facilityData = FacilityDataProvider.of(context);
    final primaryColor = facilityData.activityLineColor;
    final secondaryColor = facilityData.activityLineBackground;
    final l10n = context.l10n;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final innerWidth = (totalWidth - _outerPadding * 2) / 2;
        final trackWidth = totalWidth - _outerPadding * 2 - innerWidth;

        return Container(
          height: _innerHeight + _outerPadding * 2,
          decoration: ShapeDecoration(
            color: primaryColor,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(_innerHeight / 2 + _outerPadding),
            ),
          ),
          child: GestureDetector(
            onHorizontalDragStart: _onHorizontalDragStart,
            onHorizontalDragUpdate: (details) => _onHorizontalDragUpdate(details, trackWidth),
            onHorizontalDragEnd: _onHorizontalDragEnd,
            behavior: HitTestBehavior.opaque,
            child: Stack(
              children: [
                Positioned(
                  left: _outerPadding + _dragPosition * trackWidth,
                  top: _outerPadding,
                  child: Container(
                    width: innerWidth,
                    height: _innerHeight,
                    decoration: ShapeDecoration(
                      color: secondaryColor,
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(_innerHeight / 2),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _outerPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onTap(FacilityPricingTab.tickets),
                          behavior: HitTestBehavior.opaque,
                          child: SizedBox(
                            height: _innerHeight + _outerPadding * 2,
                            child: Center(
                              child: Text(
                                l10n.facilityDetails_tickets.toUpperCase(),
                                style: _getTextStyle(context, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onTap(FacilityPricingTab.promotions),
                          behavior: HitTestBehavior.opaque,
                          child: SizedBox(
                            height: _innerHeight + _outerPadding * 2,
                            child: Center(
                              child: Text(
                                l10n.facilityDetails_promotions.toUpperCase(),
                                style: _getTextStyle(context, 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextStyle _getTextStyle(BuildContext context, double tabPosition) {
    final distance = (_dragPosition - tabPosition).abs();
    final selectedAmount = (1.0 - min(distance * 2.0, 1.0)).clamp(0.0, 1.0);

    final selectedStyle = context.typography.bold14.copyWith(
      color: context.colors.textPrimary,
    );
    final unselectedStyle = context.typography.medium14.copyWith(
      color: context.colors.textWhite,
    );

    return TextStyle.lerp(unselectedStyle, selectedStyle, selectedAmount)!;
  }
}
