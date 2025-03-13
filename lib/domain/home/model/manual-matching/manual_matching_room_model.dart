import 'package:freezed_annotation/freezed_annotation.dart';

part 'manual_matching_room_model.freezed.dart';
part 'manual_matching_room_model.g.dart';

@freezed
class MatchingRoom with _$MatchingRoom {
  const factory MatchingRoom({
    required int roomId,
    required int chattingRoomId,
    required String nickname,
    String? profilePicture,
    required String description,
    required String departure,
    required String destination,
    required DateTime departureTime,
    required String departureDate,
    required int maxCapacity,
    required int currentMembers,
    required List<String> tags,
  }) = _MatchingRoom;

  factory MatchingRoom.fromJson(Map<String, dynamic> json) =>
      _$MatchingRoomFromJson(json);
}
