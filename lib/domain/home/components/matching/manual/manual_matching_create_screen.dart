import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/layout/default_layout.dart';
import 'package:gachtaxi_app/domain/home/components/matching/auto/expanded_setting_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/auto/location_card.dart';
import 'package:gachtaxi_app/domain/home/components/matching/manual/TimePickerCard.dart';

class ManualMatchingCreateScreen extends StatelessWidget {
  const ManualMatchingCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      hasAppBar: true,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.spaceCommon),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '수동매칭 등록',
                style: TextStyle(
                  fontSize: AppTypography.fontSizeExtraLarge * 1.2,
                  fontWeight: AppTypography.fontWeightBold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: AppSpacing.spaceExtraLarge),
              Expanded(
                child: ListView(
                  children: [
                    LocationCard(),
                    const SizedBox(height: AppSpacing.spaceCommon),
                    TimePickerCard(),
                    const SizedBox(height: AppSpacing.spaceCommon),
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
                    const SizedBox(height: AppSpacing.spaceCommon),
                    _buildDescription(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.neutralComponent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.spaceCommon,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '추가 내용',
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppTypography.fontSizeMedium,
                fontWeight: AppTypography.fontWeightRegular,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceLarge),
            TextField(
              minLines: 10,
              maxLines: 10,
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: 16,
              ),
              cursorColor: AppColors.darkGray,
              decoration: InputDecoration(
                hintText: '추가 내용을 입력해주세요',
                hintStyle: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: AppColors.darkGray),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: AppColors.darkGray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: AppColors.darkGray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
