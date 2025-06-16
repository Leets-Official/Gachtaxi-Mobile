import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_member_response.freezed.dart';
part 'chat_member_response.g.dart';

@freezed
class ChatMemberResponse with _$ChatMemberResponse {
  const factory ChatMemberResponse({
    required int memberId,
    required String nickName,
    required String profilePicture,
  }) = _ChatMemberResponse;

  factory ChatMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberResponseFromJson(json);
}
