// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitModel _$HabitModelFromJson(Map<String, dynamic> json) => _HabitModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  createdAt: json['created_at'] as String,
  habitLogs: (json['habit_logs'] as List<dynamic>)
      .map((e) => HabitLogModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HabitModelToJson(_HabitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt,
      'habit_logs': instance.habitLogs,
    };
