import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:gachtaxi_app/common/util/logger.dart';

class KakaoAuthResult {
  final String? status;
  final Map<String, dynamic>? user;
  final bool isUnregistered;

  KakaoAuthResult({
    required this.status,
    required this.user,
    required this.isUnregistered,
  });
}

class KakaoAuthService {
  static Future<KakaoAuthResult?> loginWithKakao() async {
    try {
      OAuthToken token;

      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }

      logger.i('카카오 로그인 성공: ${token.accessToken}');

      final response = await ApiClient.postWithHeaders(
        Uri.parse('${dotenv.env['API_URL']}/auth/login/mobile/kakao'),
        body: {'accessToken': token.accessToken},
      );

      final headers = response.headers;
      final accessToken = headers['Authorization']?.first;
      final refreshToken = headers['RefreshToken']?.first;

      if (accessToken != null && refreshToken != null) {
        await TokenStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
        logger.i('헤더에서 토큰 저장 완료');
      } else {
        logger.e('응답 헤더에서 토큰을 찾을 수 없습니다');
      }

      final data = response.data['data'];
      final status = data['status'];
      final user = data['memberResponseDto'];

      return KakaoAuthResult(
        status: status,
        user: user,
        isUnregistered: status == 'UN_REGISTER',
      );
    } catch (e) {
      logger.e('카카오 로그인 실패: $e');
      return null;
    }
  }
}
