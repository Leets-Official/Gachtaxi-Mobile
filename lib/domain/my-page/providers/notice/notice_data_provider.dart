import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/my-page/model/notice/notices_model.dart';
import 'package:gachtaxi_app/domain/my-page/providers/notice/notices_data_provider.dart';
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
    // final service = ref.read(noticeServiceProvider);
    // return await service.fetchNotice(noticeId);

    final mockData = Notice(
      noticeId: noticeId,
      title: "가치택시 운영진 팀입니다",
      content: "안녕히세요 ....",
      createDate: "2025-05-10",
    );

    return ApiResponse(
      code: 200,
      message: '목데이터 조회 성공',
      data: mockData,
    );
  }
}
