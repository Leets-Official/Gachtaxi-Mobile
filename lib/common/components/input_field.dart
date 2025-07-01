import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class InputField extends StatefulWidget {
  final String? label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Function(String)? onSubmitted;
  final double? labelFontSize;
  final bool? hasSearchIcon;
  final Function()? onSearchIconPressed;

  const InputField({
    super.key,
    this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.autoFocus = false,
    this.onSubmitted,
    this.labelFontSize,
    this.hasSearchIcon = false,
    this.onSearchIconPressed,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.labelFontSize ?? AppTypography.fontSizeSmall,
              fontWeight: AppTypography.fontWeightMedium,
            ),
          ),
        SizedBox(height: 16.h),
        Stack(
          children: [
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
                    color: AppColors.inputGrey,
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
            if (widget.hasSearchIcon!)
              Positioned(
                right: 0.h,
                top: 3.h,
                child: IconButton(
                  onPressed: widget.onSearchIconPressed,
                  icon: SvgPicture.asset(
                    'assets/icons/search_on_icon.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
