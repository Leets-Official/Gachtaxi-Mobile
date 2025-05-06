import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/manual_matching_change_provider.dart';

class SendMyMatchingScreenModal extends ConsumerWidget {
  const SendMyMatchingScreenModal({super.key});

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
              '매칭 참여가 완료되었어요!',
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppTypography.fontSizeExtraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceExtraLarge),
            const Text(
              '마이 매칭에서 지금까지 예약한 매칭들을\n확인할 수 있어요',
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: AppTypography.fontSizeSmall,
              ),
            ),
            const Spacer(),
            Button(
              buttonText: '나의 매칭',
              onPressed: () {
                ref
                    .read(manualMatchingChangeNotifierProvider.notifier)
                    .toggleCategory();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
            Button(
              buttonText: '닫기',
              backgroundColor: AppColors.neutralComponent,
              borderColor: AppColors.primary,
              textColor: AppColors.primary,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: AppSpacing.spaceCommon),
          ],
        ),
      ),
    );
  }
}
