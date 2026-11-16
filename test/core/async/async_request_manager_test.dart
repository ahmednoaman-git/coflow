import 'dart:async';

import 'package:coflow_users_v2/core/async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const _offline = NetworkFailure('offline');

/// A server whose list can change between fetches; [gate], when set, holds the
/// next call open until completed, and [fail] makes calls fail.
class _Server {
  List<int> items = [1, 2, 3];
  int fetches = 0;
  bool fail = false;
  Completer<void>? gate;

  AsyncTask<List<int>> fetch() => TaskEither(() async {
    fetches++;
    final snapshot = List.of(items);
    final held = gate;
    gate = null;
    await held?.future;
    return fail ? const Left(_offline) : Right(snapshot);
  });
}

/// A mutation endpoint answered by hand.
class _Call {
  final _result = Completer<Result<void>>();
  late final AsyncTask<void> task = TaskEither(() => _result.future);

  void succeed() => _result.complete(const Right(null));
  void fail() => _result.complete(const Left(_offline));
}

/// The manager under test, over a whole state that is just its request.
class _Harness {
  _Harness({bool refreshInBackground = false}) {
    manager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state,
        getWholeState: () => state,
        setWholeState: (_, partial) => partial,
      ),
      emit: (next) {
        state = next;
        history.add(next);
      },
      defaultRequest: server.fetch(),
      refreshInBackground: refreshInBackground,
    );
  }

  final server = _Server();
  AsyncState<List<int>> state = const AsyncState.idle();
  final history = <AsyncState<List<int>>>[];
  late final AsyncRequestManager<AsyncState<List<int>>, List<int>> manager;

  List<int>? get data => manager.data;

  Future<void> load() async {
    await manager.execute();
    history.clear();
  }
}

List<int> _without(List<int> items, int id) => [
  for (final item in items)
    if (item != id) item,
];

