import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/domain/chat/data/models/response/account_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repository.g.dart';

@riverpod
AccountRepository accountRepository(Ref ref) =>
    AccountRepository();

class AccountRepository {
  static const String ACCOUNT_PATH = "/api/accounts";

  // 계좌 조회
  Future<AccountResponse> getAccount() async {
    try {
      final response = await ApiClient.get(
        Uri.parse(ACCOUNT_PATH),
      );

      if (response.code == 200) {
        return AccountResponse.fromJson(response.data);
      } else {
        throw Exception('계좌 조회 실패: ${response.code}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // 계좌 입력
  Future<AccountResponse> postAccount(String accountNumber) async {
    try {
      final response = await ApiClient.post(
        Uri.parse(ACCOUNT_PATH),
        body: {
          'accountNumber': accountNumber,
        },
      );

      if (response.code == 200) {
        return AccountResponse.fromJson(response.data);
      } else {
        throw Exception('계좌 입력 실패: ${response.code}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
