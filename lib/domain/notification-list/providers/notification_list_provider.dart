import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/notification-list/model/notification_list_model.dart';
import 'package:gachtaxi_app/domain/notification-list/services/notification_list_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_list_provider.g.dart';

final mockNotificationListData = NotificationListData(
  response: [
    MatchStartNotification(
      notificationId: "1",
      receiverId: 101,
      content: "곧 매칭 시간이에요",
      payload: MatchPayload(
        startLocationName: "서울역",
        endLocationName: "강남역",
      ),
      createdAt: "2025-05-22T12:00:00Z",
    ),
    MatchFinishedNotification(
      notificationId: "2",
      receiverId: 101,
      content: "매칭이 종료되었어요",
      payload: MatchPayload(
        startLocationName: "서울역",
        endLocationName: "강남역",
      ),
      createdAt: "2025-07-04T13:00:00Z",
    ),
    FriendRequestNotification(
      notificationId: "3",
      receiverId: 101,
      content: "닉네임님이 친구 요청을 보냈습니다.",
      payload: FriendRequestPayload(
        status: "PENDING",
        senderId: 202,
      ),
      createdAt: "2025-07-01T14:00:00Z",
    ),
    MatchInviteNotification(
      notificationId: "4",
      receiverId: 101,
      content: "닉네임님이 매칭방에 초대했습니다.",
      payload: MatchingRequestPayload(
        senderNickname: "닉네임",
        matchingRoomId: 303,
      ),
      createdAt: "2025-07-02T15:00:00Z",
    ),
    MatchInviteNotification(
      notificationId: "4",
      receiverId: 101,
      content: "닉네임님이 매칭방에 초대했습니다.",
      payload: MatchingRequestPayload(
        senderNickname: "닉네임",
        matchingRoomId: 303,
      ),
      createdAt: "2025-03-15T15:00:00Z",
    ),
  ],
  pageable: Pageable(
    pageNumber: 0,
    pageSize: 5,
    numberOfElements: 4,
    isLast: true,
  ),
);

final mockNotificationListResponse = ApiResponse<NotificationListData>(
  code: 200,
  message: "성공",
  data: mockNotificationListData,
);

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

    // await Future.delayed(const Duration(milliseconds: 500)); // 로딩 흉내
    // return mockNotificationListResponse;
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
