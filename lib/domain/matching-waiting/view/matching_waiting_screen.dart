import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:lottie/lottie.dart';

class MatchingWaitingScreen extends StatelessWidget {
  const MatchingWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasAppBar: true,
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '가치 탈 인원을\n 찾는 중이에요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppTypography.fontSizeExtraLarge,
                        fontWeight: AppTypography.fontWeightSemibold,
                      ),
                    ),
                    const SizedBox(
                      height: AppSpacing.spaceMedium,
                    ),
                    Text(
                      '3/4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppTypography.fontSizeLarge,
                        fontWeight: AppTypography.fontWeightSemibold,
                      ),
                    ),
                  ],
                ),
              ),
              Lottie.asset(
                'assets/images/taxi_loading.json',
                width: double.infinity,
                height: 320,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceCommon),
                  child: Center(child: Button(buttonText: '채팅방')),
                ),
              ),
            ]),
      ),
    );
  }
}
