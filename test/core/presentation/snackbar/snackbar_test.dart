import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SnackbarCubit', () {
    late SnackbarCubit cubit;

    setUp(() => cubit = SnackbarCubit());
    tearDown(() => cubit.close());

    test('shows the first snackbar and queues the rest in order', () {
      cubit
        ..show('a', SnackbarType.info)
        ..show('b', SnackbarType.error);

      expect(cubit.state.current?.message, 'a');
      expect(cubit.state.queue.map((i) => i.message), ['b']);

      cubit.dismiss(cubit.state.current!.id);
      expect(cubit.state.current?.message, 'b');
      expect(cubit.state.queue, isEmpty);
    });

    test('skips a message that is already showing or queued', () {
      cubit
        ..show('same', SnackbarType.error)
        ..show('same', SnackbarType.error)
        ..show('same', SnackbarType.success);

      expect(cubit.state.queue.map((i) => i.type), [SnackbarType.success]);
    });

    test('drops the oldest pending snackbar past the queue cap', () {
      cubit
        ..show('a', SnackbarType.info)
        ..show('b', SnackbarType.info)
        ..show('c', SnackbarType.info)
        ..show('d', SnackbarType.info);

      expect(cubit.state.queue.map((i) => i.message), ['c', 'd']);
    });

    test('ignores a stale dismiss for a snackbar no longer on screen', () {
      cubit.show('a', SnackbarType.info);
      final staleId = cubit.state.current!.id;
      cubit
        ..dismiss(staleId)
        ..show('b', SnackbarType.info)
        ..dismiss(staleId);

      expect(cubit.state.current?.message, 'b');
    });
  });

  group('SnackbarHost', () {
    Future<void> pumpHost(WidgetTester tester) => tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        builder: (context, child) => SnackbarHost(child: child!),
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () => context.showErrorSnackBar('Something broke'),
                child: const Text('raise'),
              ),
            ),
          ),
        ),
      ),
    );

    testWidgets('shows a raised snackbar and auto-dismisses it', (tester) async {
      await pumpHost(tester);

      await tester.tap(find.text('raise'));
      await tester.pumpAndSettle();
      expect(find.text('Something broke'), findsOneWidget);

      await tester.pump(SnackbarCubit.defaultDuration);
      await tester.pumpAndSettle();
      expect(find.text('Something broke'), findsNothing);
    });

    testWidgets('dismisses on tap', (tester) async {
      await pumpHost(tester);

      await tester.tap(find.text('raise'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Something broke'));
      await tester.pumpAndSettle();

      expect(find.text('Something broke'), findsNothing);
    });

    testWidgets('dismisses on an upward swipe', (tester) async {
      await pumpHost(tester);

      await tester.tap(find.text('raise'));
      await tester.pumpAndSettle();
      await tester.drag(find.text('Something broke'), const Offset(0, -80));
      await tester.pumpAndSettle();

      expect(find.text('Something broke'), findsNothing);
    });
  });
}
