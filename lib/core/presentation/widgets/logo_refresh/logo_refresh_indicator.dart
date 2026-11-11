import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'drawn_logo.dart';

/// The app's pull-to-refresh: a drop-in replacement for [RefreshIndicator].
///
/// Pulling past the top moves the content itself down, and the Coflow logo
/// draws itself line by line in the gap that opens above it, tracking the
/// finger. Releasing once the logo is complete holds the gap open while
/// [onRefresh] runs, the logo looping — outer ring and inner ring spinning
/// opposite ways, a sheen passing over, a pulse — then the content settles
/// back up.
///
/// Works on every platform the same way: it lends the scroll view below a
/// physics that lets its top edge be pulled and held, and leaves the trailing
/// edge and every nested scrollable on the platform's own physics. So [child]:
///
/// - must be **sliver-based** (`CustomScrollView`, `ListView`, ...). A
///   `SingleChildScrollView` snaps back to its top whenever it re-lays out —
///   which a refresh swapping in skeletons does — so it is rejected in debug.
/// - should leave its physics to `AlwaysScrollableScrollPhysics()` (or none,
///   if it always overflows); an explicit Clamping/Bouncing one overrides the
///   pull.
///
/// When the scroll view runs behind something at the top (an app bar drawn
/// over the body), pass that height as [edgeOffset] so the logo appears below
/// it.
class LogoRefreshIndicator extends StatefulWidget {
  const LogoRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.edgeOffset = 0,
  });

  final RefreshCallback onRefresh;
  final Widget child;
  final double edgeOffset;

  /// How far the content has to be pulled to complete the logo and arm the
  /// refresh.
  static const double triggerExtent = 96;

  /// The gap kept open above the content while refreshing.
  static const double holdExtent = 64;

  /// Size of the logo at full scale.
  static const double logoSize = 32;

  /// One full loading loop: the spin, then the sheen and the pulse.
  static const Duration loopDuration = Duration(milliseconds: 1800);

  @override
  State<LogoRefreshIndicator> createState() => _LogoRefreshIndicatorState();
}

enum _Mode {
  /// Nothing showing.
  idle,

  /// Being pulled, short of the trigger: the logo is part drawn.
  drag,

  /// Pulled past the trigger: releasing will refresh.
  armed,

  /// [LogoRefreshIndicator.onRefresh] is running; the gap is held open.
  refreshing,

  /// Refresh done; the gap is closing.
  settling,
}

/// Where the loading loop is, as values for [DrawnLogo].
typedef _Pose = ({double outerTurn, double innerTurn, double? shimmer, double scale});

