import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/layout/main_screen.dart';
import 'package:gachtaxi_app/common/util/slide_page_route.dart';
import 'package:gachtaxi_app/common/components/input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/domain/sign-up/components/gender_toggle.dart';
import 'package:gachtaxi_app/domain/sign-up/components/profile_upload.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Gender selectedGender = Gender.male;
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController realNameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "사진과 이름을\n등록해주세요",
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeExtraLarge,
                    fontWeight: AppTypography.fontWeightBold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceCommon),
                const Text(
                  "본명과 학번은 공개되지 않아요",
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeSmall,
                    fontWeight: AppTypography.fontWeightMedium,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceExtraLarge),
                ProfileAvatar(),
                const SizedBox(height: AppSpacing.spaceExtraLarge),
                InputField(
                  label: "닉네임",
                  hintText: "닉네임을 입력해주세요",
                  controller: nicknameController,
                  autoFocus: true,
                ),
                SizedBox(height: 16.h),
                const SizedBox(height: AppSpacing.spaceExtraMedium),
                InputField(
                  label: "본명",
                  hintText: "본명을 입력해주세요",
                  controller: realNameController,
                  autoFocus: true,
                ),
                SizedBox(height: 16.h),
                const SizedBox(height: AppSpacing.spaceExtraMedium),
                InputField(
                  label: "학번",
                  hintText: "ex) 202433333",
                  controller: studentIdController,
                  autoFocus: true,
                ),
                SizedBox(height: 16.h),
                const SizedBox(height: AppSpacing.spaceExtraMedium),
                const Text(
                  "성별",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeSmall,
                    fontWeight: AppTypography.fontWeightMedium,
                  ),
                ),
                SizedBox(height: 16.h),
                GenderToggle(
                  selectedGender: selectedGender,
                  onGenderChanged: (Gender gender) {
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                ),
                const SizedBox(height: AppSpacing.spaceCommon),
                const Text(
                  "* 프로필 정보는 회원 식별, 서비스 이용의 목적으로만\n  활용되며, 개인정보 수집 약관내용에 따라 보관됩니다.",
                  style: TextStyle(
                    fontSize: AppTypography.fontSizeExtraExtraSmall,
                    fontWeight: AppTypography.fontWeightMedium,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceExtraLarge),
                const SizedBox(height: AppSpacing.spaceExtraLarge),
                Button(
                  buttonText: "시작하기",
                  backgroundColor: AppColors.primary,
                  textColor: Colors.black,
                  onPressed: () {
                    //회원가입 완료 로직 추가
                    Navigator.pushAndRemoveUntil(
                      context,
                      SlidePageRoute(screen: const MainScreen()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.spaceCommon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
