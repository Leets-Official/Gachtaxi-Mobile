import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/common/model/pageable_model.dart';
import 'package:gachtaxi_app/domain/my-page/model/notice/notices_model.dart';
import 'package:gachtaxi_app/domain/my-page/services/notice/notices_service.dart';
import 'package:gachtaxi_app/domain/my-page/services/notice/notices_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notices_data_provider.g.dart';

@riverpod
class NoticesDataNotifier extends _$NoticesDataNotifier {
  final int _pageSize = 10;
  int _currentPage = 0;
  bool _hasMore = true;
  bool _isFetchingMore = false;

  @override
  Future<ApiResponse<NoticesData>> build() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchPage(_currentPage);
  }

  Future<ApiResponse<NoticesData>> _fetchPage(int page) async {
    final service = ref.read(noticesServiceProvider);
    return await service.fetchNotices(page, _pageSize);
  }

  Future<void> fetchMore() async {
    if (_isFetchingMore || !_hasMore) return;
    _isFetchingMore = true;

    try {
      final nextPage = _currentPage + 1;
      final nextResponse = await _fetchPage(nextPage);
      final current = state.valueOrNull;

      final updatedNotices = [
        ...?current?.data?.notices,
        ...?nextResponse.data?.notices,
      ];

      _hasMore = !nextResponse.data!.pageable.isLast;
      _currentPage = nextPage;

      final merged = ApiResponse(
        code: nextResponse.code,
        message: nextResponse.message,
        data: NoticesData(
          notices: updatedNotices,
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
