import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class ChatActionBar extends StatelessWidget {
  const ChatActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      width: double.infinity,
      height: 144.h,
      decoration: BoxDecoration(
        color: AppColors.neutralComponent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActionItem(
            icon: "assets/icons/taxi_on_icon.svg",
            label: "택시 호출",
          ),
          _buildActionItem(
            icon: "assets/icons/account_icon.svg",
            label: "계좌 전송",
          ),
          _buildActionItem(
            icon: "assets/icons/matching_stop_icon.svg",
            label: "매칭 마감",
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({required String icon, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: AppColors.neutralDark,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 28.w,
              height: 28.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(
            color: AppColors.lightGray,
            fontSize: AppTypography.fontSizeSmall.sp,
            fontWeight: AppTypography.fontWeightMedium,
          ),
        ),
      ],
    );
  }
}
