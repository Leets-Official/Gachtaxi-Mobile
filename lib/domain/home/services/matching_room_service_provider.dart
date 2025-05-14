import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/services/matching_room_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matching_room_service_provider.g.dart';

@riverpod
MatchingRoomService matchingRoomService(Ref ref) {
  return MatchingRoomService();
}
