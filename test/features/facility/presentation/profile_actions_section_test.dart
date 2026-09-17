import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/activity_line/domain/entities/collapsed_facility_entity.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:coflow_users_v2/features/facility/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

FacilityContactEntity _contact(
  FacilityContactChannel channel, {
  List<FacilityContactLinkEntity> links = const [
    FacilityContactLinkEntity(value: '01000000000'),
  ],
}) => FacilityContactEntity(channel: channel, label: channel.name, links: links);

void main() {
  group('ActionsSection', () {
    testWidgets('renders one button per contact channel', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: ActionsSection(
            contacts: [
              _contact(FacilityContactChannel.contactNumber),
              _contact(FacilityContactChannel.whatsapp),
              _contact(FacilityContactChannel.instagram),
            ],
            updatedAt: DateTime(2024, 11, 16),
            onOpenFaqs: () {},
          ),
        ),
      );

      // One glyph per channel; the FAQ button below uses an icon font, not an
      // SVG, so it does not inflate the count.
      expect(find.byType(SvgPicture), findsNWidgets(3));
      expect(find.text('FAQs'), findsOneWidget);
      expect(find.text('Last Updated: 16/11/2024'), findsOneWidget);
    });

    testWidgets('opens the FAQ screen from the button', (tester) async {
      var opened = false;

      await tester.pumpWidget(
        _TestApp(
          child: ActionsSection(
            contacts: const [],
            updatedAt: null,
            onOpenFaqs: () => opened = true,
          ),
        ),
      );

      await tester.tap(find.text('FAQs'));
      await tester.pump();

      expect(opened, isTrue);
      // No contacts and no update date leaves only the FAQ button.
      expect(find.text('Last Updated: 16/11/2024'), findsNothing);
    });

    testWidgets('offers a picker for a channel with several numbers', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: ActionsSection(
            contacts: [
              _contact(
                FacilityContactChannel.contactNumber,
                links: const [
                  FacilityContactLinkEntity(value: '19019', label: 'Landline'),
                  FacilityContactLinkEntity(value: '01234567890', label: 'Mobile'),
                ],
              ),
            ],
            updatedAt: null,
            onOpenFaqs: () {},
          ),
        ),
      );

      await tester.tap(find.byType(SvgPicture).first);
      await tester.pumpAndSettle();

      expect(find.text('Choose a number'), findsOneWidget);
      expect(find.text('19019'), findsOneWidget);
      expect(find.text('Landline'), findsOneWidget);
      expect(find.text('01234567890'), findsOneWidget);
    });
  });

  group('FaqTile', () {
    testWidgets('hides the answer until it is expanded', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: const FaqTile(
            faq: FacilityFaqEntity(
              id: 1,
              question: 'Is it safe to wake in the Nile?',
              answer: 'Yes, it is very safe.',
            ),
            isExpanded: false,
            accentColor: Color(0xFF2FDAC2),
            onTap: _noop,
          ),
        ),
      );

      expect(find.text('Is it safe to wake in the Nile?'), findsOneWidget);
      expect(find.text('Yes, it is very safe.'), findsNothing);
    });

    testWidgets('shows the answer once expanded', (tester) async {
      await tester.pumpWidget(
        _TestApp(
          child: const FaqTile(
            faq: FacilityFaqEntity(
              id: 1,
              question: 'Is it safe to wake in the Nile?',
              answer: 'Yes, it is very safe.',
            ),
            isExpanded: true,
            accentColor: Color(0xFF2FDAC2),
            onTap: _noop,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Yes, it is very safe.'), findsOneWidget);
    });
  });
}

void _noop() {}

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
      home: FacilityDataProvider(
        scrollController: ScrollController(),
        facility: const CollapsedFacilityEntity(
          id: 1,
          name: 'Flying Yoga',
          description: 'Aerial & Yoga Studio',
          activityLine: ActivityLineEntity.sky,
          accountType: FlowAccount(),
          status: FacilityStatus.visible,
          subscriptionStatus: SubscriptionStatus.basic,
          paymentType: PaymentType.directPurchase,
          views: 0,
        ),
        activityLineColor: const Color(0xFF2FDAC2),
        activityLineBackground: const Color(0xFFD6F1FC),
        child: Scaffold(
          body: SizedBox(width: 375, child: SingleChildScrollView(child: child)),
        ),
      ),
    );
  }
}
