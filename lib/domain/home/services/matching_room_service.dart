import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_response_model.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';

class MatchingRoomService {
  static final Map<String, Map<int, MatchingData>> _cache = {};
  static final Map<String, DateTime> _lastFetchTimes = {};
  static const Duration cacheDuration = Duration(seconds: 3);

  Future<ApiResponse<MatchingData>> fetchMatchingRooms(
      MatchingCategory type, int pageNumber, int pageSize) async {
    final now = DateTime.now();
    final key = type.name;

    if (_cache[key]?.containsKey(pageNumber) == true &&
        _lastFetchTimes[key] != null &&
        now.difference(_lastFetchTimes[key]!) < cacheDuration) {
      return ApiResponse<MatchingData>(
        code: 200,
        message: "캐싱된 데이터",
        data: _cache[key]![pageNumber]!,
      );
    }

    final path = switch (type) {
      MatchingCategory.manual => '/api/matching/manual/list',
      MatchingCategory.my => '/api/matching/manual/my-list',
    };

    final uri = Uri.parse(path).replace(queryParameters: {
      "pageNumber": pageNumber.toString(),
      "pageSize": pageSize.toString(),
    });

    final response = await ApiClient.get(uri);

    if (response.code == 200 && response.data is Map<String, dynamic>) {
      final data = MatchingData.fromJson(response.data);
      _cache[key] ??= {};
      _cache[key]![pageNumber] = data;
      _lastFetchTimes[key] = now;
      return ApiResponse(code: 200, message: "성공", data: data);
    } else {
      throw Exception("매칭방 조회 실패");
    }
  }

  void clearCache(MatchingCategory type) {
    _cache[type.name]?.clear();
    _lastFetchTimes.remove(type.name);
  }
}