class _LogoRefreshIndicatorState extends State<LogoRefreshIndicator>
    with SingleTickerProviderStateMixin
    implements _PullHost {
  late final AnimationController _loop = AnimationController(
    vsync: this,
    duration: LogoRefreshIndicator.loopDuration,
  );
  final _mode = ValueNotifier(_Mode.idle);

  /// How far past its top the scroll view currently is.
  final _pulled = ValueNotifier(0.0);

  /// The scroll view this indicator drives: the outermost vertical one below.
  ScrollableState? _scrollable;

  late ScrollBehavior _scrollBehavior;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final behavior = ScrollConfiguration.of(context);
    _scrollBehavior = behavior.copyWith(
      physics: _PullToRefreshPhysics(this, parent: behavior.getScrollPhysics(context)),
    );
  }

  @override
  void dispose() {
    _loop.dispose();
    _mode.dispose();
    _pulled.dispose();
    super.dispose();
  }

  // -- _PullHost ------------------------------------------------------------

  @override
  bool owns(ScrollMetrics position) {
    final scrollable = _scrollable;
    return scrollable != null && scrollable.mounted && identical(scrollable.position, position);
  }

  @override
  double get holdExtent => switch (_mode.value) {
    .armed || .refreshing => LogoRefreshIndicator.holdExtent,
    _ => 0,
  };

  @override
  bool userOffsetPending = false;

  // -- Gesture --------------------------------------------------------------

  bool _onScroll(ScrollNotification notification) {
    if (notification.depth != 0 || notification.metrics.axis != Axis.vertical) return false;

    if (notification is ScrollStartNotification) {
      assert(_debugCheckSliverBased(notification));
      _scrollable = notification.context?.findAncestorStateOfType<ScrollableState>();
    }

    final metrics = notification.metrics;
    final pulled = math.max(0.0, metrics.minScrollExtent - metrics.pixels);
    final dragging = switch (notification) {
      ScrollStartNotification(:final dragDetails) => dragDetails != null,
      ScrollUpdateNotification(:final dragDetails) => dragDetails != null,
      _ => false,
    };
    final released =
        !dragging &&
        (notification is ScrollUpdateNotification || notification is ScrollEndNotification);

    // A scroll that settles while its viewport lays out reports from inside
    // layout, where a rebuild asked for is never scheduled — and the overlay,
    // left marked dirty, would then ignore every later update. Catch up right
    // after the frame instead.
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) _track(pulled: pulled, dragging: dragging, released: released);
      });
    } else {
      _track(pulled: pulled, dragging: dragging, released: released);
    }
    return false;
  }

  void _track({required double pulled, required bool dragging, required bool released}) {
    _pulled.value = pulled;
    final closed = pulled < _closedTolerance;

    switch (_mode.value) {
      case .idle:
        if (dragging && !closed) _mode.value = .drag;
      case .drag:
        if (closed && (dragging || released)) {
          _mode.value = .idle;
        } else if (dragging && pulled >= LogoRefreshIndicator.triggerExtent) {
          _mode.value = .armed;
          HapticFeedback.mediumImpact();
        }
      case .armed:
        if (released) {
          _refresh();
        } else if (dragging && pulled < LogoRefreshIndicator.triggerExtent) {
          _mode.value = .drag;
        }
      case .refreshing:
        break;
      case .settling:
        if (dragging && !closed) {
          _loop.stop();
          _mode.value = .drag;
        } else if (closed) {
          _toIdle();
        }
    }
  }

  bool _debugCheckSliverBased(ScrollNotification notification) {
    var singleChild = false;
    notification.context?.visitAncestorElements((element) {
      if (element.widget is SingleChildScrollView) singleChild = true;
      // Only the stretch between the scroll view and this indicator.
      return !singleChild && element != context;
    });
    if (singleChild) {
      throw FlutterError.fromParts([
        ErrorSummary('LogoRefreshIndicator was given a SingleChildScrollView.'),
        ErrorDescription(
          'A SingleChildScrollView snaps back to its top whenever it lays out, so a refresh '
          'that changes the content cuts the pull short and strands the indicator.',
        ),
        ErrorHint(
          'Use a CustomScrollView instead: put the content in a SliverToBoxAdapter, inside a '
          'SliverPadding for any padding.',
        ),
      ]);
    }
    return true;
  }

  // -- Refresh --------------------------------------------------------------

  Future<void> _refresh() async {
    _mode.value = .refreshing;
    final animate = !MediaQuery.disableAnimationsOf(context);
    if (animate) _loop.repeat();

    try {
      await Future.wait([
        Future.sync(widget.onRefresh),
        // Even an instant refresh shows one spin.
        if (animate) Future<void>.delayed(LogoRefreshIndicator.loopDuration * _spinEnd),
      ]);
    } finally {
      if (mounted) await _finish();
    }
  }

  /// Plays the loop on to its next resting point — the end of the spin, or
  /// the end of the pulse — then lets the gap close.
  Future<void> _finish() async {
    if (_loop.isAnimating) {
      final t = _loop.value;
      final rest = t <= _spinEnd ? _spinEnd : 1.0;
      _loop.stop();
      try {
        await _loop
            .animateTo(rest, duration: LogoRefreshIndicator.loopDuration * (rest - t))
            .orCancel;
      } on TickerCanceled {
        return;
      }
      if (!mounted) return;
    }

    _mode.value = .settling;

    final scrollable = _scrollable;
    final position = (scrollable != null && scrollable.mounted) ? scrollable.position : null;
    if (position == null || position.pixels >= position.minScrollExtent - _closedTolerance) {
      _toIdle();
    } else if (position is ScrollPositionWithSingleContext && !position.isScrollingNotifier.value) {
      // At rest in the held gap: spring back, now the physics no longer holds.
      // Mid-gesture, the release does this instead.
      position.goBallistic(0);
    }
  }

  void _toIdle() {
    _loop.stop();
    _loop.value = 0;
    _mode.value = .idle;
  }

  // -- Layout ---------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScroll,
      child: Stack(
        children: [
          ScrollConfiguration(behavior: _scrollBehavior, child: widget.child),
          ListenableBuilder(
            listenable: Listenable.merge([_mode, _pulled, _loop]),
            builder: (context, _) => _buildLogo(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final mode = _mode.value;
    final pulled = _pulled.value;

    // 0 → 1 as the logo comes in: with the pull while dragging, and back down
    // with the closing gap once done.
    final reveal = switch (mode) {
      .idle => 0.0,
      .drag || .armed => (pulled / LogoRefreshIndicator.triggerExtent).clamp(0.0, 1.0),
      .refreshing => 1.0,
      .settling => (pulled / LogoRefreshIndicator.holdExtent).clamp(0.0, 1.0),
    };
    if (reveal == 0 || pulled < _closedTolerance) return const SizedBox.shrink();

    final drawing = mode == .drag || mode == .armed;
    final pose = drawing ? _restPose : _pose(_loop.value);

    return Positioned(
      top: widget.edgeOffset,
      left: 0,
      right: 0,
      height: pulled,
      child: IgnorePointer(
        child: ClipRect(
          child: Center(
            child: Semantics(
              label: drawing
                  ? null
                  : MaterialLocalizations.of(context).refreshIndicatorSemanticLabel,
              child: Opacity(
                opacity: math.min(1, reveal * 1.5),
                child: DrawnLogo(
                  progress: drawing ? reveal : 1,
                  outerTurn: pose.outerTurn,
                  innerTurn: pose.innerTurn,
                  shimmer: pose.shimmer,
                  scale: (0.7 + 0.3 * reveal) * pose.scale,
                  size: LogoRefreshIndicator.logoSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The loop over `t` in 0 → 1:
  ///
  /// - up to [_spinEnd], the outer ring turns once clockwise and the inner
  ///   ring once anticlockwise, easing in and out;
  /// - then a sheen sweeps across the mark,
  /// - and, as it leaves, the mark swells and settles back.
  ///
  /// Both [_spinEnd] and 1 are rests — no turn, sheen or swell — so the loop
  /// can stop on either.
  static _Pose _pose(double t) {
    final spin = Curves.easeInOutCubic.transform((t / _spinEnd).clamp(0.0, 1.0)) * 2 * math.pi;
    final sheen = (t - _spinEnd) / _sheenLength;
    final swell = ((t - _swellStart) / (1 - _swellStart)).clamp(0.0, 1.0);
    return (
      outerTurn: spin,
      innerTurn: -spin,
      shimmer: sheen > 0 && sheen < 1 ? Curves.easeInOut.transform(sheen) : null,
      scale: 1 + _swell * math.sin(swell * math.pi),
    );
  }

  static const _Pose _restPose = (outerTurn: 0, innerTurn: 0, shimmer: null, scale: 1);

  static const _spinEnd = 0.5;
  static const _sheenLength = 0.3;
  static const _swellStart = 0.68;

  /// How much bigger the mark gets at the height of the pulse.
  static const _swell = 0.14;

  /// A gap this small counts as closed — the settle spring stops within its
  /// tolerance, not exactly on the edge.
  static const _closedTolerance = 0.5;
}

/// What [_PullToRefreshPhysics] needs from the indicator it serves.
abstract interface class _PullHost {
  /// Whether [position] is the scroll view the indicator drives.
  bool owns(ScrollMetrics position);

  /// The gap to settle at past the top on release: open while armed or
  /// refreshing, closed otherwise.
  double get holdExtent;

  /// Set between a user drag's offset and its boundary check, which are made
  /// back to back — tells a drag past the top from a fling into it.
  abstract bool userOffsetPending;
}

/// Lets the indicator's scroll view be dragged past its top with growing
/// resistance, and springs it back to [_PullHost.holdExtent] on release.
///
/// Flings still stop at the top on the platform's terms, the trailing edge is
/// untouched, and any other scrollable it reaches through the
/// [ScrollConfiguration] (horizontal rows, nested lists) gets [parent] as is.
class _PullToRefreshPhysics extends ScrollPhysics {
  const _PullToRefreshPhysics(this._host, {super.parent});

  final _PullHost _host;

  /// Matches the feel of iOS overscroll.
  static const double _resistance = 0.52;

  @override
  _PullToRefreshPhysics applyTo(ScrollPhysics? ancestor) =>
      _PullToRefreshPhysics(_host, parent: buildParent(ancestor));

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (!_host.owns(position)) return super.applyPhysicsToUserOffset(position, offset);

    final double applied;
    if (position.pixels > position.minScrollExtent) {
      applied = super.applyPhysicsToUserOffset(position, offset);
    } else if (offset > 0) {
      // Pulling further: heavier the further it already is.
      final pulled = position.minScrollExtent - position.pixels;
      final fraction = (pulled / position.viewportDimension).clamp(0.0, 1.0);
      applied = offset * _resistance * math.pow(1 - fraction, 2);
    } else {
      // Pushing back up follows the finger.
      applied = offset;
    }

    // A zero offset makes no boundary check to consume the flag.
    _host.userOffsetPending = applied != 0;
    return applied;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (_host.owns(position)) {
      final fromDrag = _host.userOffsetPending;
      _host.userOffsetPending = false;
      // Over the top is allowed for the drag itself, and for springing within
      // the gap once there; a fling arriving from the content stops at it.
      if (value < position.minScrollExtent &&
          (fromDrag || position.pixels < position.minScrollExtent)) {
        return 0;
      }
    }
    return super.applyBoundaryConditions(position, value);
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if (!_host.owns(position) || position.pixels >= position.minScrollExtent) {
      return super.createBallisticSimulation(position, velocity);
    }

    final target = position.minScrollExtent - _host.holdExtent;
    final tolerance = toleranceFor(position);
    // Already there: no simulation, or the position would keep restarting one.
    if ((position.pixels - target).abs() < tolerance.distance &&
        velocity.abs() < tolerance.velocity) {
      return null;
    }
    return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
  }
}
