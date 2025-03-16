import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;

  const Button({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: Size(double.infinity, 50.h),
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      onPressed: onPressed ?? () {},
      child: isLoading
          ? SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: textColor ?? AppColors.neutralDark,
                strokeWidth: 4.0,
              ),
            )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(height: AppSpacing.spaceExtraMedium),
          ],
          Text(
            buttonText,
            style: TextStyle(
              color: textColor ?? AppColors.neutralDark,
              fontWeight: AppTypography.fontWeightBold,
              fontSize: AppTypography.fontSizeMedium,
            ),
          ),
        ],
      ),
    );
  }
}