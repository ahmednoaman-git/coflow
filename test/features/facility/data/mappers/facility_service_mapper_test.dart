import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/entities/entities.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FacilityServiceMapper.mapLevel', () {
    test('falls back to allLevels for flow listings with a null level', () {
      final level = FacilityServiceMapper.mapLevel(null, FacilityServiceType.flow);
      expect(level, const FacilityServiceLevel.allLevels());
    });

    test('falls back to allLevels for course listings with a null level', () {
      final level = FacilityServiceMapper.mapLevel(null, FacilityServiceType.course);
      expect(level, const FacilityServiceLevel.allLevels());
    });

    test('stays null for activity listings with a null level', () {
      final level = FacilityServiceMapper.mapLevel(null, FacilityServiceType.activity);
      expect(level, isNull);
    });

    test('preserves the name and color of a non-null level', () {
      final level = FacilityServiceMapper.mapLevel(
        const FacilityServiceLevelModel(id: 3, name: 'INTERMEDIATE', color: '#fe9e12'),
        FacilityServiceType.flow,
      );

      expect(level, isA<FacilityServiceLevelCustom>());
      final custom = level as FacilityServiceLevelCustom;
      expect(custom.name, 'INTERMEDIATE');
      expect(custom.colorHex, '#fe9e12');
    });
  });

  group('FacilityServiceMapper.composeDurationLabel', () {
    test('combines duration and unit name', () {
      final label = FacilityServiceMapper.composeDurationLabel(
        '1',
        const FacilityServiceDurationListModel(id: 18, name: 'Hour'),
      );
      expect(label, '1 Hour');
    });

    test('returns null when duration is null', () {
      final label = FacilityServiceMapper.composeDurationLabel(
        null,
        const FacilityServiceDurationListModel(id: 18, name: 'Hour'),
      );
      expect(label, isNull);
    });

    test('returns null when the unit is null', () {
      final label = FacilityServiceMapper.composeDurationLabel('1', null);
      expect(label, isNull);
    });
  });

  group('FacilityServiceMapper.toEntity', () {
    test('preserves folder structure and flattens folder + root services', () {
      final entity = FacilityServiceMapper.toEntity(
        const FacilityServicesResponseModel(
          folders: [
            FacilityServiceFolderModel(
              id: 1,
              name: 'Folder A',
              services: [
                CollapsedFacilityServiceModel(id: 10, name: 'Folder Service 1'),
                CollapsedFacilityServiceModel(id: 11, name: 'Folder Service 2'),
              ],
            ),
          ],
          services: [CollapsedFacilityServiceModel(id: 20, name: 'Root Service')],
        ),
        FacilityServiceType.activity,
      );

      expect(entity.folders, hasLength(1));
      expect(entity.folders.single.services, hasLength(2));
      expect(entity.rootServices, hasLength(1));
      expect(entity.isEmpty, isFalse);

      final flattened = entity.flattenedServices.map((s) => s.id).toList();
      expect(flattened, [10, 11, 20]);
    });

    test('isEmpty is true when there are no folders and no root services', () {
      final entity = FacilityServiceMapper.toEntity(
        const FacilityServicesResponseModel(),
        FacilityServiceType.flow,
      );

      expect(entity.isEmpty, isTrue);
      expect(entity.flattenedServices, isEmpty);
    });
  });
}
