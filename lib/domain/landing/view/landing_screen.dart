import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/domain/landing/view/first_landing_screen.dart';
import 'package:gachtaxi_app/domain/landing/view/second_landing_screen.dart';
import 'package:gachtaxi_app/domain/landing/view/third_landing_screen.dart';
import 'package:gachtaxi_app/common/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/domain/sign-up/view/email_verification_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();

  void _navigateToEmailVerification() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
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
              controller: _pageController,
              children: const [
                FirstLandingScreen(),
                SecondLandingScreen(),
                ThirdLandingScreen(),
              ],
            ),
          ),

          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const ScrollingDotsEffect(
              activeDotColor: AppColors.primary,
              dotColor: AppColors.darkGray,
              dotHeight: 10,
              dotWidth: 10,
              fixedCenter: false,
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                CustomButton(
                  text: "카카오로 시작하기",
                  backgroundColor: Color(0xFFFFE001),
                  textColor: Colors.black,
                  onPressed: _navigateToEmailVerification,
                  icon: SvgPicture.asset('assets/icons/kakao_icon.svg', width: 20),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: "구글로 시작하기",
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/google_icon.svg', width: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}