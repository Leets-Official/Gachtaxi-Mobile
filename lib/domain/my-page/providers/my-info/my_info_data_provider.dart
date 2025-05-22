import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/my-page/model/my-info/my_info_model.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/my_info_service.dart';
import 'package:gachtaxi_app/domain/my-page/services/my-info/my_info_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_info_data_provider.g.dart';

@riverpod
class MyInfoDataNotifier extends _$MyInfoDataNotifier {
  @override
  Future<ApiResponse<UserData>> build() async {
    return await _fetchPage();
  }

  Future<ApiResponse<UserData>> _fetchPage() async {
    final service = ref.read(myInfoServiceProvider);
    return await service.fetchInfo();
  }
}
