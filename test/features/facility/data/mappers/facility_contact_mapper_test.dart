import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

/// The `reservation_contact` payloads below are copied verbatim from the test
/// API (`GET facility/{id}`) — every one of these shapes is live today.
void main() {
  List<dynamic> shape(dynamic raw) => raw as List<dynamic>;

  group('ReservationContactModel.listFromJson', () {
    test('parses a bare label with no value behind it (facility 173)', () {
      final contacts = ReservationContactModel.listFromJson(shape(['Instagram']));

      expect(contacts, hasLength(1));
      expect(contacts.single.name, 'Instagram');
      expect(contacts.single.links, isEmpty);
    });

    test('parses the legacy selectSocial + URL shape (facility 64)', () {
      final contacts = ReservationContactModel.listFromJson(
        shape([
          {'selectSocial': 'Website', 'link': 'https://xwake.simplybook.me/v2/#'},
        ]),
      );

      expect(contacts.single.name, 'Website');
      expect(contacts.single.links.single.value, 'https://xwake.simplybook.me/v2/#');
    });

    test('parses the legacy shape where link is a single bare number (facility 62)', () {
      final contacts = ReservationContactModel.listFromJson(
        shape([
          {'selectSocial': 'Contact Number', 'link': '01010702790'},
        ]),
      );

      expect(contacts.single.links.single.value, '01010702790');
      expect(contacts.single.links.single.label, isNull);
    });

    test('parses the legacy phone-list shape, labelled by type (facility 71)', () {
      final contacts = ReservationContactModel.listFromJson(
        shape([
          {
            'selectSocial': 'Contact Number',
            'link': [
              {'type': 'Mobile', 'number': '01155281902'},
              {'type': 'Mobile', 'number': '01555819956'},
            ],
          },
        ]),
      );

      expect(contacts.single.links.map((link) => link.value), [
        '01155281902',
        '01555819956',
      ]);
      expect(contacts.single.links.first.label, 'Mobile');
    });

    test('parses the current shape where the value sits in url (facility 194)', () {
      final contacts = ReservationContactModel.listFromJson(
        shape([
          {'id': 521, 'name': 'Whatsapp', 'url': '00971600511115', 'facility_id': 194},
        ]),
      );

      expect(contacts.single.name, 'Whatsapp');
      expect(contacts.single.links.single.value, '00971600511115');
    });

    test('ignores a url that is only a slug of the name (facility 184)', () {
      final contacts = ReservationContactModel.listFromJson(
        shape([
          {
            'name': 'Contact Number',
            'url': 'contact_number',
            'link': [
              {'id': 407, 'name': 'Landline', 'phone': '19019', 'facility_id': 184},
              {'id': 408, 'name': 'Mobile', 'phone': '01234567890', 'facility_id': 184},
            ],
          },
        ]),
      );

      expect(contacts.single.links, hasLength(2));
      expect(contacts.single.links.first.value, '19019');
      expect(contacts.single.links.first.label, 'Landline');
      // The slug must never leak in as a dialable value.
      expect(
        contacts.single.links.map((link) => link.value),
        isNot(contains('contact_number')),
      );
    });

    test('returns empty rather than throwing for null or unexpected payloads', () {
      expect(ReservationContactModel.listFromJson(null), isEmpty);
      expect(ReservationContactModel.listFromJson('Instagram'), isEmpty);
      expect(ReservationContactModel.listFromJson(shape([42, null, {}])), isEmpty);
    });
  });

  group('FacilityContactMapper', () {
    test('normalizes labels onto channels regardless of spacing and casing', () {
      final channels = ReservationContactModel.listFromJson(
        shape(['Contact Number', 'contact_number', 'Whatsapp', 'Instagram', 'Nonsense']),
      ).map((model) => FacilityContactMapper.toEntity(model).channel);

      expect(channels, [
        FacilityContactChannel.contactNumber,
        FacilityContactChannel.contactNumber,
        FacilityContactChannel.whatsapp,
        FacilityContactChannel.instagram,
        FacilityContactChannel.other,
      ]);
    });

    test('marks a channel with no values as not actionable', () {
      final contact = FacilityContactMapper.toEntity(
        ReservationContactModel.listFromJson(shape(['Instagram'])).single,
      );

      expect(contact.isActionable, isFalse);
      expect(contact.needsChoice, isFalse);
    });

    test('flags a multi-number channel as needing a choice', () {
      final contact = FacilityContactMapper.toEntity(
        ReservationContactModel.listFromJson(
          shape([
            {
              'name': 'Contact Number',
              'url': 'contact_number',
              'link': [
                {'name': 'Landline', 'phone': '19019'},
                {'name': 'Mobile', 'phone': '01234567890'},
              ],
            },
          ]),
        ).single,
      );

      expect(contact.isActionable, isTrue);
      expect(contact.needsChoice, isTrue);
    });
  });
}
