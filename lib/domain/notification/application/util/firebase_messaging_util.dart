import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gachtaxi_app/domain/notification/application/util/notification_overlay.dart';
import 'package:gachtaxi_app/domain/notification/data/service/firebase_token_service.dart';
import 'package:permission_handler/permission_handler.dart';

// 백그라운드 메시지 핸들러
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("📩 백그라운드 메시지 처리: ${message.notification?.body}");
}

// 백그라운드 핸들러 등록 및 포그라운드 우선순위 설정
Future<void> initializeNotification() async {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((message) {
    final title = message.notification?.title ?? message.data['title'] ?? '알림';
    final body = message.notification?.body ?? message.data['body'] ?? '내용';

    NotificationOverlay.show(title: title, body: body);
  });

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

// 개발용 토큰 조회 메서드
Future<void> getFcmToken() async {
  final token = await FirebaseMessaging.instance.getToken();
  print("📌 내 디바이스 토큰: $token");
}

// FCM device token 등록
Future<void> registerTokenRefreshListener(FirebaseTokenService service) async {
  final token = await FirebaseMessaging.instance.getToken();

  if (token != null) {
    await service.updateFcmToken(token);
  }

  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
    await service.updateFcmToken(newToken);
  });
}

// 알림 권한 요청
Future<void> requestNotificationPermission() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}
