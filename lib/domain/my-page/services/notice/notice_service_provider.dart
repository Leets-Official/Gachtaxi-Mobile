import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/my-page/services/notice/notice_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_service_provider.g.dart';

@riverpod
NoticeService noticeService(Ref ref) {
  return NoticeService();
}
