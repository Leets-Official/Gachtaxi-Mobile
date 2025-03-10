import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/domain/home/view/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // Flutter 바인딩 초기화
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  // .env 파일 로드
  await dotenv.load();

  // Google Maps API 키를 .env 파일에서 가져와 네이티브 코드로 전달
  final methodChannel = MethodChannel('com.gachtaxi.app/maps');
  try {
    final googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
    if (googleMapsApiKey != null && googleMapsApiKey.isNotEmpty) {
      await methodChannel.invokeMethod('setGoogleMapsApiKey', googleMapsApiKey);
    } else {
      print('❌ .env 파일에 GOOGLE_MAPS_API_KEY가 설정되지 않았습니다.');
    }
  } catch (e) {
    print('❌ Google Maps API 키 설정 오류: $e');
  }

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'NotoSansKR',
            ),
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    ),
  );
}
