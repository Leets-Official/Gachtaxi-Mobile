import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/util/token_storage.dart';
import 'package:gachtaxi_app/domain/notification/application/util/firebase_messaging_util.dart';
import 'package:gachtaxi_app/domain/notification/data/service/firebase_token_service.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppInitializer {
  static Future<void> initialize(WidgetRef ref) async {
    print("어플 초기화 시작");
    await initializeDateFormatting();
    await dotenv.load();
    await TokenStorage.saveDevToken();

    await _setGoogleMapsApiKey();

    await requestNotificationPermission();
    await initializeNotification();

    if (Platform.isAndroid) { //아이폰은 개발자 계정 없이 사용 불가
      final service = ref.read(firebaseTokenServiceProvider);
      registerTokenRefreshListener(service);
    }
  }

  static Future<void> _setGoogleMapsApiKey() async {
    final methodChannel = MethodChannel('com.gachtaxi.app/maps');
    try {
      final key = dotenv.env['GOOGLE_MAPS_API_KEY'];
      if (key != null && key.isNotEmpty) {
        await methodChannel.invokeMethod('setGoogleMapsApiKey', key);
      } else {
        print('❌ .env 파일에 GOOGLE_MAPS_API_KEY가 설정되지 않았습니다.');
      }
    } catch (e) {
      print('❌ Google Maps API 키 설정 오류: $e');
    }
  }
}
