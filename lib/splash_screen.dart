import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/app_initializer.dart';
import 'package:gachtaxi_app/domain/home/view/home_screen.dart';
import 'package:gachtaxi_app/domain/landing/view/landing_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    try {
      await AppInitializer.initialize(ref);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LandingScreen()),
      );
    } catch (e, stack) {
      print('❌ 초기화 중 에러: $e\n$stack');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
