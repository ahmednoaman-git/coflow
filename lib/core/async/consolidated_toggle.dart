import 'dart:async';

import 'package:fpdart/fpdart.dart';

import 'async_request_manager.dart';
import 'failure.dart';
import 'types.dart';

/// A flag the server flips through a toggle endpoint — one with no "set to"
/// form, like `save/{id}` — kept optimistic and safe to hammer.
///
/// - [flip] changes [value] at once; the caller shows it straight away.
/// - Nothing is sent until the taps have settled for [settle]. Then a single
///   toggle goes out, and only if [value] still differs from [confirmed]: an
///   even run of taps sends nothing at all.
/// - At most one request is in flight. Taps that land meanwhile are folded
///   into the next sync, which follows once the request is back and the taps
///   have settled again.
/// - A failed toggle puts [value] back to [confirmed] and reports it through
///   [onFailed]; taps still waiting are dropped with it.
/// - [close] still sends what is owed, so a tap made just before leaving the
///   screen lands, but reports nothing more. [discard] drops it instead, for
///   when the flag is about to change some other way.
///
/// To show the flag inside an [AsyncRequestManager]'s data, make it with
/// [OptimisticToggleManager.optimisticToggle] rather than wiring [onChanged]
/// by hand.
class ConsolidatedToggle {
  ConsolidatedToggle({
    required bool value,
    required this.send,
    this.settle = const Duration(milliseconds: 400),
    this.onChanged,
    this.onConfirmed,
    this.onSettled,
    this.onIdle,
    this.onFailed,
  }) : _value = value,
       _confirmed = value;

  /// Flips the flag on the server.
  final AsyncTask<void> Function() send;

  /// How long the taps must stop for before anything is sent.
  final Duration settle;

  /// [value] changed: a tap, or a failure or [discard] putting it back.
  final void Function(bool value)? onChanged;

  /// Every toggle the server took, with the value it now holds — including
  /// steps on the way to the one the user settled on.
  final void Function(bool value)? onConfirmed;

  /// The server caught up with the user: [value] is confirmed and no more taps
  /// are waiting. Not called when the taps cancelled out and nothing was sent.
  final void Function(bool value)? onSettled;

  /// Nothing is waiting or out, and [value] is [confirmed] — after a settle,
  /// a failure, taps that cancelled out, or [discard].
  final void Function(bool value)? onIdle;

  /// A toggle failed, and [value] is back to [confirmed].
  final void Function(Failure failure, bool value)? onFailed;

  bool _value;
  bool _confirmed;
  Timer? _timer;
  Completer<void>? _inFlight;
  bool _closed = false;
  bool _discarded = false;

  /// What the user last asked for — what the UI shows.
  bool get value => _value;

  /// What the server is known to hold.
  bool get confirmed => _confirmed;

  bool get _waiting => _timer?.isActive ?? false;

  /// Whether taps are waiting to settle or a request is out.
  bool get isPending => _waiting || _inFlight != null;

  /// Flips [value] and (re)starts the wait before syncing.
  void flip() {
    if (_closed) return;
    _value = !_value;
    onChanged?.call(_value);
    _timer?.cancel();
    _timer = Timer(settle, _sync);
  }

  /// Sends anything still owed right away and stops reporting — for when the
  /// owner goes away.
  Future<void> close() {
    _closed = true;
    _timer?.cancel();
    return _sync();
  }

  /// Drops any taps still waiting — putting [value] back to [confirmed] — then
  /// sends and reports nothing more, and completes once a request already out
  /// is back, so whatever changes the flag next can't be overtaken by it.
  Future<void> discard() {
    if (!_closed) {
      _timer?.cancel();
      if (_value != _confirmed) {
        _value = _confirmed;
        onChanged?.call(_value);
      }
      onIdle?.call(_value);
    }
    _closed = true;
    _discarded = true;
    _timer?.cancel();
    return _inFlight?.future ?? Future.value();
  }

  Future<void> _sync() async {
    if (_inFlight != null || _discarded) return;
    if (_value == _confirmed) {
      if (!_closed) onIdle?.call(_value);
      return;
    }

    final inFlight = _inFlight = Completer<void>();
    final result = await send().run();
    _inFlight = null;
    inFlight.complete();

    switch (result) {
      case Right():
        _confirmed = !_confirmed;
        if (!_closed) onConfirmed?.call(_confirmed);

        // Flipped back while the request was out: once the taps have settled,
        // send again. A tap still waiting will sync on its own.
        if (_value != _confirmed) {
          if (!_waiting) await _sync();
        } else if (!_closed && !_waiting) {
          onSettled?.call(_confirmed);
          onIdle?.call(_confirmed);
        }
      case Left(value: final failure):
        if (_closed) return;
        _timer?.cancel();
        if (_value != _confirmed) {
          _value = _confirmed;
          onChanged?.call(_value);
        }
        onIdle?.call(_value);
        onFailed?.call(failure, _value);
    }
  }
}

/// Ties a [ConsolidatedToggle] to an [AsyncRequestManager]'s data.
extension OptimisticToggleManager<TWholeState, T> on AsyncRequestManager<TWholeState, T> {
  /// A [ConsolidatedToggle] whose value is shown in this manager's data, as an
  /// [OptimisticEdit] made by [show]: every tap shows at once, the change is
  /// layered over refreshes that land while the server catches up, and it is
  /// kept once the server has taken a toggle — or dropped if it took none
  /// (the taps cancelled out, or the only toggle failed).
  ///
  /// A failure is reported beside the data ([reportFailure]) unless
  /// [reportFailure] is false; [onFailed] hears it either way.
  ///
  /// [show] sets the flag to the value it is given — it must not flip it.
  ConsolidatedToggle optimisticToggle({
    required bool value,
    required AsyncTask<void> Function() send,
    required T Function(T data, bool value) show,
    Duration settle = const Duration(milliseconds: 400),
    void Function(bool value)? onConfirmed,
    void Function(bool value)? onSettled,
    void Function(Failure failure, bool value)? onFailed,
    bool reportFailure = true,
  }) {
    OptimisticEdit<T>? shown;
    var tookAny = false;

    return ConsolidatedToggle(
      value: value,
      send: send,
      settle: settle,
      onChanged: (value) {
        T apply(T data) => show(data, value);
        if (shown case final current?) {
          current.update(apply);
        } else {
          shown = edit(apply);
        }
      },
      onConfirmed: (value) {
        tookAny = true;
        onConfirmed?.call(value);
      },
      onSettled: onSettled,
      onIdle: (_) {
        if (tookAny) {
          shown?.commit();
        } else {
          shown?.revert();
        }
        shown = null;
        tookAny = false;
      },
      onFailed: (failure, value) {
        onFailed?.call(failure, value);
        if (reportFailure) this.reportFailure(failure);
      },
    );
  }
}
