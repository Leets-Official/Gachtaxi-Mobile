import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/matching_setting_provider.dart';

class LocationCard extends ConsumerWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태값을 가져와 텍스트 필드 값으로 사용할 이름 설정
    final departureName = ref.watch(matchingSettingNotifierProvider).departure.name;
    final destinationName =
        ref.watch(matchingSettingNotifierProvider).destination.name;

    // TextEditingController 생성하여 값 실시간 업데이트
    final TextEditingController departureController =
        TextEditingController(text: departureName);
    final TextEditingController destinationController =
        TextEditingController(text: destinationName);

    return Container(
      width: double.infinity,
      height: 106.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.neutralComponent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: AppSpacing.spaceCommon,
            bottom: AppSpacing.spaceCommon,
            left: AppSpacing.spaceCommon,
            right: AppSpacing.spaceExtraSmall),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/start_to_end_icon.svg',
              width: 25.w,
              height: 66.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LocationField(controller: departureController),
                  Divider(color: AppColors.darkGray),
                  _LocationField(controller: destinationController),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // 상태 변경 후 값 업데이트
                ref.read(matchingSettingNotifierProvider.notifier).toggleLocation();
              },
              icon: SvgPicture.asset(
                'assets/icons/change_location_icon.svg',
                width: 15.5.w,
                height: 20.5.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 입력 필드 UI
class _LocationField extends StatelessWidget {
  final TextEditingController controller;

  const _LocationField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextFormField(
        controller: controller, // TextController 사용
        readOnly: true,
        style: TextStyle(
          color: Colors.white,
          fontWeight: AppTypography.fontWeightSemibold,
        ),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
