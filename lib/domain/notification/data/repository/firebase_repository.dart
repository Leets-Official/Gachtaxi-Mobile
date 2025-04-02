import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';

part 'firebase_repository.g.dart';

@riverpod
FirebaseRepository firebaseRepository(Ref ref) => FirebaseRepository();

class FirebaseRepository {
  static const FCM_TOKEN_PATCH_PATH = "/api/members/firebase";

  Future<void> updateFcmToken(String token) async {
    try {
      final response = await ApiClient.patch(
        FCM_TOKEN_PATCH_PATH,
        body: {"fcmToken": token},
      );

      if (response.code != 200) {
        throw Exception("FCM 토큰 업데이트 실패");
      }
    } catch (e) {
      rethrow;
    }
  }
}

