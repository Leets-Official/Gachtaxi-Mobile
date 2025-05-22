import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/my-page/model/my-info/my_info_model.dart';

class ResignService {
  Future<ApiResponse<UserData>> fetchInfo() async {
    final path = '/api/members';

    final uri = Uri.parse(path);

    final response = await ApiClient.delete(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      return ApiResponse(
          code: response.code, message: response.message, data: null);
    } else {
      throw Exception("회원탈퇴 실패");
    }
  }
}
