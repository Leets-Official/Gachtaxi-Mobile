import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class LogoutOrWithdrawModal extends ConsumerWidget {
  const LogoutOrWithdrawModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 353.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.neutralComponent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.spaceCommon,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.spaceCommon),
            const Text(
              '정말 떠나실건가요?',
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppTypography.fontSizeExtraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceExtraLarge),
            const Text(
              '로그아웃 및 회원탈퇴를 진행할 수 있어요',
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: AppTypography.fontSizeSmall,
              ),
            ),
            const Spacer(),
            Button(
              buttonText: '로그아웃',
              onPressed: () {},
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
            Button(
              buttonText: '회원탈퇴',
              backgroundColor: AppColors.neutralComponent,
              borderColor: AppColors.primary,
              textColor: AppColors.primary,
              onPressed: () {},
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
          ],
        ),
      ),
    );
  }
}
