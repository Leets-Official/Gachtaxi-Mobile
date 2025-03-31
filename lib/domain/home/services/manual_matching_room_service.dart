import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_response_model.dart';

class ManualMatchingRoomService {
  static final Map<int, MatchingData> _cache = {};
  static DateTime? _lastFetchTime;
  static const Duration cacheDuration = Duration(minutes: 3);

  static Future<ApiResponse<MatchingData>?> fetchMatchingRooms(
      int pageNumber, int pageSize) async {
    final now = DateTime.now();

    if (_cache.containsKey(pageNumber) &&
        _lastFetchTime != null &&
        now.difference(_lastFetchTime!) < cacheDuration) {
      return ApiResponse<MatchingData>(
        code: 200,
        message: "캐싱데이터",
        data: _cache[pageNumber]!,
      );
    }

    const String fetchMatchingRoomPath = '/api/matching/manual/list';
    final uri = Uri.parse(fetchMatchingRoomPath).replace(
      queryParameters: {
        "pageNumber": pageNumber.toString(),
        "pageSize": pageSize.toString(),
      },
    );

    try {
      final response = await ApiClient.get(uri.toString());

      if (response.code == 200) {
        final data = response.data;
        if (data != null && data is Map<String, dynamic>) {
          final matchingData = MatchingData.fromJson(data);

          _cache[pageNumber] = matchingData;
          _lastFetchTime = now;

          return ApiResponse<MatchingData>(
            code: response.code,
            message: response.message,
            data: matchingData,
          );
        }
      } else {
        throw Exception("수동 매칭방 조회 실패");
      }
    } catch (e, stackTrace) {
      logger.e('매칭방 로딩 중 에러 발생: $e');
      logger.e('스택 트레이스: $stackTrace');
    }

    return null;
  }

  static void clearCache() {
    _cache.clear();
    _lastFetchTime = null;
  }
}
