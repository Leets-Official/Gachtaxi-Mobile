import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class SecondLandingScreen extends StatelessWidget {
  const SecondLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralDark,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "키워드로 매칭하기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: AppTypography.fontWeightBold,
              ),

            ),
            const SizedBox(height: 10),
            const Text(
              "키워드 기능을 통해\n매칭 상대 고르기",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: AppTypography.fontSizeSmall,
                fontWeight: AppTypography.fontWeightMedium,
              ),
            ),
            const SizedBox(height: 50),

            Image.asset(
              'assets/icons/second_landing.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
