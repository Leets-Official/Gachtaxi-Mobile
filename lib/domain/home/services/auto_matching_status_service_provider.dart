import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/services/auto_matching_status_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_matching_status_service_provider.g.dart';

@riverpod
AutoMatchingStatusService autoMatchingStatusService(Ref ref) {
  return AutoMatchingStatusService();
}
