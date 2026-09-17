import 'dart:convert';
import 'dart:io';

import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

/// The fixtures are unedited `GET facility/{id}` responses from the test API,
/// picked to cover every payload variation the endpoint produces:
///
/// * 184 — address-based, current contact shape with a nested phone list
/// * 173 — address-based, `reservation_contact` as a list of bare strings
/// * 191 — remote, no address at all, three coverage rows
/// * 194 — address-based, current contact shape with the value in `url`
/// * 64  — address-based, legacy `selectSocial` contact shape
void main() {
  FacilityProfileEntity load(int id) {
    final file = File('test/features/facility/data/fixtures/facility_$id.json');
    final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    return FacilityProfileMapper.toEntity(FacilityProfileModel.fromJson(json));
  }

  group('parses every live payload variation', () {
    for (final id in [184, 173, 191, 194, 64]) {
      test('facility $id maps without throwing', () {
        expect(() => load(id), returnsNormally);
      });
    }

    test('a bare-string contact list no longer takes the profile down', () {
      // Facility 173 sends `"reservation_contact": ["Instagram"]`, which used
      // to blow up the whole profile parse.
      final profile = load(173);

      expect(profile.contacts.single.channel, FacilityContactChannel.instagram);
      expect(profile.contacts.single.isActionable, isFalse);
      expect(profile.actionableContacts, isEmpty);
    });
  });

  group('address-based locations', () {
    test('carries the address, coordinates and the facility maps link', () {
      final location = load(184).location;

      expect(location, isA<FacilityAddressLocation>());
      final address = location! as FacilityAddressLocation;
      expect(address.addressLine, 'Address');
      expect(address.cityName, 'Governorate');
      expect(address.areaName, 'Area');
      expect(address.latitude, 11.11111);
      expect(address.longitude, 22.22222);
      expect(address.mapUrl, 'https://maps.app.goo.gl/Xj6UDgN41ZbNtLmA9');
      expect(location.hasCoordinates, isTrue);
      expect(location.link, isNotNull);
    });

    test('keeps the phone numbers published on the address', () {
      final address = load(64).location! as FacilityAddressLocation;

      expect(address.phones.map((phone) => phone.number), ['01009144355', '01154619120']);
      expect(address.phones.first.label, 'Mobile');
    });
  });

  group('remote locations', () {
    test('reads coverage rows instead of an address', () {
      final location = load(191).location;

      expect(location, isA<FacilityRemoteLocation>());
      final remote = location! as FacilityRemoteLocation;
      expect(remote.coverage, hasLength(3));
      expect(location.hasCoordinates, isFalse);
    });

    test('an `all city` row covers everything, an `open` row names its areas', () {
      final remote = load(191).location! as FacilityRemoteLocation;

      final cairo = remote.coverage.firstWhere((row) => row.label == 'Cairo');
      expect(cairo.coversAll, isTrue);
      expect(cairo.areas, isEmpty);

      final giza = remote.coverage.firstWhere((row) => row.label == 'Giza');
      expect(giza.coversAll, isFalse);
      expect(giza.areas, contains('Sheikh Zayed'));
    });
  });

  group('contacts', () {
    test('reads a nested phone list, labels and all (facility 184)', () {
      final contact = load(184).contacts.single;

      expect(contact.channel, FacilityContactChannel.contactNumber);
      expect(contact.links.map((link) => link.value), ['19019', '01234567890']);
      expect(contact.links.map((link) => link.label), ['Landline', 'Mobile']);
      expect(contact.needsChoice, isTrue);
    });

    test('reads a value stored directly in `url` (facility 194)', () {
      final contact = load(194).contacts.single;

      expect(contact.channel, FacilityContactChannel.whatsapp);
      expect(contact.links.single.value, '00971600511115');
      expect(contact.needsChoice, isFalse);
    });

    test('reads the legacy selectSocial shape (facility 64)', () {
      final contact = load(64).contacts.single;

      expect(contact.channel, FacilityContactChannel.website);
      expect(contact.links.single.value, 'https://xwake.simplybook.me/v2/#');
    });
  });

  test('reads the saved and tracked flags', () {
    final profile = load(184);

    expect(profile.isSaved, isFalse);
    expect(profile.isTracked, isFalse);
    expect(profile.updatedAt, isNotNull);
  });
}
