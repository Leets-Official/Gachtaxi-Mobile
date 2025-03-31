import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

class Modal extends StatelessWidget {
  final Widget content;
  final double height;
  final String buttonText;
  final VoidCallback? onPress;

  const Modal({
    super.key,
    required this.content,
    required this.height,
    required this.buttonText,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.neutralComponent,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 70.h),
              child: content,
            ),

            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              child: Button(
                buttonText: buttonText,
                onPressed: onPress ?? () {},
              ),
            ),

            Positioned(
              top: 8.h,
              right: 8.w,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: 20.w,
                ),
                splashRadius: 18.r,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
