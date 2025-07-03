import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';

final emailVerificationProvider =
StateNotifierProvider<EmailVerificationService, AsyncValue<ApiResponse?>>(
      (ref) => EmailVerificationService(),
);

class EmailVerificationService
    extends StateNotifier<AsyncValue<ApiResponse?>> {
  EmailVerificationService() : super(const AsyncValue.data(null));

  Future<void> sendCode(String email) async {
    state = const AsyncLoading<ApiResponse?>();
    const String path = '/auth/code/mail';
    final uri = Uri.parse(path);

    try {
      final response = await ApiClient.post(uri, body: {
        "email": email,
      });
      state = AsyncValue.data(response);
    } catch (e, stack) {
      state = AsyncValue.error(Exception("이메일 인증 요청 실패"), stack);
      rethrow;
    }
  }

  Future<void> verifyCode(String email, String authCode) async {
    state = const AsyncLoading();
    const path = '/auth/code/mail';
    final uri = Uri.parse(path);

    try {
      final response = await ApiClient.patch(uri, body: {
        "email": email,
        "authCode": authCode,
      });
      state = AsyncValue.data(response);
    } catch (e, stack) {
      state = AsyncValue.error(Exception("인증번호 확인 실패"), stack);
      rethrow;
    }
  }
}
