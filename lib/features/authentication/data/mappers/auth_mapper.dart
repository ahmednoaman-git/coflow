import '../../domain/entities/entities.dart';
import '../models/models.dart';

/// Maps authentication data models to domain entities.
abstract final class AuthMapper {
  /// Maps [UserModel] to [UserEntity].
  static UserEntity toUserEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      birthdate: model.birthdate,
      gender: model.gender,
      nationality: model.nationality,
      image: model.image,
      totalLikes: model.totalLikes,
      totalTickets: model.totalTickets,
      totalPromotions: model.totalPromotions,
    );
  }

  /// Maps [UserModel] with token to [SessionEntity].
  static SessionEntity toSessionEntity(UserModel model) {
    return SessionEntity(
      user: toUserEntity(model),
      accessToken: model.token ?? '',
    );
  }

  /// Maps [RegisterResponseModel] to [UserEntity].
  static UserEntity registerResponseToUserEntity(RegisterResponseModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      birthdate: model.birthdate,
      gender: model.gender,
      nationality: model.nationality,
      image: model.image,
      totalLikes: model.totalLikes,
      totalTickets: model.totalTickets,
      totalPromotions: model.totalPromotions,
    );
  }

  /// Maps list of [NationalityModel] to list of nationality names.
  static List<String> toNationalityList(List<NationalityModel> models) {
    return models.map((model) => model.name).toList();
  }
}
