import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/my-page/model/notice/notices_model.dart';
import 'package:gachtaxi_app/domain/my-page/services/notice/notice_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_data_provider.g.dart';

@riverpod
class NoticeDataNotifier extends _$NoticeDataNotifier {
  @override
  Future<ApiResponse<Notice>> build(int noticeId) async {
    return await _fetchPage(noticeId);
  }

  Future<ApiResponse<Notice>> _fetchPage(int noticeId) async {
    final service = ref.read(noticeServiceProvider);
    return await service.fetchNotice(noticeId);
  }
}
