// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddHabitModel _$AddHabitModelFromJson(Map<String, dynamic> json) =>
    _AddHabitModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AddHabitModelToJson(_AddHabitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
