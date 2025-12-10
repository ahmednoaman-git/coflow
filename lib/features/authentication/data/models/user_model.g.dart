// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  birthdate: json['birthdate'] as String?,
  gender: UserModel._genderFromJson(json['gender'] as String?),
  nationality: json['nationality'] as String?,
  image: json['image'] as String?,
  totalLikes: json['total_likes'] == null
      ? '0/0'
      : UserModel._parseTotalLikes(json['total_likes']),
  totalTickets: (json['total_tickets'] as num?)?.toInt() ?? 0,
  totalPromotions: (json['total_promotions'] as num?)?.toInt() ?? 0,
  totalGifts: (json['total_gifts'] as num?)?.toInt() ?? 0,
  totalPurchases: (json['total_purchases'] as num?)?.toInt() ?? 0,
  token: json['token'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'birthdate': instance.birthdate,
  'gender': UserModel._genderToJson(instance.gender),
  'nationality': instance.nationality,
  'image': instance.image,
  'total_likes': instance.totalLikes,
  'total_tickets': instance.totalTickets,
  'total_promotions': instance.totalPromotions,
  'total_gifts': instance.totalGifts,
  'total_purchases': instance.totalPurchases,
  'token': instance.token,
};
