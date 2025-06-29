import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final Color? borderColor;

  const Button({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.icon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = 50.h;

    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(double.infinity, buttonHeight),
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: textColor ?? AppColors.neutralDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
      onPressed: (isLoading || onPressed == null) ? null : onPressed,
      child: SizedBox(
        height: buttonHeight,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading
                ? SizedBox(
                    key: const ValueKey('loading'),
                    width: 24.w,
                    height: 24.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          textColor ?? AppColors.neutralDark),
                    ),
                  )
                : Row(
                    key: const ValueKey('text'),
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon!,
                        const SizedBox(width: AppSpacing.spaceExtraMedium),
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
          ),
        ),
      ),
    );
  }
}
