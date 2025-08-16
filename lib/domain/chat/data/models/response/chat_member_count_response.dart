import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/chat_member_response.dart';

part 'chat_member_count_response.freezed.dart';
part 'chat_member_count_response.g.dart';

@freezed
abstract class ChatMemberCountResponse with _$ChatMemberCountResponse {
  const factory ChatMemberCountResponse({
    required int roomId,
    required int totalParticipantCount,
    required ChatMemberResponse roomMaster,
    required List<ChatMemberResponse> participants,
  }) = _ChatMemberCountResponse;

  factory ChatMemberCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberCountResponseFromJson(json);
}
