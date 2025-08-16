import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_room_model.dart';

part 'manual_matching_response_model.freezed.dart';
part 'manual_matching_response_model.g.dart';

@freezed
abstract class MatchingData with _$MatchingData {
  const factory MatchingData({
    required List<MatchingRoom> rooms,
    required Pageable pageable,
  }) = _MatchingData;

  factory MatchingData.fromJson(Map<String, dynamic> json) =>
      _$MatchingDataFromJson(json);
}
