import 'package:dio/dio.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/services/notification_list_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_list_provider.g.dart';

@riverpod
class NotificationListNotifier extends _$NotificationListNotifier {
  final int _pageSize = 5;
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isFetchingMore = false;

  @override
  Future<ApiResponse<NotificationListData>> build() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchPage(_currentPage);
  }

  Future<ApiResponse<NotificationListData>> _fetchPage(int page) async {
    final service = ref.read(notificationListServiceProvider);
    return await service.fetchNotificationService(page, _pageSize);
  }

  Future<void> fetchMore() async {
    if (_isFetchingMore || !_hasMore) return;
    _isFetchingMore = true;

    try {
      final nextPage = _currentPage + 1;
      final nextResponse = await _fetchPage(nextPage);
      final current = state.valueOrNull;

      final updatedList = [
        ...?current?.data?.response,
        ...?nextResponse.data?.response,
      ];

      _hasMore = !nextResponse.data!.pageable.isLast;
      _currentPage = nextPage;

      final merged = ApiResponse(
        code: nextResponse.code,
        message: nextResponse.message,
        data: NotificationListData(
          response: updatedList,
          pageable: nextResponse.data!.pageable,
        ),
      );

      state = AsyncData(merged);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    } finally {
      _isFetchingMore = false;
    }
  }

  Future<void> removeNotification(String notificationId) async {
    final service = ref.read(notificationListServiceProvider);
    final current = state.valueOrNull;

    if (current == null || current.data == null) return;

    final originalList = current.data!.response;
    final updatedList = List<NotificationModel>.from(originalList)
      ..removeWhere((n) => n.notificationId == notificationId);

    state = AsyncData(ApiResponse(
      code: current.code,
      message: current.message,
      data: NotificationListData(
        response: updatedList,
        pageable: current.data!.pageable,
      ),
    ));

    try {
      await service.deleteNotificationService(notificationId);
    } catch (e) {
      state = AsyncData(ApiResponse(
        code: current.code,
        message: current.message,
        data: NotificationListData(
          response: originalList,
          pageable: current.data!.pageable,
        ),
      ));

      if (e is DioException) {
        final serverMessage = e.response?.data['message'] ?? '삭제 중 오류가 발생했습니다.';
        throw Exception(serverMessage);
      } else {
        throw Exception('알 수 없는 오류가 발생했습니다.');
      }
    }
  }

  Future<void> refresh() async {
    _currentPage = 0;
    _hasMore = true;

    try {
      final response = await _fetchPage(0);
      state = AsyncData(response);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
