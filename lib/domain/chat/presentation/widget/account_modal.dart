import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/modal.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class AccountModal extends StatelessWidget {
  final String accountNumber;

  const AccountModal({super.key, required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    return Modal(
      height: 144.h,
      buttonText: "전송하기",
      onPress: () {},
      content: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Center(
          child: Text(
            accountNumber,
            style: TextStyle(
              color: AppColors.white,
              fontSize: AppTypography.fontSizeMedium.sp,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          ),
        ),
      ),
    );
  }
}