import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/services/auto_matching_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_matching_service_provider.g.dart';

@riverpod
AutoMatchingService autoMatchingService(Ref ref) {
  return AutoMatchingService();
}