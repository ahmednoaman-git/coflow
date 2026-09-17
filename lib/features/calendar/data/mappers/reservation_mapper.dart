import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class ReservationMapper {
  /// Neutral accent used when the API sends no colour for a reservation.
  static const String fallbackColorHex = '#5BC5F2';

  static ReservationCalendarEntity toEntity(
    ReservationsResponseModel model,
    GetReservationsDto dto,
  ) {
    final reservations = model.reservations.map(_toReservationEntity).toList()
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));

    return ReservationCalendarEntity(
      windowStart: _dayOf(dto.startDate),
      windowEnd: _dayOf(dto.endDate),
      reservations: List.unmodifiable(reservations),
    );
  }

  static ReservationEntity _toReservationEntity(ReservationModel model) {
    return ReservationEntity(
      id: model.id,
      facilityId: model.facilityId,
      facilityName: model.facilityName,
      facilityLogoUrl: model.facilityLogo,
      serviceName: model.serviceName,
      startsAt: model.startsAt,
      endsAt: model.endsAt,
      colorHex: model.color?.isNotEmpty ?? false ? model.color! : fallbackColorHex,
      level: _toLevel(model.level),
      instructorNames: model.instructors
          .map((instructor) => '${instructor.firstName} ${instructor.lastName}')
          .toList(growable: false),
    );
  }

  /// A reservation's level stays null when the API omits it — services without
  /// levels (e.g. Pro activities) are legitimately level-less.
  static ReservationLevelEntity? _toLevel(ReservationLevelModel? model) {
    if (model == null) return null;
    return ReservationLevelEntity(name: model.name, colorHex: model.color ?? '');
  }

  static DateTime _dayOf(DateTime date) => DateTime(date.year, date.month, date.day);
}
