import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/home/model/auto-matching/auto_matching_request_model.dart';

class AutoMatchingService {
  Future<ApiResponse<dynamic>> requestAutoMatching(
      AutoMatchingRequest request) async {
    final path = '/api/matching/auto/request';

    final uri = Uri.parse(path);

    final response = await ApiClient.post(uri, body: request.toJson());

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      return ApiResponse(
          code: response.code, message: response.message, data: response.data);
    } else {
      throw Exception("자동매칭 요청 실");
    }
  }
}
