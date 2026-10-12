import 'package:gachtaxi_app/common/model/api_response.dart';
import 'package:gachtaxi_app/domain/home/model/auto-matching/auto_matching_status_model.dart';
import 'package:gachtaxi_app/domain/home/services/auto_matching_status_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_matching_status_provider.g.dart';

@riverpod
class AutoMatchingStatusNotifier extends _$AutoMatchingStatusNotifier {
  @override
  Future<ApiResponse<AutoMatchingStatusModel>> build() async {
    return await _fetchStatus();
  }

  Future<ApiResponse<AutoMatchingStatusModel>> _fetchStatus() async {
    final service = ref.read(autoMatchingStatusServiceProvider);
    return await service.getAutoMatchingStatus();
  }
}
