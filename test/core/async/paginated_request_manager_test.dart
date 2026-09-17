import 'dart:async';

import 'package:coflow_users_v2/core/async/async_request_manager.dart';
import 'package:coflow_users_v2/core/async/async_state.dart';
import 'package:coflow_users_v2/core/async/failure.dart';
import 'package:coflow_users_v2/core/async/paginated_request_manager.dart';
import 'package:coflow_users_v2/core/async/types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

typedef _Page = ({List<int> items, int? next});
typedef _State = ({AsyncState<_Page> page, AsyncState<void> next});

class _Harness {
  _Harness({bool autoExecute = false}) {
    manager = PaginatedRequestManager<_State, _Page>(
      accessor: accessor,
      nextPageAccessor: (
        getWholeState: () => state,
        getPartialState: (state) => state.next,
        setWholeState: (state, next) => (page: state.page, next: next),
      ),
      emit: (next) {
        state = next;
        emissions++;
      },
      requestPage: request,
      nextPageOf: (data) => data.next,
      merge: (current, next) => (items: [...current.items, ...next.items], next: next.next),
      autoExecute: autoExecute,
    );
  }

  _State state = (page: const AsyncState.idle(), next: const AsyncState.idle());
  int emissions = 0;
  final calls = <({int page, String query})>[];
  final pending = <Completer<Result<_Page>>>[];
  late final PaginatedRequestManager<_State, _Page> manager;

  AsyncStateAccessor<_State, _Page> get accessor => (
    getWholeState: () => state,
    getPartialState: (state) => state.page,
    setWholeState: (state, page) => (page: page, next: state.next),
  );

  AsyncTask<_Page> request(int page, {String query = 'all'}) {
    calls.add((page: page, query: query));
    final completion = Completer<Result<_Page>>();
    pending.add(completion);
    return TaskEither(() => completion.future);
  }

  void succeed(int request, List<int> items, {int? next}) {
    pending[request].complete(Right((items: items, next: next)));
  }

  void fail(int request) {
    pending[request].complete(const Left(NetworkFailure('offline')));
  }

  Future<void> firstPage() async {
    final request = manager.execute();
    succeed(0, [1, 2], next: 2);
    await request;
  }
}

