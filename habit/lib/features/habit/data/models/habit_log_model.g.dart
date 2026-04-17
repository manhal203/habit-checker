// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitLogModel _$HabitLogModelFromJson(Map<String, dynamic> json) =>
    _HabitLogModel(
      id: (json['id'] as num).toInt(),
      habitId: json['habit_id'] as String,
      logDate: json['log_date'] as String,
      isCompleted: json['is_completed'] as bool,
    );

Map<String, dynamic> _$HabitLogModelToJson(_HabitLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habit_id': instance.habitId,
      'log_date': instance.logDate,
      'is_completed': instance.isCompleted,
    };
