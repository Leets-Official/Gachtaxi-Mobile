import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/domain/landing/model/auth_result.dart';

class GoogleAuthService {
  static Future<AuthResult?> loginWithGoogle(BuildContext context) async {
    final GoogleSignIn signIn = GoogleSignIn.instance;

    try {
      // 최신 API에서는 먼저 initialize() 호출
      await signIn.initialize(
        clientId: dotenv.env['GOOGLE_WEB_CLIENT_ID'],
        serverClientId: dotenv.env['GOOGLE_WEB_CLIENT_ID'],
      );

      // 기존 로그인 세션 제거
      await GoogleSignIn.instance.disconnect();

      // 로그인 시도
      final account = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile'],
      );

      // 서버 Auth Code 요청
      final serverAuth = await account.authorizationClient.authorizeServer([
        'email',
        'profile',
      ]);

      if (serverAuth == null || serverAuth.serverAuthCode.isEmpty) {
        logger.e('serverAuthCode is null');
        return null;
      }

      final authCode = serverAuth.serverAuthCode;

      if (serverAuth.serverAuthCode.isEmpty) {
        logger.e('authCode is null');
        return null;
      }

      final response = await ApiClient.postWithHeaders(
        Uri.parse('${dotenv.env['API_URL']}/auth/login/google'),
        body: {'authCode': authCode},
      );

      final accessToken = response.headers['Authorization']?.first;
      final refreshToken = response.headers['RefreshToken']?.first;

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
      final status = data?['status'];
      final user = data?['memberResponseDto'];

      if (status == null) {
        logger.e('서버 응답의 status가 null입니다: $data');
        return null;
      }

      return AuthResult(
        status: status,
        user: user,
        isUnregistered: status == 'UN_REGISTER',
      );
    } catch (e) {
      logger.e('구글 로그인 실패: $e');
      ToastShowUtils(context: context).showSuccess('Google 로그인 중 문제가 발생했어요.');
      return null;
    }
  }
}
