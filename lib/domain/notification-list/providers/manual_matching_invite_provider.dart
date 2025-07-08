import 'package:dio/dio.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/notification-list/services/manual_matching_invite_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_invite_provider.g.dart';

@riverpod
class ManualMatchingInviteNotifier extends _$ManualMatchingInviteNotifier {
  @override
  Future<ApiResponse?> build() async {
    return null;
  }

  Future<void> accept(int matchingRoomId, String notificationId) async {
    final service = ManualMatchingInviteService();
    state = const AsyncLoading();
    try {
      final res = await service.accept(matchingRoomId, notificationId);
      state = AsyncData(res);
    } catch (e, st) {
      final message = e is DioException
          ? e.response?.data['message'] ?? '알 수 없는 서버 오류'
          : e.toString();
      state = AsyncError(Exception(message), st);
      rethrow; // catch(e)에서 .toString()을 사용 가능하게 하기 위해 rethrow 유지
    }
  }
}
