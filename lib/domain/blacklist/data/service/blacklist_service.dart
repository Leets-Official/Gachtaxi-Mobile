import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/blacklist/data/models/blacklist_response.dart';
import 'package:gachtaxi_app/domain/blacklist/data/repository/blacklist_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blacklist_service.g.dart';

@Riverpod(keepAlive: true)
BlacklistService blacklistService(Ref ref) =>
    BlacklistService(ref.read(blacklistRepositoryProvider));

class BlacklistService {
  final BlacklistRepository _blacklistRepository;

  BlacklistService(this._blacklistRepository);

  Future<BlacklistResponse> getBlacklists(int pageNum) async {
    final response = await _blacklistRepository.getBlacklists(pageNum);
    return response;
  }

  Future<void> deleteBlacklist(int receiverId) async {
    await _blacklistRepository.deleteBlacklist(receiverId);
  }
}
