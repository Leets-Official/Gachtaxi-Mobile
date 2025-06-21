import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/my-page/model/my-info/my_info_model.dart';

class InfoModifyService {
  Future<ApiResponse<UserData>> updateInfo(
      String? profile, String? nickName) async {
    final path = '/api/members/info';

    final uri = Uri.parse(path);

    final res = await ApiClient.patch(uri, body: {
      'profilePicture': profile,
      'nickName': nickName,
    });

    if (res.code == 200 && res.data is Map<String, dynamic>) {
      final data = UserData.fromJson(res.data);
      return ApiResponse(code: res.code, message: res.message, data: data);
    } else {
      throw Exception("회원정보 수정 실패");
    }
  }
}
