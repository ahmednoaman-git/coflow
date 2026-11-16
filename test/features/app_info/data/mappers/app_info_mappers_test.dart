import 'package:coflow_users_v2/features/app_info/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/app_info/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppFaqMapper.toCustomerFaqs', () {
    // `GET admin-faq` as the test server returned it on 2026-11-16, plus an
    // inactive customer entry and an out-of-order one.
    final rows = <Map<String, dynamic>>[
      {
        'id': 196,
        'question': 'GO Question',
        'answer': 'GO Answer',
        'type': 'go',
        'sort': 1,
        'status': 'active',
        'facility_id': null,
      },
      {
        'id': 197,
        'question': 'FLow Question',
        'answer': 'Flow Answer',
        'type': 'flow',
        'sort': 2,
        'status': 'active',
        'facility_id': null,
      },
      {
        'id': 209,
        'question': ' Customer Question 1 ',
        'answer': 'Customer Answer 1\n',
        'type': 'customers',
        'sort': 4,
        'status': 'active',
        'facility_id': null,
      },
      {
        'id': 210,
        'question': 'PRO Question',
        'answer': 'PRO Answer',
        'type': 'pro',
        'sort': 5,
        'status': 'active',
        'facility_id': null,
      },
      {
        'id': 211,
        'question': 'Hidden',
        'answer': 'Hidden',
        'type': 'customers',
        'sort': 1,
        'status': 'inactive',
      },
      {
        'id': 212,
        'question': 'First',
        'answer': 'First answer',
        'type': 'customers',
        'sort': 2,
        'status': 'active',
      },
      {
        'id': 205,
        'question': 'Same sort, lower id',
        'answer': 'A',
        'type': 'customers',
        'sort': 4,
        'status': 'active',
      },
    ];

    final faqs = AppFaqMapper.toCustomerFaqs(rows.map(AppFaqModel.fromJson).toList());

    test('keeps only active customer entries', () {
      expect(faqs.map((faq) => faq.id), isNot(contains(196)));
      expect(faqs.map((faq) => faq.id), isNot(contains(211)));
      expect(faqs, hasLength(3));
    });

    test('orders by sort, then by id', () {
      expect(faqs.map((faq) => faq.id), [212, 205, 209]);
    });

    test('trims the question and answer', () {
      final faq = faqs.last;
      expect(faq.question, 'Customer Question 1');
      expect(faq.answer, 'Customer Answer 1');
    });
  });

  group('AppInfoMapper.toEntity', () {
    test('maps the legal texts and contact details', () {
      final info = AppInfoMapper.toEntity(
        AppInfoModel.fromJson({
          'id': 1,
          'terms': 'Terms & Conditions\nBy downloading or using the app...',
          'policy': 'policy',
          'address': 'address',
          'phone': '1244312',
          'email': 'fouad@coflow.co',
          'notification': false,
        }),
      );

      expect(info.terms, startsWith('Terms & Conditions\n'));
      expect(info.privacyPolicy, 'policy');
      expect(info.phone, '1244312');
      expect(info.email, 'fouad@coflow.co');
    });

    test('treats blank and missing texts as unset', () {
      final info = AppInfoMapper.toEntity(
        AppInfoModel.fromJson({'terms': '  \n ', 'policy': null}),
      );

      expect(info.terms, isNull);
      expect(info.privacyPolicy, isNull);
    });
  });
}
