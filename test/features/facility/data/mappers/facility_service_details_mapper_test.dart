import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:coflow_users_v2/features/facility/domain/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FacilityServiceDetailsMapper.toEntity', () {
    test('sorts images by sort order and maps their urls', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(
          id: 1,
          name: 'Test Service',
          images: [
            FacilityServiceImageModel(id: 1, file: 'second.jpg', sort: 2, type: 'image'),
            FacilityServiceImageModel(id: 2, file: 'first.jpg', sort: 1, type: 'image'),
          ],
        ),
        FacilityServiceType.activity,
      );

      expect(entity.imageUrls, ['first.jpg', 'second.jpg']);
    });

    test('falls back to the primary image when images is empty', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(id: 1, name: 'Test Service', image: 'primary.jpg'),
        FacilityServiceType.activity,
      );

      expect(entity.imageUrls, ['primary.jpg']);
    });

    test('returns an empty list when there is no primary image either', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(id: 1, name: 'Test Service'),
        FacilityServiceType.activity,
      );

      expect(entity.imageUrls, isEmpty);
    });

    test('drops the discount price when hasDiscount is false', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(
          id: 1,
          name: 'Test Service',
          tickets: [
            FacilityServiceTicketModel(
              id: 5,
              name: 'Ticket',
              price: 500,
              hasDiscount: false,
              discountPrice: 400,
              currency: 'EGP',
            ),
          ],
        ),
        FacilityServiceType.activity,
      );

      expect(entity.tickets.single.discountPrice, isNull);
      expect(entity.tickets.single.price, 500);
    });

    test('keeps the discount price when hasDiscount is true', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(
          id: 1,
          name: 'Test Service',
          tickets: [
            FacilityServiceTicketModel(
              id: 5,
              name: 'Ticket',
              price: 500,
              hasDiscount: true,
              discountPrice: 400,
              currency: 'EGP',
            ),
          ],
        ),
        FacilityServiceType.activity,
      );

      expect(entity.tickets.single.discountPrice, 400);
    });

    test('composes instructor full names', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(
          id: 1,
          name: 'Test Service',
          instructors: [
            FacilityServiceInstructorModel(id: 1, firstName: 'Amr', lastName: 'Nabil'),
          ],
        ),
        FacilityServiceType.activity,
      );

      expect(entity.instructors.single.fullName, 'Amr Nabil');
    });

    test('passes nullable text fields through unchanged', () {
      final entity = FacilityServiceDetailsMapper.toEntity(
        const FacilityServiceDetailsModel(id: 1, name: 'Test Service'),
        FacilityServiceType.activity,
      );

      expect(entity.description, isNull);
      expect(entity.requirements, isNull);
      expect(entity.conditions, isNull);
    });
  });
}
