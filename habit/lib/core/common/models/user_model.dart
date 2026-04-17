import 'package:habit/core/common/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: .snake)
  const factory UserModel({
    required String id,
    required String authId,
    required String email,
    required String fullName,
    required String phoneNumber,
    required String createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      createdAt: createdAt,
      email: email,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
  }
}
