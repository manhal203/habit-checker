import 'package:habit/features/add_habit/domain/entities/add_habit_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_habit_model.freezed.dart';
part 'add_habit_model.g.dart';

@freezed
abstract class AddHabitModel with _$AddHabitModel {
  const factory AddHabitModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AddHabitModel;

  factory AddHabitModel.fromJson(Map<String, Object?> json) => _$AddHabitModelFromJson(json);
}



extension AddHabitModelMapper on AddHabitModel {
  AddHabitEntity toEntity() {
    return AddHabitEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
