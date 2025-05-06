import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/enums/matching_category.dart';
import 'package:gachtaxi_app/domain/chat/data/repository/chat_matching_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_matching_service.g.dart';

@riverpod
ChatMatchingService chatMatchingService(Ref ref) {
  return ChatMatchingService(
    matchingRepository: ref.watch(chatMatchingRepositoryProvider),
  );
}

class ChatMatchingService {
  final ChatMatchingRepository _matchingRepository;


  const ChatMatchingService({
    required ChatMatchingRepository matchingRepository,
  })  : _matchingRepository = matchingRepository;

  // 매칭 마감
  Future<bool> completeMatching(MatchingCategory category, int matchingRoomId) {
    return _matchingRepository.completeMatching(category, matchingRoomId);
  }

  // 매칭 나가기
  Future<bool> exitMatching(MatchingCategory category, int matchingRoomId) {
    return _matchingRepository.exitMatching(category, matchingRoomId);
  }
}

