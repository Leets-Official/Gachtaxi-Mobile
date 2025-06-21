import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/my-page/services/notice/notices_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notices_service_provider.g.dart';

@riverpod
NoticesService noticesService(Ref ref) {
  return NoticesService();
}
