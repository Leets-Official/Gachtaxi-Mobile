import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class ChatEnterExitMessage extends StatelessWidget {
  final String messageText;

  const ChatEnterExitMessage({super.key, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Align(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 275.w,
            maxHeight: 20.h,
          ),
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColors.neutralComponent,
            borderRadius: BorderRadius.circular(32.r),
          ),
          alignment: Alignment.center,
          child: Text(
            messageText,
            style: TextStyle(
              color: AppColors.white.withAlpha(200),
              fontSize: 11.sp,
              fontWeight: AppTypography.fontWeightMedium,
              height: 0.8.h,
            ),
          ),
        ),
      ),
    );
  }
}
