import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';


class NewMessagesIndicator extends StatelessWidget {
  const NewMessagesIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 1.h,
              color: AppColors.darkGray,
            ),
          ),
          const Text(
            "New Messages",
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: AppTypography.fontSizeExtraSmall,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 1.h,
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
