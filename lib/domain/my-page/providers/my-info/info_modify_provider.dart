import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/info_modify_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_modify_provider.g.dart';

@riverpod
class InfoModify extends _$InfoModify {
  @override
  AsyncValue<ApiResponse?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> updateInfo(String? profile, String? nickName) async {
    final service = ref.read(infoModifyServiceProvider);

    state = const AsyncLoading();

    try {
      final res = await service.updateInfo(profile, nickName);

      state = AsyncData(res.data as ApiResponse?);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
