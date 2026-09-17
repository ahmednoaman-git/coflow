import 'dart:math';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

/// A segment of an [EzSlidingSelector].
class EzSlidingSegment<T> {
  const EzSlidingSegment({required this.value, required this.label});

  final T value;
  final String label;
}

/// A pill selector whose thumb slides between equal-width segments, by tap or
/// by drag. Segment labels cross-fade between the selected and unselected
/// styles as the thumb passes them.
///
/// Colors and text styles are supplied by the caller so the same mechanics can
/// serve an accent-coloured control (the Pricing tab selector) and a neutral
/// one (the Calendar's Activities/Courses toggle).
///
/// Any number of segments from two upwards is supported — they split the track
/// evenly and labels scale down to fit, so three-way controls with badged
/// labels (Search) work as well as two-way ones.
class EzSlidingSelector<T> extends StatefulWidget {
  const EzSlidingSelector({
    super.key,
    required this.segments,
    required this.selectedValue,
    required this.onValueChanged,
    required this.trackColor,
    required this.thumbColor,
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
    this.padding = 8.0,
    this.segmentHeight = 32.0,
  }) : assert(segments.length > 1, 'A sliding selector needs at least two segments');

  final List<EzSlidingSegment<T>> segments;
  final T selectedValue;
  final ValueChanged<T> onValueChanged;

  final Color trackColor;
  final Color thumbColor;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  /// Gap between the thumb and the track edges.
  final double padding;
  final double segmentHeight;

  @override
  State<EzSlidingSelector<T>> createState() => _EzSlidingSelectorState<T>();
}

class _EzSlidingSelectorState<T> extends State<EzSlidingSelector<T>>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// Thumb position as a fractional segment index (`0` = first segment).
  late double _position = _indexOfSelected.toDouble();
  bool _isDragging = false;

  static const double _velocityThreshold = 300.0;

  int get _indexOfSelected {
    final index = widget.segments.indexWhere((segment) => segment.value == widget.selectedValue);
    return index < 0 ? 0 : index;
  }

  int get _lastIndex => widget.segments.length - 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  void didUpdateWidget(EzSlidingSelector<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue && !_isDragging) {
      _animateTo(_indexOfSelected.toDouble());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateTo(double target) {
    final animation = Tween(begin: _position, end: target).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    animation.addListener(() {
      setState(() => _position = animation.value);
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
    final stepWidth = trackWidth / _lastIndex;
    final delta = (details.primaryDelta! / stepWidth) * (context.isRTL ? -1 : 1);
    setState(() {
      _position = (_position + delta).clamp(0.0, _lastIndex.toDouble());
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _isDragging = false;
    final velocity = (details.primaryVelocity ?? 0.0) * (context.isRTL ? -1 : 1);

    // A flick moves one segment in its direction; otherwise snap to nearest.
    final targetIndex = velocity.abs() > _velocityThreshold
        ? (velocity > 0 ? _position.floor() + 1 : _position.ceil() - 1)
        : _position.round();

    _select(targetIndex.clamp(0, _lastIndex));
  }

  void _select(int index) {
    _animateTo(index.toDouble());

    final value = widget.segments[index].value;
    if (value != widget.selectedValue) {
      widget.onValueChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final segmentWidth = (totalWidth - widget.padding * 2) / widget.segments.length;
        final trackWidth = totalWidth - widget.padding * 2 - segmentWidth;

        return Container(
          height: widget.segmentHeight + widget.padding * 2,
          decoration: ShapeDecoration(
            color: widget.trackColor,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(widget.segmentHeight / 2 + widget.padding),
            ),
          ),
          child: GestureDetector(
            onHorizontalDragStart: _onHorizontalDragStart,
            onHorizontalDragUpdate: (details) => _onHorizontalDragUpdate(details, trackWidth),
            onHorizontalDragEnd: _onHorizontalDragEnd,
            behavior: HitTestBehavior.opaque,
            child: Stack(
              children: [
                PositionedDirectional(
                  start: widget.padding + (_position / _lastIndex) * trackWidth,
                  top: widget.padding,
                  child: Container(
                    width: segmentWidth,
                    height: widget.segmentHeight,
                    decoration: ShapeDecoration(
                      color: widget.thumbColor,
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(widget.segmentHeight / 2),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.padding),
                  child: Row(
                    children: [
                      for (final (index, segment) in widget.segments.indexed)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _select(index),
                            behavior: HitTestBehavior.opaque,
                            child: SizedBox(
                              height: widget.segmentHeight + widget.padding * 2,
                              child: Center(
                                child: Padding(
                                  // Keeps neighbouring labels off each other
                                  // once three or more segments share the row.
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      segment.label,
                                      style: _styleFor(index),
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  ),
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

  TextStyle _styleFor(int index) {
    // Doubling the distance completes the cross-fade by the midpoint, so a
    // dragged thumb never leaves two labels looking equally selected.
    final distance = (_position - index).abs();
    final selectedAmount = (1.0 - min(distance * 2.0, 1.0)).clamp(0.0, 1.0);

    return TextStyle.lerp(widget.unselectedTextStyle, widget.selectedTextStyle, selectedAmount)!;
  }
}
