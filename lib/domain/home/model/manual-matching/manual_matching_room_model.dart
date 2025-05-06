import 'package:freezed_annotation/freezed_annotation.dart';

part 'manual_matching_room_model.freezed.dart';
part 'manual_matching_room_model.g.dart';

@freezed
class MatchingRoom with _$MatchingRoom {
  const factory MatchingRoom({
    required int roomId,
    required int chattingRoomId,
    String? nickname,
    String? profilePicture,
    String? gender,
    required String description,
    required String departure,
    required String destination,
    required String departureTime,
    String? departureDate,
    required int maxCapacity,
    required int currentMembers,
    required List<String> tags,
  }) = _MatchingRoom;

  factory MatchingRoom.fromJson(Map<String, dynamic> json) =>
      _$MatchingRoomFromJson(json);
}
