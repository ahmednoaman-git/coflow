// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  birthdate: json['birthdate'] as String?,
  gender: RegisterResponseModel._genderFromJson(json['gender'] as String?),
  nationality: json['nationality'] as String?,
  image: json['image'] as String?,
  createdAt: json['created_at'] as String,
  totalLikes: (json['total_likes'] as num?)?.toInt() ?? 0,
  totalTickets: (json['total_tickets'] as num?)?.toInt() ?? 0,
  totalPromotions: (json['total_promotions'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  RegisterResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'birthdate': instance.birthdate,
  'gender': RegisterResponseModel._genderToJson(instance.gender),
  'nationality': instance.nationality,
  'image': instance.image,
  'created_at': instance.createdAt,
  'total_likes': instance.totalLikes,
  'total_tickets': instance.totalTickets,
  'total_promotions': instance.totalPromotions,
};
