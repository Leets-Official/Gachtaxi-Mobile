import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL'] ?? "http://localhost:8080",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra["skipAuth"] == true) {
            logger.i("🔓 Authorization 헤더 없이 요청 진행됨 (skipAuth: true)");
            return handler.next(options);
          }

          final token = await TokenStorage.loadAccessToken();

          if (token != null) {
            options.headers["Authorization"] = 'Bearer $token';
          }

          logger.i("📤 [API 요청] ${options.method} ${options.uri}");
          logger.d("🔹 요청 헤더: ${options.headers}");
          if (options.data != null) {
            logger.d("🔹 요청 본문: ${options.data}");
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i(
              "📥 [API 응답] ${response.statusCode} ${response.requestOptions.uri}");
          logger.d("🔹 응답 본문: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          logger.e(
              "❌ [API 오류] ${error.response?.statusCode} ${error.requestOptions.uri}");
          logger.e("🔹 오류 응답: ${error.response?.data}");
          return handler.next(error);
        },
      ),
    );

  // GET
  static Future<ApiResponse> get(Uri uri) async {
    try {
      final response = await _dio.getUri(uri);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // POST
  static Future<ApiResponse> post(Uri uri, {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.postUri(uri, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // Post with headers
  static Future<Response> postWithHeaders(Uri uri,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.postUri(
        uri,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
          extra: {
            "skipAuth": true,
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PATCH
  static Future<ApiResponse> patch(Uri uri,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.patchUri(uri, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // PUT
  static Future<ApiResponse> put(Uri uri, {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.putUri(uri, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // DELETE
  static Future<ApiResponse> delete(Uri uri,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.deleteUri(uri, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }
}
