import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Function(String)? onSubmitted;

  const InputField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
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
    double screenWidth = MediaQuery.of(context).size.width;

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
        SizedBox(height: screenWidth * 0.05),

        SizedBox(
          height: 50,
          child: TextField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: widget.isPassword,
            keyboardType: widget.keyboardType,
            autofocus: widget.autoFocus,
            style: TextStyle(
              color: Colors.white,
              fontSize: AppTypography.fontSizeSmall,
              fontWeight: AppTypography.fontWeightMedium,
            ),
            onSubmitted: widget.onSubmitted, // ✅ 엔터 키 입력 이벤트 추가
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.neutralDark,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color(0xFF787272),
                fontSize: AppTypography.fontSizeSmall,
                fontWeight: AppTypography.fontWeightMedium,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFF787272)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFF787272)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              suffixIcon: widget.suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
