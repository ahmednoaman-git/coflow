import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solar_icons/solar_icons.dart';

Widget _app(Widget child, {ThemeData? theme, Locale locale = const Locale('en')}) => MaterialApp(
  theme: theme ?? AppTheme.light,
  locale: locale,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: Center(child: child)),
);

void main() {
  group('ImageFallback.initialsOf', () {
    test('takes the first and last word', () {
      expect(ImageFallback.initialsOf('Ahmed Osama Noaman'), 'AN');
      expect(ImageFallback.initialsOf('rubye schinner'), 'RS');
    });

    test('a single word gives a single initial', () {
      expect(ImageFallback.initialsOf('coflow'), 'C');
    });

    test('max 1 keeps only the first initial', () {
      expect(ImageFallback.initialsOf('Earth - GO', max: 1), 'E');
    });

    test('skips words and leading characters without a letter or digit', () {
      expect(ImageFallback.initialsOf('Earth - GO'), 'EG');
      expect(ImageFallback.initialsOf('(Sky) club'), 'SC');
      expect(ImageFallback.initialsOf('#1 gym'), '1G');
    });

    test('is empty when the name is null, blank or has no letters', () {
      expect(ImageFallback.initialsOf(null), '');
      expect(ImageFallback.initialsOf(''), '');
      expect(ImageFallback.initialsOf('   '), '');
      expect(ImageFallback.initialsOf('💪 -'), '');
    });

    test('keeps Arabic initials from joining', () {
      expect(ImageFallback.initialsOf('محمد علي'), 'م‌ع');
      expect(ImageFallback.initialsOf('نادي'), 'ن');
    });
  });

  group('ImageFallbackView', () {
    testWidgets('person shows two initials', (tester) async {
      await tester.pumpWidget(
        _app(
          const ImageFallbackView(
            fallback: ImageFallback.person('Ahmed Noaman'),
            width: 52,
            height: 52,
          ),
        ),
      );
      expect(find.text('AN'), findsOneWidget);
    });

    testWidgets('person drops to one initial in a compact box', (tester) async {
      await tester.pumpWidget(
        _app(
          const ImageFallbackView(
            fallback: ImageFallback.person('Ahmed Noaman'),
            width: 22,
            height: 22,
          ),
        ),
      );
      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('person without a name shows the person glyph, or the given icon', (tester) async {
      await tester.pumpWidget(
        _app(const ImageFallbackView(fallback: ImageFallback.person(''), width: 52, height: 52)),
      );
      expect(find.byIcon(SolarIconsOutline.user), findsOneWidget);
      expect(find.byType(Text), findsNothing);

      await tester.pumpWidget(
        _app(
          const ImageFallbackView(
            fallback: ImageFallback.person(null, icon: SolarIconsOutline.userCircle),
            width: 52,
            height: 52,
          ),
        ),
      );
      expect(find.byIcon(SolarIconsOutline.userCircle), findsOneWidget);
    });

    testWidgets('business shows a single initial', (tester) async {
      await tester.pumpWidget(
        _app(
          const ImageFallbackView(
            fallback: ImageFallback.business('Earth - GO'),
            width: 56,
            height: 56,
          ),
        ),
      );
      expect(find.text('E'), findsOneWidget);
    });

    testWidgets('business without a name shows the Coflow mark', (tester) async {
      await tester.pumpWidget(
        _app(
          const ImageFallbackView(fallback: ImageFallback.business('  '), width: 56, height: 56),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('icon shows its glyph', (tester) async {
      await tester.pumpWidget(
        _app(
          const ImageFallbackView(
            fallback: ImageFallback.icon(SolarIconsOutline.stars),
            width: 30,
            height: 30,
          ),
        ),
      );
      expect(find.byIcon(SolarIconsOutline.stars), findsOneWidget);
    });

    testWidgets('cover shows the Coflow mark, centred in a compact box', (tester) async {
      await tester.pumpWidget(
        _app(const ImageFallbackView(fallback: ImageFallback.cover(), width: 180, height: 240)),
      );
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(PositionedDirectional), findsOneWidget);

      await tester.pumpWidget(
        _app(const ImageFallbackView(fallback: ImageFallback.cover(), width: 56, height: 56)),
      );
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(PositionedDirectional), findsNothing);
    });

    testWidgets('every variant renders in dark mode and RTL', (tester) async {
      const fallbacks = [
        ImageFallback.cover(),
        ImageFallback.person('محمد علي'),
        ImageFallback.business('نادي'),
        ImageFallback.icon(SolarIconsOutline.stars),
      ];
      for (final fallback in fallbacks) {
        await tester.pumpWidget(
          _app(
            ImageFallbackView(fallback: fallback, width: 120, height: 120),
            theme: AppTheme.dark,
            locale: const Locale('ar'),
          ),
        );
        expect(tester.takeException(), isNull);
        expect(tester.getSize(find.byType(ImageFallbackView)), const Size(120, 120));
      }
    });
  });

  group('ShimmerImage', () {
    testWidgets('a missing URL shows the fallback in the image box', (tester) async {
      for (final url in [null, '', '  ']) {
        await tester.pumpWidget(
          _app(
            ShimmerImage(
              imageUrl: url,
              width: 64,
              height: 48,
              borderRadius: 12,
              fallback: const ImageFallback.business('Coflow'),
            ),
          ),
        );
        expect(find.text('C'), findsOneWidget);
        expect(tester.getSize(find.byType(ShimmerImage)), const Size(64, 48));
      }
    });

    testWidgets('defaults to a cover fallback', (tester) async {
      await tester.pumpWidget(_app(const ShimmerImage(width: 100, height: 100)));
      final view = tester.widget<ImageFallbackView>(find.byType(ImageFallbackView));
      expect(view.fallback, isA<CoverImageFallback>());
    });

    testWidgets('errorBuilder replaces the fallback, sized to the image box', (tester) async {
      await tester.pumpWidget(
        _app(
          ShimmerImage(
            width: 40,
            height: 40,
            errorBuilder: (_) => const ColoredBox(key: Key('custom'), color: Color(0x00000000)),
          ),
        ),
      );
      expect(find.byType(ImageFallbackView), findsNothing);
      expect(tester.getSize(find.byKey(const Key('custom'))), const Size(40, 40));
    });
  });
}
