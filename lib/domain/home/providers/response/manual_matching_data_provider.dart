import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_data_provider.g.dart';

@riverpod
class MatchingDataNotifier extends _$MatchingDataNotifier {
  final int _pageSize = 5;
  bool _isFetchingMore = false;
  late Future<ApiResponse<MatchingData>> Function(int, int) _fetchService;
  int _currentPage = 0;
  bool _hasMoreData = true;

  @override
  Future<ApiResponse<MatchingData>> build(
      Future<ApiResponse<MatchingData>> Function(int, int) fetchService) async {
    _fetchService = fetchService;
    _currentPage = 0;
    _hasMoreData = true;
    return _fetchData(_currentPage);
  }

  Future<ApiResponse<MatchingData>> _fetchData(int pageNumber) async {
    return await _fetchService(pageNumber, _pageSize);
  }

  Future<void> fetchMoreData() async {
    if (_isFetchingMore || !_hasMoreData) return;
    _isFetchingMore = true;

    try {
      final nextPage = _currentPage + 1;
      final nextResponse = await _fetchData(nextPage);

      final currentData = state.valueOrNull;
      final updatedRooms = [
        ...?currentData?.data?.rooms,
        ...?nextResponse.data?.rooms,
      ];

      _currentPage = nextPage;
      _hasMoreData = !nextResponse.data!.pageable.last;

      final updatedMatchingData = MatchingData(
        rooms: updatedRooms,
        pageable: nextResponse.data!.pageable,
      );

      final mergedApiResponse = ApiResponse(
        code: nextResponse.code,
        message: nextResponse.message,
        data: updatedMatchingData,
      );

      state = AsyncData(mergedApiResponse);
    } catch (e, stackTrace) {
      state = AsyncError<ApiResponse<MatchingData>>(e, stackTrace)
          .copyWithPrevious(state);
    } finally {
      _isFetchingMore = false;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final response = await _fetchData(0);
      _currentPage = 0;
      _hasMoreData = true;
      state = AsyncData(response);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
