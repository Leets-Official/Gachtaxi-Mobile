import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

class ProfileImage {
  static Widget squareAvatar({
    required String imageUrl,
    double size = 36, // 기본 사이즈
  }) {
    if (imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: size.w,
          height: size.w,
          color: AppColors.darkGray,
          child: Image.network(
            imageUrl,
            width: size.w,
            height: size.w,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else { // 기본 프사는 svg 형태로 출력
      return SvgPicture.asset(
        "assets/icons/unknown.svg",
        width: size.w,
        height: size.w,
      );
    }
  }
}

