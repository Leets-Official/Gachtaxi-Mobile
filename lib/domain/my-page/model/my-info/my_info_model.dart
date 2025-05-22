import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_info_model.freezed.dart';
part 'my_info_model.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required int userId,
    required int studentNumber,
    required String nickName,
    required String realName,
    String? profilePicture,
    required String email,
    required String role,
    required String gender,
    String? accountNumber,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
