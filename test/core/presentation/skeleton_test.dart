import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class _State {
  const _State(this.request);
  final AsyncState<String> request;
}

class _Cubit extends Cubit<_State> {
  _Cubit() : super(const _State(AsyncState.idle())) {
    manager = AsyncRequestManager(
      accessor: (
        getPartialState: (state) => state.request,
        getWholeState: () => state,
        setWholeState: (_, partial) => _State(partial),
      ),
      emit: emit,
    );
  }

  late final AsyncRequestManager<_State, String> manager;
}

Widget _app(Widget child) => MaterialApp(
  theme: AppTheme.light,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: child),
);

void main() {
  testWidgets('SkeletonText takes the height of the text it stands for', (tester) async {
    late TextStyle style;
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (context) {
            style = context.typography.medium14;
            return Skeleton(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SkeletonText(key: const Key('bone'), style: style, lines: 2),
                  Text('Line one\nLine two', key: const Key('text'), style: style),
                ],
              ),
            );
          },
        ),
      ),
    );
    expect(
      tester.getSize(find.byKey(const Key('bone'))).height,
      tester.getSize(find.byKey(const Key('text'))).height,
    );
    // The sweep keeps going while it's on screen.
    expect(tester.hasRunningAnimations, isTrue);
  });

  testWidgets('AsyncHandler shows the skeleton, then fades the result in', (tester) async {
    final cubit = _Cubit();
    addTearDown(cubit.close);

    await tester.pumpWidget(
      _app(
        BlocProvider.value(
          value: cubit,
          child: AsyncHandler<_Cubit, _State, String>(
            requestManagerGetter: (cubit) => cubit.manager,
            skeletonBuilder: (_) => const Skeleton(child: SkeletonBox(width: 40, height: 40)),
            successBuilder: (_, data) => Text(data),
          ),
        ),
      ),
    );
    expect(find.byType(SkeletonBox), findsOneWidget);

    await cubit.manager.execute(TaskEither.right('Loaded'));
    await tester.pump();
    // Mid-fade, both are on screen.
    await tester.pump(const Duration(milliseconds: 150));
    expect(find.text('Loaded'), findsOneWidget);
    expect(find.byType(SkeletonBox), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(SkeletonBox), findsNothing);
  });

  testWidgets('in sliver mode the skeleton cross-fades with the result', (tester) async {
    final cubit = _Cubit();
    addTearDown(cubit.close);

    await tester.pumpWidget(
      _app(
        BlocProvider.value(
          value: cubit,
          child: CustomScrollView(
            slivers: [
              AsyncHandler<_Cubit, _State, String>(
                requestManagerGetter: (cubit) => cubit.manager,
                sliver: true,
                skeletonBuilder: (_) => const SliverToBoxAdapter(
                  child: Skeleton(child: SkeletonBox(height: 40)),
                ),
                successBuilder: (_, data) => SliverToBoxAdapter(child: Text(data)),
              ),
            ],
          ),
        ),
      ),
    );
    expect(find.byType(SkeletonBox), findsOneWidget);

    await cubit.manager.execute(TaskEither.right('Loaded'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 150));
    expect(find.text('Loaded'), findsOneWidget);
    expect(find.byType(SkeletonBox), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(SkeletonBox), findsNothing);
    expect(find.text('Loaded'), findsOneWidget);
  });
}
