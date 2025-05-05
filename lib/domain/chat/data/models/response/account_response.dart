import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_response.freezed.dart';
part 'account_response.g.dart';

@freezed
class AccountResponse with _$AccountResponse {
  const factory AccountResponse({
    required int userId,
    required int studentNumber,
    required String nickName,
    required String realName,
    String? profilePicture,
    required String email,
    required String role,
    required String gender,
    String? accountNumber,
  }) = _AccountResponse;

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);
}