void main() {
  test(
    'appends items and uses next-page metadata without replacing content during loading',
    () async {
      final h = _Harness();
      // Existing handler references must keep reading current state after execute.
      final firstView = h.manager.firstPageManager;
      final appendView = h.manager.nextPageManager;
      await h.firstPage();
      final append = h.manager.loadMore();
      expect(firstView.data?.items, [1, 2]);
      expect(appendView.isLoading, isTrue);
      expect(h.manager.hasNextPage, isTrue);

      h.succeed(1, [3], next: 5);
      await append;
    expect(firstView.data?.items, [1, 2, 3]);
    expect(firstView.data?.next, 5);
      expect(appendView.isSuccess, isTrue);

      final last = h.manager.loadMore();
      expect(h.calls.last.page, 5);
      h.succeed(2, [4]);
      await last;
      expect(h.manager.data?.items, [1, 2, 3, 4]);
      expect(h.manager.hasNextPage, isFalse);
      await h.manager.loadMore();
      expect(h.calls.length, 3);
    },
  );

  test('ignores appends before first-page success and duplicate in-flight requests', () async {
    final h = _Harness();
    await h.manager.loadMore();
    expect(h.calls, isEmpty);
    final first = h.manager.execute();
    await h.manager.loadMore();
    expect(h.calls.length, 1);
    h.succeed(0, [1], next: 2);
    await first;

    final append = h.manager.loadMore();
    await h.manager.loadMore();
    expect(h.calls.length, 2);
    h.succeed(1, [2]);
    await append;
  });

  test('append failure keeps loaded data and retries exactly the failed page', () async {
    final h = _Harness();
    await h.firstPage();
    final append = h.manager.loadMore();
    h.fail(1);
    await append;
    expect(h.manager.data?.items, [1, 2]);
    expect(h.manager.hasNextPage, isTrue);
    expect(h.manager.nextPageManager.failure, isA<NetworkFailure>());

    final retry = h.manager.loadMore();
    expect(h.calls.map((call) => call.page), [1, 2, 2]);
    h.succeed(2, [3]);
    await retry;
    expect(h.manager.data?.items, [1, 2, 3]);
    expect(h.manager.nextPageManager.isSuccess, isTrue);
  });

  test('first-page failure can refresh page one', () async {
    final h = _Harness();
    final first = h.manager.execute();
    h.fail(0);
    await first;
    expect(h.manager.firstPageManager.failure, isA<NetworkFailure>());
    await h.manager.loadMore();
    expect(h.calls.length, 1);
    final retry = h.manager.refresh();
    h.succeed(1, [5]);
    await retry;
    expect(h.manager.data?.items, [5]);
    expect(h.calls.map((call) => call.page), [1, 1]);
  });

  for (final staleFails in [false, true]) {
    test('new filters suppress stale first-page ${staleFails ? 'failure' : 'success'}', () async {
      final h = _Harness();
      final old = h.manager.execute();
      final filtered = h.manager.execute(requestPage: (page) => h.request(page, query: 'tag'));
      h.succeed(1, [20], next: 2);
      await filtered;
      final emissions = h.emissions;
      if (staleFails) {
        h.fail(0);
      } else {
        h.succeed(0, [1], next: 2);
      }
      await old;
      expect(h.emissions, emissions);
      expect(h.manager.data?.items, [20]);

      final append = h.manager.loadMore();
      expect(h.calls.last, (page: 2, query: 'tag'));
      h.succeed(2, [21]);
      await append;
      expect(h.manager.data?.items, [20, 21]);
    });

    test('refresh invalidates stale append ${staleFails ? 'failure' : 'success'}', () async {
      final h = _Harness();
      await h.firstPage();
      final oldAppend = h.manager.loadMore();
      final refresh = h.manager.refresh();
      expect(h.state.next.isIdle, isTrue);
      h.succeed(2, [10], next: 2);
      await refresh;
      final newAppend = h.manager.loadMore();
      final emissions = h.emissions;
      if (staleFails) {
        h.fail(1);
      } else {
        h.succeed(1, [3]);
      }
      await oldAppend;
      expect(h.emissions, emissions);
      expect(h.manager.isLoadingMore, isTrue);
      await h.manager.loadMore();
      expect(h.calls.length, 4);
      h.succeed(3, [11]);
      await newAppend;
      expect(h.manager.data?.items, [10, 11]);
    });
  }

  test('reset clears both states and suppresses pending response', () async {
    final h = _Harness();
    await h.firstPage();
    final append = h.manager.loadMore();
    h.manager.reset();
    final emissions = h.emissions;
    h.succeed(1, [3]);
    await append;
    expect(h.state.page.isIdle, isTrue);
    expect(h.state.next.isIdle, isTrue);
    expect(h.emissions, emissions);
  });

  test('dispose suppresses pending first-page and future requests', () async {
    final h = _Harness();
    final first = h.manager.execute();
    h.manager.dispose();
    final emissions = h.emissions;
    h.succeed(0, [1], next: 2);
    await first;
    await h.manager.execute();
    await h.manager.refresh();
    await h.manager.loadMore();
    h.manager.reset();
    expect(h.emissions, emissions);
    expect(h.calls.length, 1);
  });

  test('dispose suppresses pending append success', () async {
    final h = _Harness();
    await h.firstPage();
    final append = h.manager.loadMore();
    h.manager.dispose();
    final emissions = h.emissions;
    h.succeed(1, [3]);
    await append;
    expect(h.emissions, emissions);
    expect(h.manager.data?.items, [1, 2]);
  });

  test('disposing before scheduled autoExecute avoids any request', () async {
    final h = _Harness(autoExecute: true);
    h.manager.dispose();
    await Future<void>.delayed(Duration.zero);
    expect(h.calls, isEmpty);
    expect(h.emissions, 0);
  });
}
