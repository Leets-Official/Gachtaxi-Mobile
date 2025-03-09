import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const Button({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      onPressed: onPressed ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceSmall),
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.black,
              fontWeight: AppTypography.fontWeightBold,
              fontSize: AppTypography.fontSizeLarge),
        ),
      ),
    );
  }
}
