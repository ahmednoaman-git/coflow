import 'package:coflow_users_v2/core/gen/l10n/app_localizations.dart';
import 'package:coflow_users_v2/core/theme/app_theme.dart';
import 'package:coflow_users_v2/core/theme/theme_extensions/app_colors.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/tabs/pricing/components/promotion_display_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('promotion offer rendering', () {
    testWidgets('package content emphasizes count in accent and leaves details secondary', (
      tester,
    ) async {
      await tester.pumpWidget(
        _TestApp(
          child: Builder(
            builder: (context) {
              return KeyedSubtree(
                key: const Key('package'),
                child: buildPackagePromotionOfferContent(
                  context,
                  tickets: const [
                    FacilityPromotionTicketLineEntity(name: 'Class Pass', count: 2),
                    FacilityPromotionTicketLineEntity(name: 'Open Gym', count: 1),
                  ],
                  accentColor: AppColors.light.skyBluePrimary,
                ),
              );
            },
          ),
        ),
      );

      final richText = tester.widget<RichText>(
        find.descendant(
          of: find.byKey(const Key('package')),
          matching: find.byType(RichText),
        ),
      );
      final spans = _collectTextSpans(richText.text);

      expect(spans[0].text, '2x ');
      expect(spans[0].style?.color, AppColors.light.skyBluePrimary);
      expect(spans[0].style?.fontWeight, FontWeight.w700);

      expect(spans[1].text, 'Class Pass');
      expect(spans[1].style?.color, AppColors.light.textSecondary);
      expect(spans[1].style?.fontWeight, FontWeight.w400);

      expect(spans[2].text, ' + ');
      expect(spans[2].style?.color, AppColors.light.textSecondary);
      expect(spans[2].style?.fontWeight, FontWeight.w400);

      expect(spans[3].text, '1x ');
      expect(spans[3].style?.color, AppColors.light.skyBluePrimary);
      expect(spans[3].style?.fontWeight, FontWeight.w700);
    });

    testWidgets('buy get content uses accent labels and primary values', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: Builder(
            builder: (context) {
              return KeyedSubtree(
                key: const Key('buyGet'),
                child: buildBuyGetPromotionOfferContent(
                  context,
                  buyTickets: const [
                    FacilityPromotionTicketLineEntity(name: 'Workshop Pass', count: 3),
                  ],
                  reward: FacilityPromotionRewardEntity.coupons(
                    coupons: const [
                      FacilityPromotionCouponEntity(
                        discountRatio: 20,
                        appliesOn: FacilityPromotionAppliesOn.tickets,
                      ),
                    ],
                  ),
                  accentColor: AppColors.light.skyBluePrimary,
                ),
              );
            },
          ),
        ),
      );

      final richTexts = tester
          .widgetList<RichText>(
            find.descendant(
              of: find.byKey(const Key('buyGet')),
              matching: find.byType(RichText),
            ),
          )
          .toList();
      final buySpans = _collectTextSpans(richTexts.first.text);
      final getSpans = _collectTextSpans(richTexts.last.text);

      expect(buySpans[0].text, 'Buy ');
      expect(buySpans[0].style?.color, AppColors.light.skyBluePrimary);
      expect(buySpans[0].style?.fontWeight, FontWeight.w700);

      expect(buySpans[1].text, '3x ');
      expect(buySpans[1].style?.color, AppColors.light.textPrimary);
      expect(buySpans[1].style?.fontWeight, FontWeight.w700);

      expect(buySpans[2].text, 'Workshop Pass');
      expect(buySpans[2].style?.color, AppColors.light.textSecondary);
      expect(buySpans[2].style?.fontWeight, FontWeight.w400);

      expect(getSpans[0].text, 'Get ');
      expect(getSpans[0].style?.color, AppColors.light.skyBluePrimary);
      expect(getSpans[0].style?.fontWeight, FontWeight.w700);

      expect(getSpans[1].text, '20% ');
      expect(getSpans[1].style?.color, AppColors.light.textPrimary);
      expect(getSpans[1].style?.fontWeight, FontWeight.w700);

      expect(getSpans[2].text, 'Tickets');
      expect(getSpans[2].style?.color, AppColors.light.textSecondary);
      expect(getSpans[2].style?.fontWeight, FontWeight.w400);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light,
      home: Scaffold(body: child),
    );
  }
}

List<TextSpan> _collectTextSpans(InlineSpan span) {
  final spans = <TextSpan>[];

  void visit(InlineSpan current) {
    switch (current) {
      case TextSpan(text: final text?, style: final style):
        spans.add(TextSpan(text: text, style: style));
        final children = current.children;
        if (children != null) {
          for (final child in children) {
            visit(child);
          }
        }
      case TextSpan(children: final children?):
        for (final child in children) {
          visit(child);
        }
      case WidgetSpan():
        break;
    }
  }

  visit(span);
  return spans;
}
