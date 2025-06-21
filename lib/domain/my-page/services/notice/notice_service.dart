import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/my-page/model/notice/notices_model.dart';

class NoticeService {
  Future<ApiResponse<Notice>> fetchNotice(int noticeId) async {
    final path = '/api/notice/$noticeId';

    final uri = Uri.parse(path);

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      final data = Notice.fromJson(response.data);
      return ApiResponse(
          code: response.code, message: response.message, data: data);
    } else {
      throw Exception("상세공지 조회 실패");
    }
  }
}
