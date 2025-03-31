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
  static Future<ApiResponse> get(String path,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(path, queryParameters: params);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // POST
  static Future<ApiResponse> post(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.post(path, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // PATCH
  static Future<ApiResponse> patch(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.patch(path, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // PUT
  static Future<ApiResponse> put(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.put(path, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  // DELETE
  static Future<ApiResponse> delete(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.delete(path, data: body);

      return ApiResponse<dynamic>.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }
}
