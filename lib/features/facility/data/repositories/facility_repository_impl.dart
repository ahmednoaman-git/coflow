import 'package:coflow_users_v2/core/async/async.dart';
import 'package:injectable/injectable.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../mappers/mappers.dart';

@LazySingleton(as: FacilityRepository)
class FacilityRepositoryImpl implements FacilityRepository {
  const FacilityRepositoryImpl(this._remote);

  final FacilityRemoteDataSource _remote;

  @override
  AsyncTask<List<FacilityPromotionEntity>> getFacilityPromotions(
    GetFacilityPromotionsDto dto,
  ) {
    return _remote
        .getFacilityPromotions(dto)
        .flatMap(
          (models) => AsyncTask.tryCatch(
            () async => models.map(FacilityPromotionMapper.toEntity).toList(growable: false),
            (error, stackTrace) {
              if (error is FormatException) {
                return ValidationFailure(
                  error.message.toString(),
                  exception: error,
                );
              }

              return UnknownFailure(
                'Failed to map facility promotions.',
                exception: error is Exception ? error : Exception(error.toString()),
              );
            },
          ),
        );
  }

  @override
  AsyncTask<FacilityProfileEntity> getFacilityProfile(GetFacilityProfileDto dto) {
    return _remote.getFacilityProfile(dto).map(FacilityProfileMapper.toEntity);
  }

  @override
  AsyncTask<List<FacilityTicketEntity>> getFacilityTickets(GetFacilityTicketsDto dto) {
    return _remote
        .getFacilityTickets(dto)
        .map((models) => models.map(FacilityTicketMapper.toEntity).toList(growable: false));
  }

  @override
  AsyncTask<FacilityTicketDetailsEntity> getFacilityTicketDetails(
    GetFacilityTicketDetailsDto dto,
  ) {
    return _remote.getFacilityTicketDetails(dto).map(FacilityTicketDetailsMapper.toEntity);
  }
}
