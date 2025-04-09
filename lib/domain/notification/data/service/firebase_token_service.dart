import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/notification/data/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_token_service.g.dart';

@riverpod
FirebaseTokenService firebaseTokenService(Ref ref) {
  return FirebaseTokenService(
    repository: ref.watch(firebaseRepositoryProvider),
  );
}

class FirebaseTokenService {
  final FirebaseRepository _repository;

  FirebaseTokenService({required FirebaseRepository repository})
      : _repository = repository;

  Future<void> updateFcmToken(String token) async {
    await _repository.updateFcmToken(token);
  }
}
