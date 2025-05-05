import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_matching_repository.g.dart';

@riverpod
ChatMatchingRepository chatMatchingRepository(Ref ref) =>
    ChatMatchingRepository();

class ChatMatchingRepository {
  static const String MATCHING_ROOM_PATH = "/api/matching";

  // 매칭 나가기 (수동 / 자동)
  Future<bool> exitMatching(MatchingCategory category, int matchingRoomId) async {
    try {
      final response = category == MatchingCategory.manual
          ? await ApiClient.patch(
              Uri.parse('$MATCHING_ROOM_PATH/manual/exit/$matchingRoomId'))
          : await ApiClient.post(
              Uri.parse('$MATCHING_ROOM_PATH/auto/cancel'),
              body: {"roomId": matchingRoomId},
            );

      return response.code == 200;
    } catch (e) {
      rethrow;
    }
  }

  // 자동+수동 모두 manual로 API 요청
  Future<bool> completeMatching(MatchingCategory category, int matchingRoomId) async {
    try {
      final response = await ApiClient.patch(
          Uri.parse('$MATCHING_ROOM_PATH/manual/$matchingRoomId/complete'));

      return response.code == 200;
    } catch (e) {
      rethrow;
    }
  }
}
