import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/domain/sign-up/utils/timer_manager.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerManager(),
      child: const EmailVerificationView(),
    );
  }
}

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode codeFocusNode = FocusNode();

  bool isCodeInputVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    emailFocusNode.dispose();
    codeFocusNode.dispose();
    super.dispose();
  }

  void handleSendCode(TimerManager timerManager) {
    setState(() {
      isCodeInputVisible = true;
    });

    timerManager.startTimer();

    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(codeFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final timerManager = context.watch<TimerManager>();

    return DefaultLayout(
      hasAppBar: true,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "가치 택시에 오신 것을\n환영합니다!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeExtraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceExtraMedium),                const Text(
                  "가천대학교 이메일로 인증할게요",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeMedium,
                    fontWeight: AppTypography.fontWeightMedium,
                  ),
                ),
                const SizedBox(height: 30),

                InputField(
                  label: "이메일",
                  hintText: "gachon.ac 이메일을 입력해주세요",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  autoFocus: true,
                ),

                const SizedBox(height: AppSpacing.spaceExtraMedium),

                Button(
                  buttonText: timerManager.isFirstClick
                      ? "인증번호 받기"
                      : "인증번호 다시 받기 (${timerManager.formattedTime})",
                  backgroundColor: AppColors.primary,
                  textColor: Colors.black,
                  onPressed: () {
                    handleSendCode(timerManager);
                  },
                  icon: const SizedBox(),
                ),

                const SizedBox(height: 40),

                if (isCodeInputVisible) ...[
                  InputField(
                    label: "인증번호",
                    hintText: "인증번호를 입력해주세요",
                    controller: codeController,
                    keyboardType: TextInputType.number,
                    focusNode: codeFocusNode,
                  ),
                  const SizedBox(height: AppSpacing.spaceExtraMedium),                  SizedBox(
                    width: double.infinity,
                    child: Button(
                      buttonText: "인증확인",
                      backgroundColor: AppColors.primary,
                      textColor: Colors.black,
                      onPressed: () {
                        // TODO: 인증번호 검증 로직 추가
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: SvgPicture.asset(
              'assets/icons/sign_up_taxi.svg',
              width: 86,
            ),
          ),
        ],
      ),
    );
  }
}
