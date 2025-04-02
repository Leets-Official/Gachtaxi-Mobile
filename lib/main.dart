import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/splash_screen.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); // ✅ 앱 시작 전 Firebase 먼저 초기화


  // 앱 실행
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: ThemeData(fontFamily: 'NotoSansKR'),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    ),
  );
}
