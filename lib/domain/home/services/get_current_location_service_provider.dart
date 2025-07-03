import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/services/get_current_location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_current_location_service_provider.g.dart';

@riverpod
GetCurrentLocationService getCurrentLocationService(Ref ref) {
  return GetCurrentLocationService();
}
