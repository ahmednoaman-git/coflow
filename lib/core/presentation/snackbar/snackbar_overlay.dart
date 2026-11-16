import 'dart:async';

import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shows the current snackbar from [SnackbarCubit], sliding it in from the top
/// and back out when it is dismissed.
class SnackbarOverlay extends StatelessWidget {
  const SnackbarOverlay({super.key});

  /// Keeps the card a card on tablets instead of a full-width banner.
  static const _maxWidth = 460.0;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SnackbarCubit, SnackbarState, SnackbarItem?>(
      selector: (state) => state.current,
      builder: (context, item) => Align(
        alignment: .topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            reverseDuration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            layoutBuilder: (current, previous) => Stack(
              alignment: .topCenter,
              children: [...previous, ?current],
            ),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(begin: const Offset(0, -0.5), end: Offset.zero).animate(animation),
                child: child,
              ),
            ),
            child: item == null
                ? const SizedBox.shrink()
                : _SnackbarCard(key: ValueKey(item.id), item: item),
          ),
        ),
      ),
    );
  }
}

/// A single snackbar. Auto-dismisses after its duration; tap it or swipe it up
/// to dismiss early. Dragging pauses the timer.
class _SnackbarCard extends StatefulWidget {
  const _SnackbarCard({super.key, required this.item});

  final SnackbarItem item;

  @override
  State<_SnackbarCard> createState() => _SnackbarCardState();
}

class _SnackbarCardState extends State<_SnackbarCard> {
  /// Upward travel, or upward fling speed, that counts as a dismiss.
  static const _dismissDistance = 24.0;
  static const _dismissVelocity = 350.0;

  Timer? _timer;
  double _dragDy = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(widget.item.duration, _dismiss);
  }

  void _dismiss() {
    _timer?.cancel();
    if (!mounted) return;
    context.read<SnackbarCubit>().dismiss(widget.item.id);
  }

  void _onDragStart(DragStartDetails _) {
    _timer?.cancel();
    setState(() => _isDragging = true);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() => _dragDy += details.delta.dy);
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (_dragDy < -_dismissDistance || velocity < -_dismissVelocity) {
      _dismiss();
      return;
    }
    setState(() {
      _dragDy = 0;
      _isDragging = false;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final type = widget.item.type;

    // Free upwards, heavily damped downwards: the card only leaves upwards.
    final offset = _dragDy < 0 ? _dragDy : _dragDy * 0.2;

    return GestureDetector(
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: AnimatedContainer(
        duration: _isDragging ? Duration.zero : const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, offset, 0),
        child: Semantics(
          liveRegion: true,
          container: true,
          child: TappableScale(
            onTap: _dismiss,
            scaleEnd: 0.98,
            backgroundColor: colors.backgroundWhite,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(spacing.s16),
            borderSide: BorderSide(color: colors.strokePrimary),
            shadows: context.shadows.md,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                spacing.s12,
                spacing.s12,
                spacing.s16,
                spacing.s12,
              ),
              child: Row(
                spacing: spacing.s12,
                children: [
                  DecoratedBox(
                    decoration: ShapeDecoration(
                      color: type.tint(colors),
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(spacing.s8),
                      ),
                    ),
                    child: SizedBox.square(
                      dimension: 32,
                      child: Icon(type.icon, size: 18, color: type.accent(colors)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.item.message,
                      style: context.typography.medium14.primary(context),
                      maxLines: 4,
                      overflow: .ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