void main() {
  group('background refresh', () {
    test('keeps the data on screen while refreshing, then swaps in the new data', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.load();

      final gate = Completer<void>();
      harness.server
        ..items = [4, 5]
        ..gate = gate;
      final refresh = harness.manager.refresh();

      expect(harness.state, const AsyncState.success([1, 2, 3], isRefreshing: true));
      expect(harness.manager.isRefreshing, isTrue);
      expect(harness.manager.isLoading, isFalse);

      await pumpEventQueue();
      expect(harness.data, [1, 2, 3], reason: 'still waiting on the server');

      gate.complete();
      await refresh;

      expect(harness.state, const AsyncState.success([4, 5]));
      expect(harness.history.whereType<AsyncLoading<List<int>>>(), isEmpty);
    });

    test('a failed refresh keeps the old data and reports the failure beside it', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.load();

      harness.server.fail = true;
      await harness.manager.refresh();

      expect(harness.state, const AsyncState.success([1, 2, 3], failure: _offline));
      expect(harness.manager.isSuccess, isTrue);
      expect(harness.manager.isError, isFalse);
      expect(harness.history.whereType<AsyncLoading<List<int>>>(), isEmpty);
    });

    test('the first load still goes through loading', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.manager.execute();

      expect(harness.history.first, isA<AsyncLoading<List<int>>>());
      expect(harness.state, const AsyncState.success([1, 2, 3]));
    });

    test('without the option a refresh drops back to loading', () async {
      final harness = _Harness();
      await harness.load();

      await harness.manager.refresh();

      expect(harness.history.first, isA<AsyncLoading<List<int>>>());
    });

    test('a refresh while one is out joins it rather than sending another', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.load();
      final fetches = harness.server.fetches;

      await Future.wait([harness.manager.refresh(), harness.manager.refresh()]);

      expect(harness.server.fetches, fetches + 1);
    });

    test('a response overtaken by a newer request is ignored', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.load();

      final slow = Completer<Result<List<int>>>();
      final first = harness.manager.execute(TaskEither(() => slow.future));
      await harness.manager.execute(TaskEither.right([9]));
      slow.complete(const Right([7]));
      await first;

      expect(harness.state, const AsyncState.success([9]));
    });
  });

  group('optimistic updates', () {
    test('mutate shows the change at once and keeps it when the request succeeds', () async {
      final harness = _Harness();
      await harness.load();

      final call = _Call();
      final mutation = harness.manager.mutate(
        call.task,
        apply: (items) => _without(items, 2),
      );
      expect(harness.data, [1, 3]);

      call.succeed();
      expect((await mutation).isRight(), isTrue);
      expect(harness.data, [1, 3]);
      expect(harness.state, const AsyncState.success([1, 3]));
    });

    test('mutate rolls the change back and reports the failure when the request fails', () async {
      final harness = _Harness();
      await harness.load();

      final call = _Call();
      final mutation = harness.manager.mutate(
        call.task,
        apply: (items) => _without(items, 2),
      );
      expect(harness.data, [1, 3]);

      call.fail();
      expect((await mutation).isLeft(), isTrue);
      expect(harness.state, const AsyncState.success([1, 2, 3], failure: _offline));
    });

    test('rolling one mutation back leaves the others in place', () async {
      final harness = _Harness();
      await harness.load();

      final first = _Call();
      final second = _Call();
      final mutations = [
        harness.manager.mutate(first.task, apply: (items) => _without(items, 1)),
        harness.manager.mutate(second.task, apply: (items) => _without(items, 3)),
      ];
      expect(harness.data, [2]);

      first.fail();
      second.succeed();
      await Future.wait(mutations);

      expect(harness.data, [1, 2]);
    });

    test('a refresh that lands while a mutation is out keeps the change', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.load();

      final call = _Call();
      final mutation = harness.manager.mutate(call.task, apply: (items) => _without(items, 2));

      // The server hasn't taken the change yet, and has gained an item.
      harness.server.items = [1, 2, 3, 4];
      await harness.manager.refresh();
      expect(harness.data, [1, 3, 4]);

      call.fail();
      await mutation;
      expect(harness.data, [1, 2, 3, 4], reason: 'rolled back onto the fresh data');
    });

    test('a change the server took stays over a refresh sent before it did', () async {
      final harness = _Harness(refreshInBackground: true);
      await harness.load();

      final call = _Call();
      final mutation = harness.manager.mutate(call.task, apply: (items) => _without(items, 2));

      // Read before the server applied the change, answered after.
      final gate = harness.server.gate = Completer();
      final refresh = harness.manager.refresh();
      call.succeed();
      await mutation;
      gate.complete();
      await refresh;

      expect(harness.data, [1, 3]);

      // A later read reflects what the server holds again.
      harness.server.items = [1, 3, 5];
      await harness.manager.refresh();
      expect(harness.data, [1, 3, 5]);
    });

    test('a change made before the data lands is applied to it', () async {
      final harness = _Harness();
      final call = _Call();

      final load = harness.manager.execute();
      final mutation = harness.manager.mutate(call.task, apply: (items) => _without(items, 1));
      expect(harness.manager.isLoading, isTrue, reason: 'nothing to edit yet');

      await load;
      expect(harness.data, [2, 3]);

      call.succeed();
      await mutation;
      expect(harness.data, [2, 3]);
    });

    test('the same failure reported twice is heard twice', () async {
      final harness = _Harness();
      await harness.load();

      harness.manager
        ..reportFailure(_offline)
        ..reportFailure(_offline);

      final reports = harness.history.where(
        (state) => state is AsyncSuccess<List<int>> && state.failure != null,
      );
      expect(reports, hasLength(2));
      for (var i = 1; i < harness.history.length; i++) {
        expect(harness.history[i], isNot(harness.history[i - 1]));
      }
    });
  });

  group('optimisticToggle', () {
    const settle = Duration(milliseconds: 20);
    Future<void> settled() => Future<void>.delayed(settle * 3);

    late _Harness harness;
    late bool flagOnServer;
    late bool failToggle;
    late int toggles;

    /// Data is the list; the flag shows as a trailing 0.
    List<int> show(List<int> items, bool on) => [..._without(items, 0), if (on) 0];

    ConsolidatedToggle open() => harness.manager.optimisticToggle(
      value: false,
      settle: settle,
      send: () => TaskEither(() async {
        toggles++;
        if (failToggle) return const Left(_offline);
        flagOnServer = !flagOnServer;
        return const Right(null);
      }),
      show: show,
    );

    setUp(() async {
      harness = _Harness(refreshInBackground: true);
      flagOnServer = false;
      failToggle = false;
      toggles = 0;
      await harness.load();
    });

    test('shows a flip at once and keeps it once the server takes it', () async {
      final toggle = open()..flip();
      expect(harness.data, [1, 2, 3, 0]);

      await settled();
      expect(toggles, 1);
      expect(toggle.isPending, isFalse);
      expect(harness.data, [1, 2, 3, 0]);
    });

    test('puts the flag back and reports when the toggle fails', () async {
      failToggle = true;
      open().flip();
      expect(harness.data, [1, 2, 3, 0]);

      await settled();
      expect(harness.state, const AsyncState.success([1, 2, 3], failure: _offline));
    });

    test('taps that cancel out leave the data as the server sent it', () async {
      open()
        ..flip()
        ..flip();
      await settled();

      expect(toggles, 0);
      // Nothing is left layered over the data: a refresh shows the server's.
      harness.server.items = [7];
      await harness.manager.refresh();
      expect(harness.data, [7]);
    });

    test('a refresh while the taps settle keeps the flag as tapped', () async {
      open().flip();
      harness.server.items = [1, 2];
      await harness.manager.refresh();

      expect(harness.data, [1, 2, 0]);
    });
  });
}
