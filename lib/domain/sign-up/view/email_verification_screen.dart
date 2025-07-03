import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:gachtaxi_app/domain/sign-up/utils/timer_manager.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/domain/sign-up/modal/term_agreement_modal.dart';
import 'package:gachtaxi_app/common/util/modal_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/domain/sign-up/services/email_verification_service.dart';

final timerManagerProvider = ChangeNotifierProvider((ref) => TimerManager());

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmailVerificationView();
  }
}

class EmailVerificationView extends ConsumerStatefulWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  @override
  ConsumerState<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends ConsumerState<EmailVerificationView> {
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

  void handleSendCode() async {
    final timerManager = ref.read(timerManagerProvider);

    try {
      final email = emailController.text.trim();
      await ref.read(emailVerificationProvider.notifier).sendCode(email);

      setState(() {
        isCodeInputVisible = true;
      });

      timerManager.startTimer();
      Future.delayed(const Duration(milliseconds: 300), () {
        FocusScope.of(context).requestFocus(codeFocusNode);
      });
    } catch (e) {
      ToastShowUtils(context: context).showSuccess("이메일 인증에 실패하였습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final timerManager = ref.watch(timerManagerProvider);

    return DefaultLayout(
      hasAppBar: true,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "가치 택시에 오신 것을\n환영합니다!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeExtraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceExtraMedium),
                const Text(
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
                SizedBox(height: 16.h),
                Button(
                  buttonText: timerManager.isFirstClick
                      ? "인증번호 받기"
                      : "인증번호 다시 받기 (${timerManager.formattedTime})",
                  backgroundColor: AppColors.primary,
                  textColor: Colors.black,
                  onPressed: handleSendCode,
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
                  SizedBox(height: 16.h),
                  Button(
                    buttonText: "인증확인",
                    backgroundColor: AppColors.primary,
                    textColor: Colors.black,
                      onPressed: () async {
                        final email = emailController.text.trim();
                        final code = codeController.text.trim();
                        try {
                          await ref.read(emailVerificationProvider.notifier).verifyCode(email, code);

                          ModalUtils.showCommonBottomSheet(
                            context: context,
                            content: TermsAgreementModal(),
                          );
                        } catch (e) {
                          ToastShowUtils(context: context).showSuccess("인증번호가 올바르지 않습니다.");
                          return;
                        }
                      }

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
