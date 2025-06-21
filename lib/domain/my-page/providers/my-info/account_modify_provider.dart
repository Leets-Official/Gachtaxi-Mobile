import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/account_modify_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_modify_provider.g.dart';

@riverpod
class AccountModify extends _$AccountModify {
  @override
  AsyncValue<ApiResponse?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> updateAccount(String account) async {
    final service = ref.read(accountModifyServiceProvider);

    state = const AsyncLoading();

    try {
      final res = await service.updateAccount(account);
      state = AsyncData(res.data as ApiResponse?);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
