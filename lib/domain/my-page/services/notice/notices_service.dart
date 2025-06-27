import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/my-page/model/notice/notices_model.dart';

class NoticesService {
  Future<ApiResponse<NoticesData>> fetchNotices(
      int pageNumber, int pageSize) async {
    final path = '/api/notices/list';

    final uri = Uri.parse(path).replace(queryParameters: {
      "pageNumber": pageNumber.toString(),
      "pageSize": pageSize.toString(),
    });

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      final data = NoticesData.fromJson(response.data);
      return ApiResponse(
          code: response.code, message: response.message, data: data);
    } else {
      throw Exception("공지사항 조회 실패");
    }
  }
}
