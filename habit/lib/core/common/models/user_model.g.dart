// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  authId: json['auth_id'] as String,
  email: json['email'] as String,
  username: json['username'] as String?,
  phoneNumber: json['phone_number'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'auth_id': instance.authId,
      'email': instance.email,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt,
    };
