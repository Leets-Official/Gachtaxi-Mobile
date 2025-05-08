import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_response_model.dart';
import 'package:gachtaxi_app/domain/home/services/matching_room_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_data_provider.g.dart';

@riverpod
class MatchingDataNotifier extends _$MatchingDataNotifier {
  final int _pageSize = 5;
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isFetchingMore = false;
  late MatchingCategory _roomType;

  @override
  Future<ApiResponse<MatchingData>> build(MatchingCategory type) async {
    _roomType = type;
    _currentPage = 0;
    _hasMore = true;
    return await _fetchPage(_currentPage);
  }

  Future<ApiResponse<MatchingData>> _fetchPage(int page) async {
    final service = ref.read(matchingRoomServiceProvider);
    return await service.fetchMatchingRooms(_roomType, page, _pageSize);
  }

  Future<void> fetchMore() async {
    if (_isFetchingMore || !_hasMore) return;
    _isFetchingMore = true;

    try {
      final nextPage = _currentPage + 1;
      final nextResponse = await _fetchPage(nextPage);
      final current = state.valueOrNull;

      final updatedRooms = [
        ...?current?.data?.rooms,
        ...?nextResponse.data?.rooms,
      ];

      _hasMore = !nextResponse.data!.pageable.isLast;
      _currentPage = nextPage;

      final merged = ApiResponse(
        code: nextResponse.code,
        message: nextResponse.message,
        data: MatchingData(
          rooms: updatedRooms,
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
    state = const AsyncLoading();
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
