import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/my-page/model/my-info/my_info_model.dart';

class AccountModifyService {
  Future<ApiResponse<UserData>> updateAccount(String account) async {
    final path = '/api/accounts';

    final uri = Uri.parse(path);

    final res = await ApiClient.post(uri, body: {
      'accountNumber': account,
    });

    if (res.code == 200 && res.data is Map<String, dynamic>) {
      final data = UserData.fromJson(res.data);
      return ApiResponse(code: res.code, message: res.message, data: data);
    } else {
      throw Exception("계좌번호 수정 실패");
    }
  }
}
