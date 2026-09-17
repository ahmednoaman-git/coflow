import 'dart:convert';
import 'dart:io';

import 'package:coflow_users_v2/features/activity_line/data/data.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:coflow_users_v2/features/search/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fixtures are verbatim responses from the test API
/// (`GET search?search=…&type=…`), trimmed to two items per page.
Map<String, dynamic> _fixture(String name) {
  final file = File('test/features/search/fixtures/search_${name}_response.json');
  return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
}

void main() {
  group('SearchMapper', () {
    test('maps a business page, taking the activity line from the id', () {
      final page = SearchMapper.toPaginatedEntity(
        PaginatedResponseModel.fromJson(_fixture('business'), FacilityModel.fromJson),
        ActivityLineMapper.toFacilityEntity,
      );

      expect(page.total, 2);
      expect(page.currentPage, 1);
      expect(page.lastPage, 1);
      expect(page.hasMore, isFalse);

      final facility = page.items.first;
      expect(facility.name, 'Animal Flow');
      expect(facility.description, 'Movement System');
      expect(facility.activityLine.id, 4);
      expect(facility.logoUrl, isNotNull);
      expect(facility.tags, isNotEmpty);
    });

    test('maps a service page, including the facility embedded in each result', () {
      final page = SearchMapper.toPaginatedEntity(
        PaginatedResponseModel.fromJson(_fixture('service'), SearchServiceModel.fromJson),
        SearchMapper.toServiceEntity,
      );

      expect(page.total, 22);
      expect(page.lastPage, greaterThan(1));
      expect(page.hasMore, isTrue);

      final result = page.items.first;
      expect(result.service.name, 'Flexibility Flow');
      expect(result.type, FacilityServiceType.flow);
      expect(result.facility.name, 'Beitna Studio');
      // The nested facility omits the expanded `activity_line` object, so the
      // line has to come from `activity_line_id`.
      expect(result.facility.activityLine.id, 4);
    });

    test('maps an instructor page', () {
      final page = SearchMapper.toPaginatedEntity(
        PaginatedResponseModel.fromJson(_fixture('instructor'), SearchInstructorModel.fromJson),
        SearchMapper.toInstructorEntity,
      );

      expect(page.total, 2);

      final instructor = page.items.first;
      expect(instructor.name, 'salah');
      expect(instructor.centerName, 'diving center');
    });
  });

  group('PaginatedResponseModel', () {
    test('falls back to a single empty page when the paginator keys are missing', () {
      final page = PaginatedResponseModel.fromJson(
        const <String, dynamic>{},
        SearchInstructorModel.fromJson,
      );

      expect(page.items, isEmpty);
      expect(page.currentPage, 1);
      expect(page.lastPage, 1);
      expect(page.total, 0);
    });

    test('reads counters that come back as strings', () {
      final page = PaginatedResponseModel.fromJson(
        const <String, dynamic>{'data': [], 'current_page': '2', 'last_page': '5', 'total': '48'},
        SearchInstructorModel.fromJson,
      );

      expect(page.currentPage, 2);
      expect(page.lastPage, 5);
      expect(page.total, 48);
    });
  });
}
