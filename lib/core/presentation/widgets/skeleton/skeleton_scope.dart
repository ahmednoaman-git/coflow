import 'package:flutter/widgets.dart';

/// Drives the shimmer of every skeleton bone ([SkeletonBox], [SkeletonCircle],
/// [SkeletonText], [SkeletonChip]) beneath it.
///
/// Put one at the root of each loading placeholder. Bones paint their own
/// sweep against the screen rather than against this widget, and every
/// [Skeleton] runs off one shared clock — so separate placeholders on the same
/// screen (a tag row, a list, a "loading more" footer) sweep as one band.
///
/// Bones with no [Skeleton] above them still paint, just without the sweep.
/// So does everything when the platform asks for reduced motion.
///
/// Compose placeholders from the real layout — the same paddings, gaps and
/// surfaces as the content, with bones where data goes — so nothing shifts when
/// the content fades in over it (see `AsyncHandler.skeletonBuilder`).
class Skeleton extends StatefulWidget {
  const Skeleton({super.key, required this.child});

  final Widget child;

  /// One pass of the sweep across the screen.
  static const Duration period = Duration(milliseconds: 1500);

  /// The sweep's progress, or null outside a [Skeleton] or when motion is off.
  static Animation<double>? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_SkeletonScope>()?.sweep;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  /// Shared by every skeleton, so one that mounts later joins the sweep where
  /// the others already are.
  static final Stopwatch _clock = Stopwatch()..start();

  late final AnimationController _sweep = AnimationController(
    vsync: this,
    duration: Skeleton.period,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _sweep.stop();
    } else if (!_sweep.isAnimating) {
      final period = Skeleton.period.inMicroseconds;
      _sweep
        ..value = (_clock.elapsedMicroseconds % period) / period
        ..repeat();
    }
  }

  @override
  void dispose() {
    _sweep.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _SkeletonScope(
    sweep: MediaQuery.disableAnimationsOf(context) ? null : _sweep,
    // Repaints every frame while it sweeps; keep that off the rest of the
    // screen. Placeholders aren't interactive, nor anything to read out.
    child: RepaintBoundary(
      child: IgnorePointer(child: ExcludeSemantics(child: widget.child)),
    ),
  );
}

class _SkeletonScope extends InheritedWidget {
  const _SkeletonScope({required this.sweep, required super.child});

  final Animation<double>? sweep;

  @override
  bool updateShouldNotify(_SkeletonScope oldWidget) => sweep != oldWidget.sweep;
}
