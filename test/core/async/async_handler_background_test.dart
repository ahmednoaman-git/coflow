import 'dart:async';

import 'package:coflow_users_v2/core/async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const _offline = NetworkFailure('offline');

class _ListCubit extends Cubit<AsyncState<List<int>>> {
  _ListCubit() : super(const AsyncState.idle()) {
    manager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state,
        getWholeState: () => state,
        setWholeState: (_, partial) => partial,
      ),
      emit: emit,
      defaultRequest: TaskEither(() => gate?.future ?? Future.value(next)),
      refreshInBackground: true,
    );
  }

  late final AsyncRequestManager<AsyncState<List<int>>, List<int>> manager;
  Either<Failure, List<int>> next = const Right([1, 2]);

  /// When set, the next fetch waits for it instead of answering [next].
  Completer<Either<Failure, List<int>>>? gate;
}

void main() {
  late _ListCubit cubit;
  late List<List<int>> successes;
  late List<Failure> errors;
  late List<Failure> backgroundErrors;

  Future<void> pumpHandler(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: AsyncHandler<_ListCubit, AsyncState<List<int>>, List<int>>(
            requestManagerGetter: (cubit) => cubit.manager,
            loadingBuilder: (_) => const Text('loading'),
            successBuilder: (_, items) => Text('items ${items.join(',')}'),
            errorBuilder: (_, failure) => const Text('error view'),
            onSuccess: (_, items) => successes.add(items),
            onError: (_, failure) => errors.add(failure),
            onBackgroundError: (_, failure) => backgroundErrors.add(failure),
          ),
        ),
      ),
    );
  }

  setUp(() {
    cubit = _ListCubit();
    successes = [];
    errors = [];
    backgroundErrors = [];
  });

  tearDown(() => cubit.close());

  testWidgets('a background refresh keeps the data up and reports the new data once', (
    tester,
  ) async {
    await pumpHandler(tester);
    await tester.runAsync(cubit.manager.execute);
    await tester.pump();
    expect(find.text('items 1,2'), findsOneWidget);
    expect(successes, [
      [1, 2],
    ]);

    final gate = cubit.gate = Completer();
    final refresh = cubit.manager.refresh();
    await tester.pump();
    await tester.pump();
    expect(cubit.manager.isRefreshing, isTrue);
    expect(find.text('items 1,2'), findsOneWidget, reason: 'no loading state');
    expect(find.text('loading'), findsNothing);

    gate.complete(const Right([3]));
    await tester.runAsync(() => refresh);
    await tester.pump();
    expect(find.text('items 3'), findsOneWidget);
    expect(successes, [
      [1, 2],
      [3],
    ]);
  });

  testWidgets('a failed background refresh keeps the data and calls onBackgroundError only', (
    tester,
  ) async {
    await pumpHandler(tester);
    await tester.runAsync(cubit.manager.execute);

    cubit.next = const Left(_offline);
    await tester.runAsync(cubit.manager.refresh);
    await tester.pump();

    expect(find.text('items 1,2'), findsOneWidget);
    expect(find.text('error view'), findsNothing);
    expect(backgroundErrors, [_offline]);
    expect(errors, isEmpty);
  });

  testWidgets('an optimistic edit re-renders without calling onSuccess', (tester) async {
    await pumpHandler(tester);
    await tester.runAsync(cubit.manager.execute);
    await tester.pump();
    successes.clear();

    final call = Completer<Either<Failure, void>>();
    final mutation = cubit.manager.mutate(
      TaskEither(() => call.future),
      apply: (items) => [...items, 9],
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('items 1,2,9'), findsOneWidget);

    call.complete(const Left(_offline));
    await tester.runAsync(() => mutation);
    await tester.pump();

    expect(find.text('items 1,2'), findsOneWidget, reason: 'rolled back');
    expect(backgroundErrors, [_offline]);
    expect(successes, isEmpty);
  });

  testWidgets('a first load that fails still goes to the error view and onError', (tester) async {
    cubit.next = const Left(_offline);
    await pumpHandler(tester);
    await tester.runAsync(cubit.manager.execute);
    await tester.pump();

    expect(find.text('error view'), findsOneWidget);
    expect(errors, [_offline]);
    expect(backgroundErrors, isEmpty);
  });
}
