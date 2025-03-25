import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/constants/colors.dart';

class ProfileImage {
  static Widget circleAvatar({
    required String imageUrl,
    double size = 18.0,
  }) {
    return CircleAvatar(
      radius: size.r,
      backgroundColor: AppColors.darkGray,
      foregroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
      child: imageUrl.isEmpty
          ? SvgPicture.asset(
        "assets/icons/unknown.svg",
      )
          : null,
    );
  }
}
