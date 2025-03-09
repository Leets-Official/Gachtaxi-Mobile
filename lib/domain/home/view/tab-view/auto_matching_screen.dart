import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/components/matching/auto/expanded_setting_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/auto/location_card.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/sheet_height_provider.dart';

class AutoMatchingScreen extends ConsumerWidget {
  const AutoMatchingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetHeightState = ref.watch(sheetHeightNotifierProvider);
    final containerHeight = sheetHeightState.containerHeight;
    final isExpanded = containerHeight > sheetHeightState.minHeight * 1.3;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '바로 매칭',
              style: TextStyle(
                fontSize: AppTypography.fontSizeExtraLarge,
                color: Colors.white,
                fontWeight: AppTypography.fontWeightBold,
              ),
            ),
            SizedBox(
              height: isExpanded
                  ? AppSpacing.spaceExtraLarge
                  : AppSpacing.spaceCommon,
            ),
            LocationCard(),
            const SizedBox(height: AppSpacing.spaceCommon),
            if (isExpanded) ...[
              ExpandedSettingCard(
                cardTitle: '친구 초대',
                cardListElement: [
                  '봉식이',
                  '길구봉구',
                  '상놈',
                  '봉식이',
                  '길구봉구',
                  '상놈',
                ],
              ),
              const SizedBox(height: AppSpacing.spaceCommon),
              ExpandedSettingCard(
                cardTitle: '키워드 선택',
                cardListElement: ['금연', '동성'],
                isTag: true,
              ),
              const SizedBox(height: AppSpacing.spaceLarge),
            ] else ...[
              Text(
                '추가 설정을 통해 상세한 매칭을 할 수 있어요',
                style: TextStyle(
                  fontSize: AppTypography.fontSizeExtraSmall,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceCommon),
            ],
            Button(buttonText: '매칭 시작'),
          ],
        ),
      ),
    );
  }
}
