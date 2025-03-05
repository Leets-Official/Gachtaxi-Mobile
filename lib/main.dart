import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ✅ Riverpod 추가
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'domain/chat/presentation/view/chat_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
      ),
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
