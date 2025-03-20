import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/components/button.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

class Modal extends StatelessWidget {
  final Widget content;
  final double height;
  final String buttonText;
  final VoidCallback? onPress;
  final VoidCallback? onClose;

  const Modal({
    super.key,
    required this.content,
    required this.height,
    required this.buttonText,
    this.onPress,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.neutralComponent,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                content,

                SizedBox(height: 16.h),
                Button(
                  buttonText: buttonText,
                  onPressed: onPress ?? () {},
                ),
              ],
            ),
          ),

          Positioned(
            top: 8.h,
            right: 8.w,
            child: IconButton(
              onPressed: onClose ?? () => Navigator.pop(context),
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
    );
  }
}
