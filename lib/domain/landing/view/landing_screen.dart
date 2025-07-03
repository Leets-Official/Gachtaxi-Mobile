import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/util/logger.dart';
import 'package:gachtaxi_app/domain/landing/components/first_landing_screen.dart';
import 'package:gachtaxi_app/domain/landing/components/second_landing_screen.dart';
import 'package:gachtaxi_app/domain/landing/components/third_landing_screen.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/domain/landing/model/auth_result.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/sign-up/view/email_verification_screen.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/domain/home/view/home_screen.dart';
import 'package:gachtaxi_app/domain/landing/services/kakao_auth_service.dart';
import 'package:gachtaxi_app/domain/landing/services/google_auth_service.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingScreen> {
  final PageController pageController = PageController();

  void _startSocialLogin({
    required Future<AuthResult?> Function(BuildContext) loginFunction,
  }) async {
    final result = await loginFunction(context);

    if (result == null) {
      logger.e('로그인 결과가 null임');
      return;
    }

    if (result.isUnregistered) {
      Navigator.push(
        context,
        SlidePageRoute(screen: const EmailVerificationScreen()),
      );
    } else {
      Navigator.push(
        context,
        SlidePageRoute(
          screen: HomeScreen(pageController: pageController),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                FirstLandingScreen(),
                SecondLandingScreen(),
                ThirdLandingScreen(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const ScrollingDotsEffect(
              activeDotColor: AppColors.primary,
              dotColor: AppColors.darkGray,
              dotHeight: 10,
              dotWidth: 10,
              fixedCenter: false,
            ),
          ),
          const SizedBox(height: AppSpacing.spaceExtraMedium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                Button(
                  buttonText: "카카오로 시작하기",
                  backgroundColor: const Color(0xFFFFE001),
                  textColor: Colors.black,
                  icon: SvgPicture.asset('assets/icons/kakao_icon.svg',
                      width: 20),
                  onPressed: () => _startSocialLogin(
                    loginFunction: KakaoAuthService.loginWithKakao,
                  ),
                ),
                SizedBox(height: AppSpacing.spaceCommon),
                Button(
                  buttonText: "구글로 시작하기",
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  icon: SvgPicture.asset('assets/icons/google_icon.svg',
                      width: 20),
                  onPressed: () => _startSocialLogin(
                    loginFunction: GoogleAuthService.loginWithGoogle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
