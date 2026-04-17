import 'package:habit/features/habit/data/models/habit_log_model.dart';
import 'package:habit/features/habit/domain/entities/habit_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
abstract class HabitModel with _$HabitModel {
  @JsonSerializable(fieldRename: .snake)
  const factory HabitModel({
    required String id,
    required String userId,
    required String title,
    required String description,
    required String createdAt,
    required List<HabitLogModel> habitLogs,
  }) = _HabitModel;

  factory HabitModel.fromJson(Map<String, Object?> json) =>
      _$HabitModelFromJson(json);
}

extension HabitModelMapper on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(
      description: description,
      id: id,
      createAt: createdAt,
      title: title,
      habitLog: habitLogs.map((e) => e.toEntity()).toList(),
    );
  }
}
