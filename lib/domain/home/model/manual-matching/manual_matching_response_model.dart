import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';

part 'manual_matching_response_model.freezed.dart';
part 'manual_matching_response_model.g.dart';

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
