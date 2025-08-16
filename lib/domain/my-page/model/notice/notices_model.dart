import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';

part 'notices_model.freezed.dart';
part 'notices_model.g.dart';

@freezed
abstract class NoticesData with _$NoticesData {
  const factory NoticesData({
    required List<Notice> notices,
    required Pageable pageable,
  }) = _NoticesData;

  factory NoticesData.fromJson(Map<String, dynamic> json) =>
      _$NoticesDataFromJson(json);
}

@freezed
abstract class Notice with _$Notice {
  const factory Notice({
    required int noticeId,
    required String title,
    required String content,
    required String createDate,
  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}
