import 'package:habit/features/habit/domain/entities/habit_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
abstract class HabitModel with _$HabitModel {
  const factory HabitModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _HabitModel;

  factory HabitModel.fromJson(Map<String, Object?> json) => _$HabitModelFromJson(json);
}



extension HabitModelMapper on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
