import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              width: 15.w,
              height: 57.h,
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LocationField(label: "가천대 정문"),
                  Divider(color: AppColors.neutralAccent),
                  _LocationField(label: "가천대 AI 공학관"),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
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
  final String label;

  const _LocationField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextFormField(
        initialValue: label,
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
