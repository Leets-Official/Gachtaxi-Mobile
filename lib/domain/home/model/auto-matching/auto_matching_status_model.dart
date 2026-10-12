import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_matching_status_model.freezed.dart';
part 'auto_matching_status_model.g.dart';

@freezed
abstract class AutoMatchingStatusModel with _$AutoMatchingStatusModel {
  const factory AutoMatchingStatusModel({
    required bool isFound,
    int? currentMembers,
    int? maxCapacity,
    int? roomId,
    int? chattingRoomId,
  }) = _AutoMatchingStatusModel;

  factory AutoMatchingStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AutoMatchingStatusModelFromJson(json);
}
