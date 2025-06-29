import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/my-page/model/my-info/my_info_model.dart';

class MyInfoService {
  Future<ApiResponse<UserData>> fetchInfo() async {
    final path = '/api/members/info';

    final uri = Uri.parse(path);

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      final data = UserData.fromJson(response.data);
      return ApiResponse(
          code: response.code, message: response.message, data: data);
    } else {
      throw Exception("유저정보 조회 실패");
    }
  }
}
