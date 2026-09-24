import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/purchase/domain/domain.dart';
import 'package:coflow_users_v2/features/purchase/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _accent = Color(0xFFFF9F1C);

// Live quote: two Bungee Tickets (250 with a 10% offer) and one 100 add-on.
const _quote = PurchaseQuoteEntity(
  totalPrice: 650,
  finalPrice: 650,
  couponDiscount: 0,
  addOnsPrice: 200,
  currency: 'EGP',
);

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
      home: Scaffold(
        body: SizedBox(width: 375, child: SingleChildScrollView(child: child)),
      ),
    );
  }
}

void main() {
  group('PurchaseInvoiceSection', () {
    testWidgets('lists the item and each add-on with whole-number prices', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: Builder(
            builder: (context) => PurchaseInvoiceSection(
              invoice: PurchaseInvoiceCalculator.fromQuote(
                quote: _quote,
                currency: 'EGP',
                itemLabel: 'Bungee Ticket',
                quantity: 2,
                addOns: const [(name: 'Photography', unitPrice: 100)],
                addOnLabel: context.l10n.purchase_addOnLine,
                addOnsLabel: context.l10n.facilityDetails_addOns,
              ),
              accentColor: _accent,
            ),
          ),
        ),
      );

      expect(find.text('2x Bungee Ticket', findRichText: true), findsOneWidget);
      expect(find.text('+ EGP 450'), findsOneWidget);
      expect(find.text('2x Add-On: Photography', findRichText: true), findsOneWidget);
      expect(find.text('+ EGP 200'), findsOneWidget);
      expect(find.text('EGP 650'), findsOneWidget);
      expect(find.text('Coupon Discount'), findsNothing);
    });
  });

  group('purchaseCouponLabel', () {
    testWidgets('words a coupon by its scope', (tester) async {
      late BuildContext context;
      await tester.pumpWidget(
        _TestApp(
          child: Builder(
            builder: (builderContext) {
              context = builderContext;
              return const SizedBox();
            },
          ),
        ),
      );

      String label(PurchaseCouponEntity coupon) => purchaseCouponLabel(context, coupon);

      expect(
        label(
          const PurchaseCouponEntity(
            id: 71,
            facilityId: 184,
            discountRatio: 10,
            coversAllTickets: true,
            coversAllPromotions: true,
          ),
        ),
        '10% Discount (All Purchases)',
      );
      expect(
        label(
          const PurchaseCouponEntity(
            id: 76,
            facilityId: 194,
            discountRatio: 100,
            coversAllTickets: true,
          ),
        ),
        '100% Discount (All Tickets)',
      );
      expect(
        label(
          const PurchaseCouponEntity(
            id: 39,
            facilityId: 157,
            discountRatio: 25,
            tickets: [(id: 77, name: 'Bungee Ticket'), (id: 78, name: '')],
          ),
        ),
        '25% Discount (Bungee Ticket, Tickets)',
      );
    });
  });

  group('PurchaseCouponDropdown', () {
    testWidgets('explains a coupon the quote refused', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: PurchaseCouponDropdown(
            couponsState: const AsyncState.success([]),
            selectedCoupon: null,
            isRejected: true,
            onSelect: (_) {},
            onRetry: () {},
          ),
        ),
      );

      expect(find.text('Select Coupon (0 Available)'), findsOneWidget);
      expect(
        find.text("This coupon can't be used on this purchase, so it was removed."),
        findsOneWidget,
      );
    });
  });

  group('PurchaseConfirmDialog', () {
    /// Pumps a button that opens the dialog for [quote]; the dialog's answer
    /// lands in [onResult].
    Future<void> pumpOpener(
      WidgetTester tester,
      PurchaseQuoteEntity quote, {
      ValueChanged<bool?>? onResult,
    }) async {
      await tester.pumpWidget(
        _TestApp(
          child: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                final result = await PurchaseConfirmDialog.show(
                  context,
                  quote: quote,
                  currency: 'EGP',
                  accentColor: _accent,
                );
                onResult?.call(result);
              },
              child: const Text('open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('summarises what will be due at the facility', (tester) async {
      await pumpOpener(tester, _quote);

      expect(find.text('Direct Purchase'), findsOneWidget);
      expect(find.text('Payment Summary'), findsOneWidget);
      expect(find.text('EGP 450'), findsOneWidget);
      expect(find.text('+ EGP 200'), findsOneWidget);
      expect(find.text('DUE Amount'), findsOneWidget);
      expect(find.text('EGP 650'), findsOneWidget);
      // No coupon on this quote, so no zero discount row.
      expect(find.text('Coupon Discount'), findsNothing);
      expect(find.textContaining('Payment will be due directly with the business'), findsOneWidget);
    });

    testWidgets('shows the coupon discount and returns the choice', (tester) async {
      bool? result;
      const couponQuote = PurchaseQuoteEntity(
        totalPrice: 90,
        finalPrice: 0,
        couponDiscount: 90,
        currency: r'$',
      );

      await pumpOpener(tester, couponQuote, onResult: (value) => result = value);
      expect(find.text(r'- $ 90'), findsOneWidget);
      expect(find.text(r'$ 0'), findsOneWidget);

      await tester.tap(find.text('Confirm Purchase'));
      await tester.pumpAndSettle();
      expect(result, isTrue);

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(result, isFalse);
    });
  });

  group('PriceText', () {
    testWidgets('shows the reduced price with the full price struck through', (tester) async {
      await tester.pumpWidget(
        const _TestApp(
          child: PriceText(currency: 'EGP', price: 250, reducedPrice: 225, color: _accent),
        ),
      );

      expect(find.text('EGP 225'), findsOneWidget);
      final struck = tester.widget<Text>(find.text('250'));
      expect(struck.style?.decoration, TextDecoration.lineThrough);
    });

    testWidgets('shows only the price when it is not reduced', (tester) async {
      await tester.pumpWidget(
        const _TestApp(
          child: PriceText(currency: 'EGP', price: 20000, color: _accent),
        ),
      );

      expect(find.text('EGP 20000'), findsOneWidget);
      expect(find.text('20000'), findsNothing);
    });
  });
}
