import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_join_service.g.dart';

@riverpod
class ManualMatchingJoinService extends _$ManualMatchingJoinService {
  @override
  AsyncValue<ApiResponse?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> join(int roomId) async {
    state = const AsyncLoading();

    const String path = '/api/matching/manual/join';
    final uri = Uri.parse(path);

    try {
      final response = await ApiClient.post(uri, body: {"roomId": roomId});
      state = AsyncValue.data(response);
    } catch (e, stack) {
      state = AsyncValue.error(Exception("매칭방 참여 실패"), stack);
    }
  }
}
