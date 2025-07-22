import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/domain/landing/model/auth_result.dart';

class KakaoAuthService {
  static Future<AuthResult?> loginWithKakao(BuildContext context) async {
    try {
      OAuthToken token;

      if (await isKakaoTalkInstalled()) {
        try {
          token = await UserApi.instance.loginWithKakaoTalk();
        } catch (e) {
          token = await UserApi.instance.loginWithKakaoAccount();
        }
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }

      final response = await ApiClient.postWithHeaders(
        Uri.parse('${dotenv.env['API_URL']}/auth/login/mobile/kakao'),
        body: {'accessToken': token.accessToken},
      );

      final accessToken = response.headers['Authorization']?.first;

      if (accessToken != null ) {
        await TokenStorage.saveTokens(
          accessToken: accessToken,
        );
        logger.i('헤더에서 토큰 저장 완료');
      } else {
        logger.e('응답 헤더에서 토큰을 찾을 수 없습니다');
      }

      final data = response.data['data'];
      final status = data['status'];
      final user = data['memberResponseDto'];

      return AuthResult(
        status: status,
        user: user,
        isUnregistered: status == 'UN_REGISTER',
      );
    } catch (e) {
      logger.e('카카오 로그인 실패: $e');
      ToastShowUtils(context: context).showSuccess('Kakao 로그인 중 문제가 발생했어요.');
      return null;
    }
  }
}
