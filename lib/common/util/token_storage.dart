import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static final _storage = FlutterSecureStorage();
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  // 개발용 토큰 저장
  static Future<void> saveDevToken() async {
    String devToken = dotenv.env['DEV_ACCESS_TOKEN'] ?? "Bearer null";
    await _storage.write(key: _accessTokenKey, value: devToken);
  }

  // 로그인 시 액세스, 리프레시 토큰 저장
  static Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  // 액세스 토큰 로딩
  static Future<String?> loadAccessToken() {
    return _storage.read(key: _accessTokenKey);
  }

  // 리프레시 토큰 로딩
  static Future<String?> loadRefreshToken() {
    return _storage.read(key: _refreshTokenKey);
  }

  // 토큰 제거
  static Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
