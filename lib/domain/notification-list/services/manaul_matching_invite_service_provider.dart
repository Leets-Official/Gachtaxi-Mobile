import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/notification-list/services/manual_matching_invite_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manaul_matching_invite_service_provider.g.dart';

@riverpod
ManualMatchingInviteService manualMatchingInviteService(Ref ref) {
  return ManualMatchingInviteService();
}
