import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/home/model/auto-matching/auto_matching_status_model.dart';

class AutoMatchingStatusService {
  Future<ApiResponse<AutoMatchingStatusModel>> getAutoMatchingStatus() async {
    final path = '/api/matching/auto/status';

    final uri = Uri.parse(path);

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      final statusModel = AutoMatchingStatusModel.fromJson(response.data);

      return ApiResponse(
          code: response.code, message: response.message, data: statusModel);
    } else {
      throw Exception("자동매칭 상태 반환 실패");
    }
  }
}
