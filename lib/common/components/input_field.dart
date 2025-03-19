import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Function(String)? onSubmitted;

  const InputField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.autoFocus = false,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: AppTypography.fontSizeSmall,
            fontWeight: AppTypography.fontWeightMedium,
          ),
        ),
        SizedBox(height: 16.h),

        SizedBox(
          height: 50.h,
          child: TextField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            autofocus: widget.autoFocus,
            style: TextStyle(
              color: Colors.white,
              fontSize: AppTypography.fontSizeSmall,
              fontWeight: AppTypography.fontWeightMedium,
            ),
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.neutralDark,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color:  AppColors.inputGrey,
                fontSize: AppTypography.fontSizeSmall,
                fontWeight: AppTypography.fontWeightMedium,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.inputGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.inputGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),

      ],
    );
  }
}
