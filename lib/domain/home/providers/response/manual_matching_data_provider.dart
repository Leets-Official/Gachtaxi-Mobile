import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/home/model/manual-matching/manual_matching_response_model.dart';
import 'package:gachtaxi_app/domain/home/services/manual_matching_room_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manual_matching_data_provider.g.dart';

@riverpod
class ManualMatchingDataNotifier extends _$ManualMatchingDataNotifier {
  final int _pageSize = 5;

  @override
  Future<ApiResponse<MatchingData>> build() async {
    return _fetchData(0);
  }

  Future<ApiResponse<MatchingData>> _fetchData(int pageNumber) async {
    final response = await ManualMatchingRoomService.fetchMatchingRooms(
        pageNumber, _pageSize);

    if (response == null) {
      throw Exception('매칭방 로딩 중 에러 발생');
    }

    return response;
  }

  Future<void> fetchMoreData() async {
    if (state is AsyncData<ApiResponse<MatchingData>>) {
      final currentData = state.value!;
      final currentPageable = currentData.data?.pageable;

      if (currentPageable == null || currentPageable.last) {
        return;
      }

      final nextPage = currentPageable.pageNumber + 1;

      try {
        final nextResponse = await _fetchData(nextPage);

        final updatedRooms = [
          ...?currentData.data?.rooms,
          ...?nextResponse.data?.rooms,
        ];
        final updatedPageable = nextResponse.data!.pageable;

        final updatedMatchingData = MatchingData(
          rooms: updatedRooms,
          pageable: updatedPageable,
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
      }
    }
  }

  // 새로고침 함수
  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final response = await _fetchData(0);
      state = AsyncData(response);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
