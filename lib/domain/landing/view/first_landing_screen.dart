import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class FirstLandingScreen extends StatelessWidget {
  const FirstLandingScreen({Key? key}) : super(key: key);

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
              "지금 바로 매칭하기",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: AppTypography.fontWeightBold,
              ),

            ),
            const SizedBox(height: 10),
            const Text(
              "자동 매칭 기능을 통해\n현재 위치에서 매칭하기",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: AppTypography.fontSizeSmall,
                fontWeight: AppTypography.fontWeightMedium,
              ),
            ),
            const SizedBox(height: 50),

            Image.asset(
              'assets/icons/first_landing.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
