import 'package:freezed_annotation/freezed_annotation.dart';

part 'manual_matching_response_model.freezed.dart';
part 'manual_matching_response_model.g.dart';

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

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    required int pageNumber,
    required int pageSize,
    required int numberOfElements,
    required bool isLast,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
}

@freezed
class MatchingData with _$MatchingData {
  const factory MatchingData({
    required List<MatchingRoom> rooms,
    required Pageable pageable,
  }) = _MatchingData;

  factory MatchingData.fromJson(Map<String, dynamic> json) =>
      _$MatchingDataFromJson(json);
}

@freezed
class ManualMatchingResponse with _$ManualMatchingResponse {
  const factory ManualMatchingResponse({
    required int code,
    required String message,
    required MatchingData data,
  }) = _ManualMatchingResponse;

  factory ManualMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$ManualMatchingResponseFromJson(json);
}
