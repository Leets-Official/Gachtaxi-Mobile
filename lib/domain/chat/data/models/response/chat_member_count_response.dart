import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_member_count_response.freezed.dart';
part 'chat_member_count_response.g.dart';

@freezed
class ChatMemberCountResponse with _$ChatMemberCountResponse {
  const factory ChatMemberCountResponse({
    required int roomId,
    required int totalParticipantCount,
  }) = _ChatMemberCountResponse;

  factory ChatMemberCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberCountResponseFromJson(json);
}


