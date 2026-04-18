import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit/features/habit/domain/entities/habit_log_entity.dart';
part 'habit_log_model.freezed.dart';
part 'habit_log_model.g.dart';

@freezed
abstract class HabitLogModel with _$HabitLogModel {
  @JsonSerializable(fieldRename: .snake)
  const factory HabitLogModel({
    required int id,
    required String habitId,
    required String logDate,
    required bool isCompleted,
  }) = _HabitLogModel;

  factory HabitLogModel.fromJson(Map<String, Object?> json) =>
      _$HabitLogModelFromJson(json);
}

extension HabitLogEntityMapper on HabitLogModel {
  HabitLogEntity toEntity() {
    return HabitLogEntity(id: id, isCompleted: isCompleted,habitId: habitId,logDate: logDate);
  }
}
