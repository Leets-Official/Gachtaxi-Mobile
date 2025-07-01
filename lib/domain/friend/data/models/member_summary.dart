import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/enums/gender_model.dart';

part 'member_summary.freezed.dart';
part 'member_summary.g.dart';

@freezed
class MemberSummary with _$MemberSummary {
  const factory MemberSummary({
    required int userId,
    required String nickname,
    required String profilePicture,
    required Gender gender,
  }) = _MemberSummary;

  factory MemberSummary.fromJson(Map<String, dynamic> json) =>
      _$MemberSummaryFromJson(json);
}
