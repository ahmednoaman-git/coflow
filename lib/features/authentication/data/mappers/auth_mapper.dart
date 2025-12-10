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
      totalGifts: model.totalGifts,
      totalPurchases: model.totalPurchases,
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
      totalGifts: model.totalGifts,
      totalPurchases: model.totalPurchases,
    );
  }
}
