import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:gachtaxi_app/common/util/logger.dart';

class GoogleAuthResult {
  final String? status;
  final Map<String, dynamic>? user;
  final bool isUnregistered;

  GoogleAuthResult({
    required this.status,
    required this.user,
    required this.isUnregistered,
  });
}

class GoogleAuthService {
  static Future<GoogleAuthResult?> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        scopes: ['email', 'profile'],
        serverClientId: dotenv.env['GOOGLE_WEB_CLIENT_ID'],
      );
      print('GOOGLE_WEB_CLIENT_ID: ${dotenv.env['GOOGLE_WEB_CLIENT_ID']}');

      await googleSignIn.signOut();
      await googleSignIn.disconnect();

      final GoogleSignInAccount? account = await googleSignIn.signIn();
      print('GoogleSignInAccount: $account');

      if (account == null) {
        logger.e('사용자가 로그인 취소함');
        return null;
      }

      final authCode = account.serverAuthCode;

      print("authCode: $authCode");

      if (authCode == null) {
        logger.e('authCode is null');
        return null;
      }

      final response = await ApiClient.postWithHeaders(
        Uri.parse('${dotenv.env['API_URL']}/auth/login/google'),
        body: {'authCode': authCode},
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
      final status = data?['status'];
      final user = data?['memberResponseDto'];

      if (status == null) {
        logger.e('서버 응답의 status가 null입니다: $data');
        return null;
      }

      return GoogleAuthResult(
        status: status,
        user: user,
        isUnregistered: status == 'UN_REGISTER',
      );
    } catch (e) {
      logger.e('구글 로그인 실패: $e');
      return null;
    }
  }
}
